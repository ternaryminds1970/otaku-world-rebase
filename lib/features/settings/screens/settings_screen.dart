import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/config/router/router_constants.dart';
import 'package:otaku_world/core/ui/appbars/simple_app_bar.dart';
import 'package:otaku_world/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../bloc/auth/auth_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Settings',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GestureDetector(
          onTap: () {
            context.read<AuthCubit>().logOut();
          },
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.iconsLogout,
                width: 20,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 130,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log out ',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontFamily: 'Poppins',
                          ),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        userName,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontFamily: 'Poppins-Medium',
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.read<AuthCubit>().logOut();
                },
                icon: SvgPicture.asset(
                  Assets.iconsArrowRight,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              _buildOption(
                context,
                asset: Assets.iconsUser,
                label: 'Account',
                desc: 'Username, email, password, etc.',
                actionAsset: Assets.iconsLinkSquare,
                onTap: () {
                  launchUrl(Uri.parse('https://anilist.co/settings/account'));
                },
              ),
              _buildOption(
                context,
                asset: Assets.iconsLightning,
                label: 'Anime & Manga',
                desc:
                    'Title, staff & character language, activity merge time, etc.',
                onTap: () {
                  context.push(RouteConstants.mediaSettings);
                },
              ),
              _buildOption(
                context,
                asset: Assets.iconsNotification2,
                label: 'Notifications',
                desc:
                    'Manage your notification preferences for timely updates.',
                onTap: () {
                  context.push(RouteConstants.notificationsSettings);
                },
              ),
              _buildOption(
                context,
                asset: Assets.iconsList2,
                label: 'List',
                desc: 'Customize your anime and manga list preferences.',
                onTap: () {
                  context.push(RouteConstants.listSettings);
                },
              ),
              _buildOption(
                context,
                asset: Assets.iconsAbout,
                label: 'About',
                desc: 'Get to know more about Otaku World',
                onTap: () {
                  context.push(RouteConstants.aboutUs);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required String asset,
    required String label,
    required String desc,
    required VoidCallback onTap,
    String actionAsset = Assets.iconsArrowRight,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              asset,
              width: 20,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontFamily: 'Poppins',
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    desc,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: onTap,
              icon: SvgPicture.asset(
                actionAsset,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
