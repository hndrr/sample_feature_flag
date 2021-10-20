import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_feature_flag/store/store_detail.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import 'store_model.dart';

class StoreListPage extends StatelessWidget {
  const StoreListPage({
    Key? key,
    this.artist,
  }) : super(key: key);

  final String? artist;

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreModel>(
      builder: (
        BuildContext context,
        StoreModel model,
        Widget? child,
      ) {
        final double width = MediaQuery.of(context).size.width;

        // final musicInfos =
        //     artist == null ? model.viewList : model.viewArtistAlbumList;

        return Scaffold(
          appBar: AppBar(
            title: const Text('FeatureFlagSample'),
            elevation: 2,
          ),
          body:
              // musicInfos.isEmpty
              //     ? model.isLoading
              //         ? Container(
              //             color: Colors.black.withOpacity(0.1),
              //             child: const Center(
              //               child: CircularProgressIndicator(
              //                 valueColor:
              //                     AlwaysStoppedAnimation<Color>(Colors.black),
              //               ),
              //             ),
              //           )
              //         : const SizedBox()
              //     :
              GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10)
                .add(const EdgeInsets.only(top: 20, bottom: 20)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // mainAxisSpacing: 29,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: width / (width + 180),
            ),
            cacheExtent: 10000,
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ScaleTap(
                scaleMinValue: 0.99,
                opacityMinValue: 0.8,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 180,
                        width: 180,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            //   FutureBuilder<String>(
                            //       future: model.getArtworkFilePath(
                            //         ResourceType.ALBUM,
                            //         musicInfo,
                            //       ),
                            //       builder: (_, AsyncSnapshot<String> snapshot) {
                            //         return snapshot.data != null
                            //             ? CachedNetworkImage(
                            //                 imageUrl: snapshot.data!,
                            //                 fit: BoxFit.scaleDown,
                            //                 errorWidget: (BuildContext context,
                            //                         String url,
                            //                         dynamic error) =>
                            //                     Image.asset(
                            //                         'assets/images/icon_1024.png',
                            //                         fit: BoxFit.scaleDown),
                            //               )
                            //             : Image.asset(
                            //                 'assets/images/icon_1024.png',
                            //                 fit: BoxFit.scaleDown);
                            //       })
                            // else
                            //   Image.file(
                            //     File(musicInfo.artworkUri!),
                            //     fit: BoxFit.scaleDown,
                            //   ),
                          ],
                        ),
                      ),
                      const Text(
                        '商品名',
                        textScaleFactor: 1,
                      ),
                      const Text(
                        '説明書き',
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).push<dynamic>(
                    MaterialPageRoute<dynamic>(
                      builder: (context) =>
                          const StoreDetailPage(albumTitle: 'aaa'),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
