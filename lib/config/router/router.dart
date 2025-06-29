import 'dart:developer' as dev;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/bloc/charcter_detail/character_detail_bloc.dart';
import 'package:otaku_world/bloc/charcter_detail/media/character_media_bloc.dart';
import 'package:otaku_world/bloc/discover/anime/top_100_anime/top_100_anime_bloc.dart';
import 'package:otaku_world/bloc/discover/characters/birthday_characters_bloc.dart';
import 'package:otaku_world/bloc/discover/characters/most_favorite_characters_bloc.dart';
import 'package:otaku_world/bloc/discover/staff/birthday_staff_bloc.dart';
import 'package:otaku_world/bloc/discover/staff/most_favorite_staff_bloc.dart';
import 'package:otaku_world/bloc/discover/studios/most_favorite_studios_bloc.dart';
import 'package:otaku_world/bloc/media_list/media_list/media_list_bloc.dart';
import 'package:otaku_world/bloc/paginated_data/paginated_data_bloc.dart';
import 'package:otaku_world/bloc/profile/favorite_anime/favorite_anime_bloc.dart';
import 'package:otaku_world/bloc/profile/favorite_characters/favorite_characters_bloc.dart';
import 'package:otaku_world/bloc/profile/favorite_manga/favorite_manga_bloc.dart';
import 'package:otaku_world/bloc/profile/favorite_staff/favorite_staff_bloc.dart';
import 'package:otaku_world/bloc/profile/favorite_studios/favorite_studios_bloc.dart';
import 'package:otaku_world/bloc/profile/my_profile/my_profile_bloc.dart';
import 'package:otaku_world/bloc/profile/profile/profile_bloc.dart';
import 'package:otaku_world/bloc/profile/send_message/send_message_cubit.dart';
import 'package:otaku_world/bloc/recommendations/recommendation_anime_bloc.dart';
import 'package:otaku_world/bloc/reviews/post_review/post_review_bloc.dart';
import 'package:otaku_world/bloc/reviews/review_detail/review_detail_bloc.dart';
import 'package:otaku_world/bloc/routes/redirect_route_cubit.dart';
import 'package:otaku_world/bloc/search/search_characters/search_characters_bloc.dart';
import 'package:otaku_world/bloc/search/search_studios/search_studios_bloc.dart';
import 'package:otaku_world/bloc/social/activities/activities_bloc.dart';
import 'package:otaku_world/bloc/social/activity_replies/activity_replies_bloc.dart';
import 'package:otaku_world/bloc/social/edit_activity_reply/edit_activity_reply_cubit.dart';
import 'package:otaku_world/bloc/social/edit_message_activity/edit_message_activity_cubit.dart';
import 'package:otaku_world/bloc/social/edit_text_activity/edit_text_activity_cubit.dart';
import 'package:otaku_world/bloc/social/post_activity/post_activity_cubit.dart';
import 'package:otaku_world/bloc/social/reply_activity/reply_activity_cubit.dart';
import 'package:otaku_world/bloc/staff_detail/staff_detail_bloc.dart';
import 'package:otaku_world/bloc/studio_detail/studio_detail_bloc.dart';
import 'package:otaku_world/bloc/studio_detail/studio_media/studio_media_bloc.dart';
import 'package:otaku_world/bloc/upcoming_episodes/upcoming_episodes_bloc.dart';
import 'package:otaku_world/config/router/router_constants.dart';
import 'package:otaku_world/core/routes/slide_transition_route.dart';
import 'package:otaku_world/core/routes/slide_transition_shell_route.dart';
import 'package:otaku_world/core/types/types.dart';
import 'package:otaku_world/features/anime_lists/slider_lists/all_time_popular_anime_slider.dart';
import 'package:otaku_world/features/anime_lists/slider_lists/all_time_popular_manga_slider.dart';
import 'package:otaku_world/features/anime_lists/slider_lists/popular_manhwa_slider.dart';
import 'package:otaku_world/features/anime_lists/slider_lists/recommended_anime_slider.dart';
import 'package:otaku_world/features/anime_lists/slider_lists/top_airing_anime_slider.dart';
import 'package:otaku_world/features/anime_lists/slider_lists/top_upcoming_anime_slider.dart';
import 'package:otaku_world/features/anime_lists/slider_lists/trending_anime_slider.dart';
import 'package:otaku_world/features/anime_lists/view_more_lists/all_time_popular_anime_screen.dart';
import 'package:otaku_world/features/anime_lists/view_more_lists/all_time_popular_manga_screen.dart';
import 'package:otaku_world/features/anime_lists/view_more_lists/recommended_anime_screen.dart';
import 'package:otaku_world/features/anime_lists/view_more_lists/top_airing_anime_screen.dart';
import 'package:otaku_world/features/anime_lists/view_more_lists/top_anime.dart';
import 'package:otaku_world/features/anime_lists/view_more_lists/top_manga.dart';
import 'package:otaku_world/features/anime_lists/view_more_lists/top_upcoming_anime_screen.dart';
import 'package:otaku_world/features/auth/screens/login_screen.dart';
import 'package:otaku_world/features/calendar/screens/calendar_screen.dart';
import 'package:otaku_world/features/character_detail/screens/character_detail_screen.dart';
import 'package:otaku_world/features/character_detail/screens/character_media_view_all_list_screen.dart';
import 'package:otaku_world/features/discover/discover_anime/screens/anime_discover_screen.dart';
import 'package:otaku_world/features/discover/discover_anime/screens/anime_slider_screen.dart';
import 'package:otaku_world/features/discover/discover_anime/screens/filter_anime_screen.dart';
import 'package:otaku_world/features/discover/discover_characters/screens/characters_discover_screen.dart';
import 'package:otaku_world/features/discover/discover_manga/screens/filter_manga_screen.dart';
import 'package:otaku_world/features/discover/discover_manga/screens/manga_discover_screen.dart';
import 'package:otaku_world/features/discover/discover_staff/screens/staff_discover_screen.dart';
import 'package:otaku_world/features/discover/discover_studios/screens/studios_discover_screen.dart';
import 'package:otaku_world/features/discover/screens/discover_staff_wrapper.dart';
import 'package:otaku_world/features/discover/screens/entity_screen.dart';
import 'package:otaku_world/features/home/screens/home_screen.dart';
import 'package:otaku_world/features/media_detail/models/recommendations_parameters.dart';
import 'package:otaku_world/features/media_detail/screens/media_detail_screen.dart';
import 'package:otaku_world/features/media_detail/screens/recommendations_grid_screen.dart';
import 'package:otaku_world/features/media_detail/screens/recommendations_slider_screen.dart';
import 'package:otaku_world/features/my_list/screens/anime_list_filter_screen.dart';
import 'package:otaku_world/features/my_list/screens/edit_list_entry_screen.dart';
import 'package:otaku_world/features/my_list/screens/manga_list_filter_screen.dart';
import 'package:otaku_world/features/profile/screens/favorite_anime_screen.dart';
import 'package:otaku_world/features/profile/screens/favorite_anime_slider.dart';
import 'package:otaku_world/features/profile/screens/favorite_characters_screen.dart';
import 'package:otaku_world/features/profile/screens/favorite_manga_screen.dart';
import 'package:otaku_world/features/profile/screens/favorite_staff_screen.dart';
import 'package:otaku_world/features/profile/screens/favorite_studios_screen.dart';
import 'package:otaku_world/features/profile/screens/my_profile_screen.dart';
import 'package:otaku_world/features/profile/screens/profile_screen.dart';
import 'package:otaku_world/features/profile/screens/send_message_screen.dart';
import 'package:otaku_world/features/profile/screens/stats/country_distribution_screen.dart';
import 'package:otaku_world/features/profile/screens/stats/format_distribution_screen.dart';
import 'package:otaku_world/features/profile/screens/stats/length_distribution_screen.dart';
import 'package:otaku_world/features/profile/screens/stats/release_year_distribution_screen.dart';
import 'package:otaku_world/features/profile/screens/stats/score_distribution_screen.dart';
import 'package:otaku_world/features/profile/screens/stats/start_year_distribution_screen.dart';
import 'package:otaku_world/features/profile/screens/stats/status_distribution_screen.dart';
import 'package:otaku_world/features/profile/screens/user_activities_screen.dart';
import 'package:otaku_world/features/profile/screens/user_notifications_screen.dart';
import 'package:otaku_world/features/reviews/screens/preview_review_screen.dart';
import 'package:otaku_world/features/reviews/screens/review_detail_screen.dart';
import 'package:otaku_world/features/reviews/screens/reviews_screen.dart';
import 'package:otaku_world/features/reviews/screens/write_review_screen.dart';
import 'package:otaku_world/features/search/screens/search_screen.dart';
import 'package:otaku_world/features/settings/screens/about_us_screen.dart';
import 'package:otaku_world/features/settings/screens/anime_manga_settings_screen.dart';
import 'package:otaku_world/features/settings/screens/list_settings.dart';
import 'package:otaku_world/features/settings/screens/notifications_settings_screen.dart';
import 'package:otaku_world/features/settings/screens/settings_screen.dart';
import 'package:otaku_world/features/social/screens/activity_screen.dart';
import 'package:otaku_world/features/social/screens/edit_activity_reply_screen.dart';
import 'package:otaku_world/features/social/screens/edit_message_activity_screen.dart';
import 'package:otaku_world/features/social/screens/edit_text_activity_screen.dart';
import 'package:otaku_world/features/social/screens/post_actvity_screen.dart';
import 'package:otaku_world/features/social/screens/reply_activity_screen.dart';
import 'package:otaku_world/features/splash/screens/splash_screen.dart';
import 'package:otaku_world/features/staff_detail/staff_detail_screen.dart';
import 'package:otaku_world/features/studio_detail/screens/studio_detail_screen.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/schema.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/user/user_stats.graphql.dart';
import 'package:otaku_world/observers/go_route_observer.dart';
import 'package:otaku_world/utils/shared_preference_utils.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import '../../bloc/calendar/week_calendar/day/day_bloc.dart';
import '../../bloc/calendar/week_calendar/week_calendar_bloc.dart';
import '../../bloc/discover/anime/all_time_popular_anime/all_time_popular_anime_bloc.dart';
import '../../bloc/discover/anime/top_airing_anime/top_airing_anime_bloc.dart';
import '../../bloc/discover/anime/top_upcoming_anime/top_upcoming_anime_bloc.dart';
import '../../bloc/discover/manga/all_time_popular_manga/all_time_popular_manga_bloc.dart';
import '../../bloc/discover/manga/all_time_popular_manga/popular_manhwa_bloc.dart';
import '../../bloc/discover/manga/top_100_manga/top_100_manga.dart';
import '../../bloc/graphql_client/graphql_client_cubit.dart';
import '../../bloc/media_detail/media_detail_bloc.dart';
import '../../bloc/recommended_anime/recommended_anime_bloc.dart';
import '../../bloc/recommended_manga/recommended_manga_bloc.dart';
import '../../bloc/reviews/reviews/reviews_bloc.dart';
import '../../bloc/search/search_bloc/search_bloc.dart';
import '../../bloc/trending_anime/trending_anime_bloc.dart';
import '../../bloc/trending_manga/trending_manga_bloc.dart';
import '../../core/ui/app_scaffold.dart';
import '../../features/anime_lists/slider_lists/recommended_manga_slider.dart';
import '../../features/anime_lists/slider_lists/trending_manga_slider.dart';
import '../../features/anime_lists/view_more_lists/popular_manhwa_screen.dart';
import '../../features/anime_lists/view_more_lists/recommended_manga_screen.dart';
import '../../features/anime_lists/view_more_lists/trending_anime_screen.dart';
import '../../features/anime_lists/view_more_lists/trending_manga_screen.dart';
import '../../features/discover/screens/discover_screen.dart';
import '../../features/my_list/screens/my_list_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/profile/screens/favorite_manga_slider.dart';
import '../../features/reviews/screens/post_review_screen.dart';
import '../../features/social/screens/activity_replies_screen.dart';
import '../../features/social/screens/social_screen.dart';

