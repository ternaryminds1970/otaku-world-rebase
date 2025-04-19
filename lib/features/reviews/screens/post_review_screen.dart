import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/core/ui/appbars/simple_app_bar.dart';
import 'package:otaku_world/core/ui/buttons/primary_button.dart';
import 'package:otaku_world/core/ui/buttons/primary_outlined_button.dart';
import 'package:otaku_world/features/media_detail/widgets/simple_loading.dart';

import '../../../bloc/graphql_client/graphql_client_cubit.dart';
import '../../../bloc/reviews/post_review/post_review_bloc.dart';
import '../../../config/router/router_constants.dart';
import '../../../core/ui/custom_text_field.dart';
import '../../../core/ui/filters/custom_check_box.dart';
import '../../../utils/ui_utils.dart';

class PostReviewScreen extends HookWidget {
  PostReviewScreen({
    super.key,
    required this.mediaId,
  });

  final int mediaId;
  bool isPrivate = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final reviewSummaryTextField = useTextEditingController();
    final scoreTextField = useTextEditingController();
    final commentTextField = useTextEditingController();
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Post a New Review'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocConsumer<PostReviewBloc, PostReviewState>(
          listener: (context, state) {
            if (state is PostReviewSubmitFailure) {
              UIUtils.showSnackBar(context, state.error);
            } else if (state is ReviewSaved) {
              UIUtils.showSnackBar(context, 'Review Saved successfully');
              if (state.isDeleted != null) {
                context.pop(
                  state.isDeleted,
                );
              } else {
                context.pop(
                  state.savedReview,
                );
              }
            }
          },
          builder: (context, state) {
            if (state is PostReviewInitial || state is ReviewLoading) {
              return const SimpleLoading();
            } else {
              if (state is ReviewLoaded && state.review != null) {
                final review = state.review;
                if (review!.summary != null) {
                  reviewSummaryTextField.text = review.summary!;
                }
                if (review.body != null) {
                  commentTextField.text = review.body!;
                }
                if ((review.score != null)) {
                  scoreTextField.text = review.score!.toString();
                }
                if (review.private != null) {
                  isPrivate = review.private!;
                }
              }
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: PrimaryOutlinedButton(
                          height: 30,
                          horizontalPadding: 10,
                          isSmall: true,
                          onTap: () {
                            final result = context.push(
                              RouteConstants.writeReview,
                              extra: commentTextField,
                            );
                            if (result is String) {
                              commentTextField.text = result as String;
                            }
                          },
                          label: 'Write a Review ',
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'The text must be at least 2200 characters.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Review Summary',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: reviewSummaryTextField,
                        maxLength: 120,
                        hintText: 'Type something here...',
                        maxLines: 3,
                        isShowingCounter: true,
                        validator: (value) {
                          if (value == null && value!.isEmpty) {
                            return 'The text can not be empty';
                          }
                          if (value.length < 20) {
                            return 'The text must be at least 20';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Review summary must be less than 120 characters and greater than 20 characters.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Score',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: CustomTextField(
                                  controller: scoreTextField,
                                  hintText: '',
                                  maxLines: 1,
                                  maxLength: 3,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null && value!.isEmpty) {
                                      return 'The text can not be empty';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'The text must be digit';
                                    }
                                    if (int.parse(value) > 100) {
                                      return 'Score must be withing 100';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Text(
                                ' / 100',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomCheckBox(
                        label: 'Private',
                        onChanged: () {
                          isPrivate = !isPrivate;
                        },
                        initialValue: isPrivate,
                      ),
                      PrimaryButton(
                        onTap: () {
                          if (commentTextField.text.length < 2200) {
                            UIUtils.showSnackBar(context,
                                'The text must be at least 2200 characters.');
                            return;
                          }
                          if (_formKey.currentState?.validate() ?? false) {
                            final client = (context
                                    .read<GraphqlClientCubit>()
                                    .state as GraphqlClientInitialized)
                                .client;
                            context.read<PostReviewBloc>().add(
                                  SubmitReview(
                                    mediaId: mediaId,
                                    body: commentTextField.text.trim(),
                                    summary: reviewSummaryTextField.text.trim(),
                                    score: int.parse(scoreTextField.text),
                                    client: client,
                                    isPrivate: isPrivate,
                                    reviewId: state is ReviewLoaded
                                        ? state.review?.id
                                        : null,
                                  ),
                                );
                          }
                        },
                        label: 'Post Review',
                      ),
                      if (state is ReviewLoaded &&
                          state.review?.id != null) ...[
                        PrimaryOutlinedButton(
                          onTap: () {
                            final client = (context
                                    .read<GraphqlClientCubit>()
                                    .state as GraphqlClientInitialized)
                                .client;
                            context.read<PostReviewBloc>().add(
                                  DeleteReview(
                                    reviewId: state.review!.id,
                                    client: client,
                                  ),
                                );
                          },
                          label: 'Delete Review',
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
