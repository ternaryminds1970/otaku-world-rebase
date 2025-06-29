import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otaku_world/config/app_config.dart';
import 'package:otaku_world/constants/string_constants.dart';
import 'package:otaku_world/core/ui/appbars/simple_app_bar.dart';
import 'package:otaku_world/utils/extensions.dart';

import '../../../core/ui/bottomsheet/helpers/url_helpers.dart';
import '../../../theme/colors.dart';
import '../widgets/app_branding_widget.dart';
import '../widgets/copy_right_text.dart';
import '../widgets/important_link_section.dart';
import '../widgets/version_text_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'About',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBrandingWidget(),
            25.height,
            const VersionTextWidget(),
            25.height,
            const AboutUsDescription(),
            25.height,
            ImportantLinksSection(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: CopyrightText(
          year: AppConfig.copyRightYear,
          parentCompany: AppConfig.parentCompanyName,
          productName: AppConfig.productName,
        ),
      ),
    );
  }
}

class AboutUsDescription extends StatelessWidget {
  const AboutUsDescription({super.key});

  final TextStyle baseTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: baseTextStyle,
        children: [
          const TextSpan(
            text: AboutUsConstants.appName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(
            text: AboutUsConstants.aboutUsDescription,
          ),

          // Privacy policy
          const TextSpan(
            text: AboutUsConstants.readOurPrivacy,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                UrlHelpers.launchUrlLink(
                  context,
                  AppConfig.privacyPolicyLink,
                );
              },
            text: 'here.',
            style: const TextStyle(
              color: AppColors.linkColor,
            ),
          ),
          const TextSpan(
            text: AboutUsConstants.contactUs,
          ),
          TextSpan(
            text: 'Let us know!',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                UrlHelpers.launchUrlLink(
                  context,
                  AppConfig.gmailLink,
                );
              },
            style: const TextStyle(
              color: AppColors.linkColor,
            ),
          ),
        ],
      ),
    );
  }
}
