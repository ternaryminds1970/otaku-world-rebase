import 'dart:async';
import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:otaku_world/bloc/paginated_data/paginated_data_bloc.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';

import '../../../graphql/__generated/graphql/reviews/post_review.graphql.dart';
import '../../../graphql/__generated/graphql/reviews/reviews.graphql.dart';
import '../../../graphql/__generated/graphql/schema.graphql.dart';

part '../reviews/reviews_event.dart';
part '../reviews/reviews_state.dart';

class ReviewsBloc extends PaginatedDataBloc<Query$GetReviews, Fragment$Review> {
  final List<Enum$ReviewSort> reviewSortList = [
    Enum$ReviewSort.CREATED_AT_DESC,
    Enum$ReviewSort.CREATED_AT,
    Enum$ReviewSort.SCORE_DESC,
    Enum$ReviewSort.SCORE,
    Enum$ReviewSort.RATING_DESC,
    Enum$ReviewSort.RATING,
    Enum$ReviewSort.UPDATED_AT_DESC,
    Enum$ReviewSort.UPDATED_AT
  ];

  final List<String> mediaSort = ['All', 'Anime', 'Manga'];

  final ValueNotifier<Enum$ReviewSort> reviewSort =
      ValueNotifier<Enum$ReviewSort>(Enum$ReviewSort.CREATED_AT_DESC);
  final ValueNotifier<String> mediaType = ValueNotifier<String>('All');

  void applyFilters(GraphQLClient client) {
    add(ResetData());
    add(LoadData(client));
  }

  bool isNeedForReset() {
    return (reviewSort.value != Enum$ReviewSort.CREATED_AT_DESC ||
        mediaType.value != 'All');
  }

  void resetFilters(GraphQLClient client) {
    if (!isNeedForReset()) {
      return;
    }
    reviewSort.value = Enum$ReviewSort.CREATED_AT_DESC;
    mediaType.value = 'All';
    applyFilters(client);
  }

  @override
  Future<QueryResult<Query$GetReviews>> loadData(GraphQLClient client) {
    return client.query$GetReviews(
      Options$Query$GetReviews(
        fetchPolicy: FetchPolicy.networkOnly,
        variables: Variables$Query$GetReviews(
          page: page,
          mediaSort: reviewSort.value,
          type: getReviewMediaTypeSort(mediaType.value),
        ),
      ),
    );
  }

  @override
  void processData(QueryResult<Query$GetReviews> response) {
    final data = response.parsedData!;
    hasNextPage = data.Page!.pageInfo!.hasNextPage!;
    dev.log('Page: $page', name: 'Review Bloc');
    page++;
    list.addAll(data.Page!.reviews!);
    dev.log('Episodes list size: ${list.length}', name: 'ReviewBloc');
  }

  Enum$MediaType? getReviewMediaTypeSort(String sort) {
    if (sort == 'Manga') {
      return Enum$MediaType.MANGA;
    } else if (sort == 'Anime') {
      return Enum$MediaType.ANIME;
    } else {
      return null;
    }
  }

  void updateReviewRating({
    required int reviewId,
     Enum$ReviewRating? userRating,
    bool isDeleted = false,
    Mutation$SaveReview$SaveReview? savedReview,
  }) {
    dev.log('Updating review $userRating');
    final reviewIndex = list.indexWhere((review) => review?.id == reviewId);
    if (reviewIndex != -1) {
      dev.log('Review index: $reviewIndex');
      final review = list[reviewIndex]!;

      if (savedReview != null || isDeleted) {
        if (isDeleted) {
          list.removeAt(reviewIndex);
        }
        if (savedReview != null) {
          list[reviewIndex] = review.copyWith(
            body: savedReview.body,
            summary: savedReview.summary,
            score: savedReview.score,
            updatedAt: savedReview.updatedAt,
            rating: savedReview.rating,
            ratingAmount: savedReview.ratingAmount,
          );
        }
      } else {
        int ratingDelta = 0;
        int ratingAmountDelta = 0;

        // Handle the old rating
        switch (review.userRating) {
          case Enum$ReviewRating.UP_VOTE:
            ratingDelta--;
            ratingAmountDelta--;
            break;
          case Enum$ReviewRating.DOWN_VOTE:
            ratingAmountDelta--;
            break;
          default:
            break;
        }

        // Handle the new rating
        switch (userRating) {
          case Enum$ReviewRating.UP_VOTE:
            ratingDelta++;
            ratingAmountDelta++;
            break;
          case Enum$ReviewRating.DOWN_VOTE:
            ratingAmountDelta++;
            break;
          default:
            break;
        }

        list[reviewIndex] = review.copyWith(
          rating: (review.rating ?? 0) + ratingDelta,
          ratingAmount: (review.ratingAmount ?? 0) + ratingAmountDelta,
          userRating: userRating,
        );
      }
      dev.log('Updated review: ${list[reviewIndex]}');
      add(UpdateData<Fragment$Review>(list: list));
    }
  }
}
