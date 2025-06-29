import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otaku_world/core/ui/bottomsheet/helpers/url_helpers.dart';
import 'package:otaku_world/utils/extensions.dart';

import '../../../config/app_config.dart';
import '../../../generated/assets.dart';
import '../../../utils/app_texts.dart';

class ImportantLinksSection extends StatelessWidget {
  ImportantLinksSection({super.key});

  final List<LinkModel> links = [
    LinkModel(url: AppConfig.gitHubLink, icon: Assets.aboutUsGithub),
    LinkModel(url: AppConfig.gmailLink, icon: Assets.aboutUsGmail),
    LinkModel(url: AppConfig.anilistLink, icon: Assets.aboutUsAnilist),
    LinkModel(url: AppConfig.playStoreLink, icon: Assets.aboutUsPlaystore),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Important Links',
          style: AppTextStyles.titleSectionStyle,
        ),
        15.height,
        Wrap(
          spacing: 15,
          runSpacing: 10,
          children: [
            for (LinkModel link in links) LinkItem(link: link),
          ],
        )
      ],
    );
  }
}

class LinkItem extends StatelessWidget {
  const LinkItem({
    super.key,
    required this.link,
  });

  final LinkModel link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UrlHelpers.launchUrlLink(context, link.url);
      },
      child: SvgPicture.asset(
        link.icon,
      ),
    );
  }
}

class LinkModel {
  final String url;
  final String icon;

  const LinkModel({
    required this.url,
    required this.icon,
  });
}
