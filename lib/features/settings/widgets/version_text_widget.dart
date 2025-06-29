import 'package:flutter/material.dart';

import '../../app_version_management/services/app_version_service.dart';

class VersionTextWidget extends StatelessWidget {
  const VersionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppVersionService.getVersionName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        if (snapshot.hasError) {
          return const SizedBox.shrink();
        }
        final versionInfo = snapshot.data;
        return Text(
          versionInfo ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        );
      },
    );
  }
}
