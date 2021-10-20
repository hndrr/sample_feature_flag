import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_feature_flag/store/store_model.dart';

class StoreDetailPage extends StatelessWidget {
  const StoreDetailPage({
    Key? key,
    required this.albumTitle,
  }) : super(key: key);

  final String albumTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<StoreModel>(builder: (
      BuildContext context,
      StoreModel model,
      Widget? child,
    ) {
      return Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            children: <Widget>[
              CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    leading: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 16, 8),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: Colors.grey,
                    pinned: true,
                    expandedHeight: 300,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          //   FutureBuilder<String>(
                          //       future: model.getArtworkFilePath(
                          //         ResourceType.ALBUM,
                          //         musicInfo!,
                          //       ),
                          //       builder: (_, AsyncSnapshot<String> snapshot) {
                          //         if (snapshot.data != null) {
                          //           return CachedNetworkImage(
                          //             imageUrl: snapshot.data!,
                          //             fit: BoxFit.cover,
                          //             placeholder:
                          //                 (BuildContext context, String url) =>
                          //                     const CircularProgressIndicator(),
                          //             errorWidget: (BuildContext context,
                          //                     String url, dynamic error) =>
                          //                 Image.asset(
                          //                     'assets/images/icon_1024.png',
                          //                     fit: BoxFit.scaleDown),
                          //           );
                          //         } else {
                          //           return Image.asset(
                          //               'assets/images/icon_1024.png',
                          //               fit: BoxFit.scaleDown);
                          //         }
                          //       })
                          // else
                          //   Image.file(
                          //     File(musicInfo!.artworkUri!),
                          //     fit: BoxFit.cover,
                          //   )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '商品',
                            textScaleFactor: 1,
                            maxLines: 2,
                            style: textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '説明書き',
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 100.0,
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container();
                    }, childCount: 1),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      padding: const EdgeInsets.only(bottom: 4),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('購入'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