part 'bottom_nav_routes.dart';
part 'discover_routes.dart';
part 'home_routes.dart';
part 'list_routes.dart';
part 'profile_routes.dart';
part 'settings_routes.dart';
part 'social_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final _shellNavigatorDiscoverKey = GlobalKey<NavigatorState>();
final _shellNavigatorSocialKey = GlobalKey<NavigatorState>();
final _shellNavigatorMyListKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: RouteConstants.splash,
  navigatorKey: _rootNavigatorKey,
  observers: [
    CustomRouteObserver(),
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  routes: [
    // Splash Screen
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    // Bottom navigation pages
    bottomNavRoutes,
    ...homeRoutes,
    ...discoverRoutes,
    ...socialRoutes,
    ...profileRoutes,
    ...settingsRoutes,
    ...listRoutes,
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.mediaDetail,
      builder: (context, state) {
        final mediaId = int.parse(
          state.uri.queryParameters['id']!,
        );
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MediaDetailBloc(),
            ),
            BlocProvider(
              create: (context) => RecommendationAnimeBloc(),
            ),
          ],
          child: MediaDetailScreen(
            key: ValueKey<int>(mediaId),
            mediaId: mediaId,
          ),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.recommendationsSlider,
      builder: (context, state) {
        final recommendationBloc = state.extra as RecommendationAnimeBloc;
        return RecommendationsSliderScreen(
          bloc: recommendationBloc,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.recommendationsGrid,
      builder: (context, state) {
        final recommendationParameters =
            state.extra! as RecommendationsParameters;
        return RecommendationsGridScreen(
          bloc: recommendationParameters.bloc,
          mediaType: recommendationParameters.mediaType,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.onBoarding,
      builder: (context, state) => OnBoardingScreen(),
    ),
    SlideTransitionRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.login,
      builder: (_) => const LoginScreen(),
      directionTween: SlideTransitionRoute.leftToRightTween,
      redirect: (context, state) async {
        final bool firstTime = SharedPreferenceUtils.getIsFirstTime();
        if (firstTime) {
          return RouteConstants.onBoarding;
        } else {
          return null;
        }
      },
    ),
    SlideTransitionRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.characterDetail,
      builder: (state) {
        final int characterId = int.parse(state.uri.queryParameters['id']!);
        return BlocProvider(
          create: (context) {
            final client = (context.read<GraphqlClientCubit>().state
                    as GraphqlClientInitialized)
                .client;
            return CharacterDetailBloc()
              ..add(
                LoadCharacterDetail(
                  id: characterId,
                  client: client,
                ),
              );
          },
          child: BlocProvider(
            create: (context) {
              final client = (context.read<GraphqlClientCubit>().state
                      as GraphqlClientInitialized)
                  .client;
              return CharacterMediaBloc(characterId: characterId)
                ..add(
                  LoadData(client),
                );
            },
            child: CharacterDetailScreen(
              characterId: characterId,
            ),
          ),
        );
      },
      directionTween: SlideTransitionRoute.leftToRightTween,
    ),
    SlideTransitionRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.studioDetail,
      builder: (state) {
        final int studioId = int.parse(state.uri.queryParameters['id']!);
        return BlocProvider(
          create: (context) {
            final client = (context.read<GraphqlClientCubit>().state
                    as GraphqlClientInitialized)
                .client;
            return StudioDetailBloc()
              ..add(
                LoadStudioDetail(
                  id: studioId,
                  client: client,
                ),
              );
          },
          child: BlocProvider(
            create: (context) {
              final client = (context.read<GraphqlClientCubit>().state
                      as GraphqlClientInitialized)
                  .client;
              return StudioMediaBloc(studioId: studioId)
                ..add(
                  LoadData(client),
                );
            },
            child: StudioDetailScreen(
              studioId: studioId,
            ),
          ),
        );
      },
      directionTween: SlideTransitionRoute.leftToRightTween,
    ),
    SlideTransitionRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.staffDetail,
      builder: (state) {
        final int staffId = int.parse(state.uri.queryParameters['id']!);
        return BlocProvider(
          create: (context) {
            final client = (context.read<GraphqlClientCubit>().state
                    as GraphqlClientInitialized)
                .client;
            return StaffDetailBloc(client)
              ..add(
                FetchStaffDetail(staffId),
              );
          },
          child: StaffDetailScreen(
            staffId: staffId,
          ),
        );
      },
      directionTween: SlideTransitionRoute.leftToRightTween,
    ),
    SlideTransitionRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouteConstants.characterMediaViewList,
      builder: (state) {
        final characterMediaBloc = state.extra as CharacterMediaBloc;
        return BlocProvider.value(
          value: characterMediaBloc,
          child: const CharacterMediaViewAllListScreen(),
        );
      },
      directionTween: SlideTransitionRoute.leftToRightTween,
    ),
  ],
  onException: (context, state, router) {
    router.go('/home');
  },
  redirect: (context, state) {
    dev.log('Matched location: ${state.matchedLocation}',
        name: 'RouterRedirect');
    if (state.matchedLocation == RouteConstants.splash) return null;
    if (state.matchedLocation == RouteConstants.onBoarding) return null;

    final authState = context.read<AuthCubit>().state;
    final routeCubit = context.read<RedirectRouteCubit>();

    if (authState is UnAuthenticated) {
      if ((!routeCubit.isDesiredRouteSet() &&
              state.matchedLocation != RouteConstants.login) ||
          (state.matchedLocation != RouteConstants.home &&
              state.matchedLocation != RouteConstants.login &&
              state.matchedLocation != RouteConstants.onBoarding)) {
        routeCubit.setDesiredRoute(
          state.matchedLocation,
          state.uri.queryParameters,
        );
      }
      return RouteConstants.login;
    } else {
      if (state.matchedLocation == RouteConstants.home &&
          routeCubit.isDesiredRouteSet()) {
        final route = routeCubit.getDesiredRoute();
        routeCubit.resetDesiredRoute();
        dev.log('Going to desired route: $route', name: 'RouterRedirect');
        return route;
      } else {
        return null;
      }
    }
  },
);
