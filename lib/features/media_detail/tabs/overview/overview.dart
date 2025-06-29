import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/bloc/paginated_data/paginated_data_bloc.dart';
import 'package:otaku_world/core/ui/images/cover_image.dart';
import 'package:otaku_world/core/ui/shimmers/detail_screens/shimmer_details.dart';
import 'package:otaku_world/features/media_detail/models/recommendations_parameters.dart';
import 'package:otaku_world/features/media_detail/tabs/overview/widgets/description.dart';
import 'package:otaku_world/features/media_detail/tabs/overview/widgets/relations.dart';
import 'package:otaku_world/features/media_detail/tabs/overview/widgets/tags.dart';
import 'package:otaku_world/graphql/__generated/graphql/schema.graphql.dart';
import 'package:otaku_world/utils/extensions.dart';

import '../../../../bloc/graphql_client/graphql_client_cubit.dart';
import '../../../../bloc/media_detail/media_detail_bloc.dart';
import '../../../../bloc/recommendations/recommendation_anime_bloc.dart';
import '../../../../core/ui/media_section/media_section.dart';
import '../../../../utils/app_texts.dart';
import '../../screens/youtube_player_screen.dart';
import 'widgets/links_section.dart';
import 'widgets/overall_information.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    final media =
        (context.read<MediaDetailBloc>().state as MediaDetailLoaded).media;

    final client =
        (context.read<GraphqlClientCubit>().state as GraphqlClientInitialized)
            .client;
    final recommendationBloc =
        context.read<MediaDetailBloc>().recommendationAnimeBloc;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildGenres(context, media.genres),
                const Text(
                  'Description',
                  style: AppTextStyles.titleSectionStyle,
                ),
                const SizedBox(height: 5),
                Description(
                  description: media.description == null
                      ? "No description"
                      : media.description.toString(),
                ),
                if (media.trailer?.id != null &&
                    media.trailer!.id!.isNotEmpty) ...[
                  20.height,
                  const Text(
                    "Trailer",
                    style: AppTextStyles.titleSectionStyle,
                  ),
                  5.height,
                  GestureDetector(
                    onTap: () {
                      YoutubePlayerDialog.showYoutubePlayerDialog(
                        context: context,
                        youtubeId: media.trailer!.id!,
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CoverImage(
                            type: Enum$MediaType.MANGA,
                            imageUrl:
                                'https://img.youtube.com/vi/${media.trailer?.id}/0.jpg',
                          ),
                        ),
                        const Icon(
                          Icons.play_arrow,
                          size: 64,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                const Text(
                  'Info',
                  style: AppTextStyles.titleSectionStyle,
                ),
                const OverallInfo(),
                const SizedBox(height: 20),
                if (media.relations!.edges!.isNotEmpty) ...[
                  const Text(
                    "Relations",
                    style: AppTextStyles.titleSectionStyle,
                  ),
                  const SizedBox(
                    height: 150,
                    child: Relations(),
                  ),
                  20.height,
                ],
                // Recommendations
                if (media.recommendations!.nodes!.isNotEmpty) ...[
                  BlocProvider.value(
                    value: recommendationBloc,
                    child: MediaSection<RecommendationAnimeBloc>(
                      label: "Recommendations",
                      onSliderPressed: () {
                        recommendationBloc.add(LoadData(client));
                        context.push(
                          '/recommendations-slider',
                          extra: recommendationBloc,
                        );
                      },
                      onMorePressed: () {
                        recommendationBloc.add(LoadData(client));
                        context.push(
                          '/recommendations-grid',
                          extra: RecommendationsParameters(
                            bloc: recommendationBloc,
                            mediaType: media.type ?? Enum$MediaType.$unknown,
                          ),
                        );
                      },
                      heroTag: 'trending_anime',
                      leftPadding: 0,
                    ),
                  ),
                  20.height,
                ],
                if (media.tags!.isNotEmpty)
                  Tags(
                    tags: media.tags!,
                  ),
                if (media.externalLinks?.isNotEmpty == true) ...[
                  const Text(
                    "External & Streaming Links",
                    style: AppTextStyles.titleSectionStyle,
                  ),
                  5.height,
                  Wrap(
                    runSpacing: 5,
                    spacing: 5,
                    children: [
                      for (var link in media.externalLinks!)
                        LinkSection(externalLinks: link!),
                    ],
                  ),
                  const SizedBox(height: 20)
                ],
              ],
            ),
          ),
        ),
      ],
    );
    // return ListView(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 10,
    //   ),
    //   children: [
    //     _buildGenres(
    //       context,
    //       media.genres,
    //     ),
    //     const Text(
    //       'Description',
    //       style: AppTextStyles.titleSectionStyle,
    //     ),
    //     const SizedBox(
    //       height: 5,
    //     ),
    //     Description(
    //       description: media.description == null
    //           ? "No description"
    //           : media.description.toString(),
    //     ),
    //     if (media.trailer?.id != null && media.trailer!.id!.isNotEmpty) ...[
    //       20.height,
    //       const Text(
    //         "Trailer",
    //         style: AppTextStyles.titleSectionStyle,
    //       ),
    //       5.height,
    //       GestureDetector(
    //         onTap: () {
    //           YoutubePlayerDialog.showYoutubePlayerDialog(
    //             context: context,
    //             youtubeId: media.trailer!.id!,
    //           );
    //         },
    //         child: Stack(
    //           alignment: Alignment.center,
    //           children: [
    //             AspectRatio(
    //               aspectRatio: 16 / 9,
    //               child: CoverImage(
    //                 type: Enum$MediaType.MANGA,
    //                 imageUrl: media.trailer!.thumbnail ?? '',
    //               ),
    //             ),
    //             const Icon(
    //               Icons.play_arrow,
    //               size: 64,
    //               color: Colors.white,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //
    //     const SizedBox(
    //       height: 20,
    //     ),
    //     const Text(
    //       'Info',
    //       style: AppTextStyles.titleSectionStyle,
    //     ),
    //     const OverallInfo(),
    //     const SizedBox(
    //       height: 20,
    //     ),
    //     if (media.relations!.edges!.isNotEmpty) ...[
    //       const Text(
    //         "Relations",
    //         style: AppTextStyles.titleSectionStyle,
    //       ),
    //       const SizedBox(
    //         height: 150,
    //         child: Relations(),
    //       ),
    //       20.height,
    //     ],
    //
    //     // Recommendations
    //
    //     if (media.recommendations!.nodes!.isNotEmpty) ...[
    //       BlocProvider.value(
    //         value: recommendationBloc,
    //         child: MediaSection<RecommendationAnimeBloc>(
    //           label: "Recommendations",
    //           onSliderPressed: () {
    //             recommendationBloc.add(LoadData(client));
    //             context.push(
    //               '/recommendations-slider',
    //               extra: recommendationBloc,
    //             );
    //           },
    //           onMorePressed: () {
    //             recommendationBloc.add(LoadData(client));
    //             context.push(
    //               '/recommendations-grid',
    //               extra: RecommendationsParameters(
    //                 bloc: recommendationBloc,
    //                 mediaType: media.type ?? Enum$MediaType.$unknown,
    //               ),
    //             );
    //           },
    //           heroTag: 'trending_anime',
    //           leftPadding: 0,
    //         ),
    //       ),
    //       20.height,
    //     ],
    //     if (media.tags!.isNotEmpty)
    //       Tags(
    //         tags: media.tags!,
    //       ),
    //     if (media.externalLinks?.isNotEmpty == true) ...[
    //       const Text(
    //         "External & Streaming Links",
    //         style: AppTextStyles.titleSectionStyle,
    //       ),
    //       5.height,
    //       Wrap(
    //         runSpacing: 5,
    //         spacing: 5,
    //         children: [
    //           for (var link in media.externalLinks!)
    //             LinkSection(externalLinks: link!),
    //         ],
    //       ),
    //       const SizedBox(height: 20)
    //     ],
    //   ],
    // );
  }

  Widget _buildGenres(BuildContext context, List<String?>? genres) {
    if (genres == null) return const Text('No genre');

    List<InlineSpan> textSpans = [];

    for (int i = 0; i < genres.length; i++) {
      String genre = genres[i].toString();
      textSpans.add(
        TextSpan(
          text: genre,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
        ),
      );

      if (i != genres.length - 1) {
        textSpans.add(
          TextSpan(
            text: ' · ',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.sunsetOrange,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
          ),
        );
      }
    }
    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
      maxLines: 2,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
    );
  }
}
