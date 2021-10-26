import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';

class PackageInfoRepository {
  PackageInfoRepository();

  String? appName;
  String? packageName;
  String? currentVersionStr;
  Version? currentVersion;
  String? currentBuildNumber;

  Future<PackageInfo?> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    currentVersionStr = packageInfo.version;
    currentVersion = Version.parse(currentVersionStr!);
    currentBuildNumber = packageInfo.buildNumber;
  }
}
