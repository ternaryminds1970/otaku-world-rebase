import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otaku_world/features/app_version_management/firebase_keys.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_version_model.dart';

class AppVersionService {
  final FirebaseFirestore firestore;

  AppVersionService({required this.firestore});

  Future<AppVersionModel?> checkAppVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    final platform = Platform.isAndroid
        ? VersionManagementFirebaseKeys.androidVersionKey
        : VersionManagementFirebaseKeys.iosVersionKey;
    final versionCode = info.buildNumber;

    final versionDoc = await firestore
        .collection(VersionManagementFirebaseKeys.appVersionsCollection)
        .doc(platform)
        .collection(VersionManagementFirebaseKeys.versionsSubCollection)
        .doc(versionCode)
        .get();

    if (!versionDoc.exists || versionDoc.data() == null) {
      // Handle unknown or unsupported version (e.g., return early or throw custom error)
      return null;
    }
    final data = versionDoc.data()!;

    final AppVersionModel appVersion = AppVersionModel.fromMap(data);

    log('AppVersion : ${appVersion.toMap()}', name: 'App Version Management');
    return appVersion;
  }

  static Future<String> getVersionNameAndBuildNumber() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    final versionName = info.version;
    final buildNumber = info.buildNumber;

    log('Version Name: $versionName, Build Number: $buildNumber',
        name: 'App Version Management');

    return '$versionName ($buildNumber)';
  }

  static Future<String> getVersionName() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    final versionName = info.version;
    final buildNumber = info.buildNumber;

    log('Version Name: $versionName, Build Number: $buildNumber',
        name: 'App Version Management');

    return 'Version $versionName';
  }
}
