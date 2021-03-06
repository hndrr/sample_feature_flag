import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_feature_flag/domain/get_it_service.dart';
import 'package:sample_feature_flag/domain/package_info_repository.dart';
import 'package:sample_feature_flag/domain/remote_config_repository.dart';
import 'package:twemoji/twemoji.dart';

import 'about_model.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RemoteConfigRepository remoteConfig = getIt<RemoteConfigRepository>();
    PackageInfoRepository packageInfo = getIt<PackageInfoRepository>();

    final double width = MediaQuery.of(context).size.width;

    return Consumer<AboutModel>(
      builder: (
        BuildContext context,
        AboutModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('About'),
            elevation: 2,
            backgroundColor: Colors.amberAccent,
            foregroundColor: Colors.black87,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amberAccent,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 180,
                  width: width,
                  child: const Twemoji(
                    emoji: '👾',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    'version : ${packageInfo.currentVersion}   BuildNumber : ${packageInfo.currentBuildNumber}'),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  remoteConfig.featPlatform ?? 'うんたら',
                  textScaleFactor: 1,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  remoteConfig.featCountry ?? 'かんたら',
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
