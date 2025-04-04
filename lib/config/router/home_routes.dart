part of 'router.dart';

final homeRoutes = [
  // Reviews screen
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.reviews,
    builder: (state) {
      return BlocProvider(
        create: (context) => ReviewsBloc(),
        child: const ReviewScreen(),
      );
    },
    directionTween: SlideTransitionRoute.leftToRightTween,
  ),
  // Review detail
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.reviewDetail,
    builder: (state) {
      return BlocProvider(
        create: (context) => ReviewDetailBloc(
          reviewId: int.parse(state.uri.queryParameters['id']!),
        ),
        child: ReviewDetailScreen(
          bloc: state.extra != null ? state.extra as Bloc : null,
        ),
      );
    },
    directionTween: SlideTransitionRoute.leftToRightTween,
  ),
  // Calendar screen
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.calendar,
    builder: (state) => const CalendarScreen(),
    directionTween: SlideTransitionRoute.leftToRightTween,
  ),
  // Search Screen
  GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.search,
    builder: (context, state) => BlocProvider(
      create: (context) => SearchBloc(),
      child: const SearchScreen(),
    ),
  ),
  // Post Review
  GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.postReview,
    builder: (context, state) => const PostReviewScreen(),
  ),
  // Trending Anime
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.trendingAnime,
    builder: (state) => const TrendingAnimeScreen(),
    directionTween: SlideTransitionRoute.bottomToTopTween,
  ),
  // Trending Anime Slider
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.trendingAnimeSlider,
    builder: (state) => const TrendingAnimeSlider(),
    directionTween: SlideTransitionRoute.bottomToTopTween,
  ),
  // Recommended Anime
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.recommendedAnime,
    builder: (state) => const RecommendedAnimeScreen(),
    directionTween: SlideTransitionRoute.bottomToTopTween,
  ),
  // Recommended Anime Slider
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.recommendedAnimeSlider,
    builder: (state) => const RecommendedAnimeSlider(),
    directionTween: SlideTransitionRoute.bottomToTopTween,
  ),
  // Trending Manga
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.trendingManga,
    builder: (state) => const TrendingMangaScreen(),
    directionTween: SlideTransitionRoute.bottomToTopTween,
  ),
  // Trending Manga Slider
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.trendingMangaSlider,
    builder: (state) => const TrendingMangaSlider(),
    directionTween: SlideTransitionRoute.bottomToTopTween,
  ),
  // Recommended Manga
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.recommendedManga,
    builder: (state) => const RecommendedMangaScreen(),
    directionTween: SlideTransitionRoute.bottomToTopTween,
  ),
  // Recommended Manga Slider
  SlideTransitionRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: RouteConstants.recommendedMangaSlider,
    builder: (state) => const RecommendedMangaSlider(),
    directionTween: SlideTransitionRoute.bottomToTopTween,
  ),
];
