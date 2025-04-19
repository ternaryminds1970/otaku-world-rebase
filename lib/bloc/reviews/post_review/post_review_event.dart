part of 'post_review_bloc.dart';

abstract class PostReviewEvent extends Equatable {
  const PostReviewEvent();
}

class FetchReview extends PostReviewEvent {
  final int userId;
  final int mediaId;
  final GraphQLClient client;

  const FetchReview(this.userId, this.mediaId, this.client);

  @override
  List<Object> get props => [userId, mediaId];
}

class SubmitReview extends PostReviewEvent {
  final int? reviewId; // null if creating new
  final int mediaId;
  final String body;
  final String summary;
  final int score;
  final bool isPrivate;
  final GraphQLClient client;

  const SubmitReview({
    this.reviewId,
    required this.mediaId,
    required this.body,
    required this.summary,
    required this.score,
    required this.client,
    this.isPrivate = false,
  });

  @override
  List<Object?> get props =>
      [reviewId, mediaId, body, summary, score, isPrivate];
}

class DeleteReview extends PostReviewEvent {
  final int reviewId;
  final GraphQLClient client;

  const DeleteReview({
    required this.reviewId,
    required this.client,
  });

  @override
  List<Object?> get props => [reviewId, client];
}
