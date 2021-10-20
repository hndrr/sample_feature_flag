import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_feature_flag/store/store_detail.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:twemoji/twemoji.dart';

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

        return Scaffold(
          appBar: AppBar(
            title: const Text('商品リスト'),
            elevation: 2,
            backgroundColor: Colors.amberAccent,
            foregroundColor: Colors.black87,
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
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: width / (width + 180),
            ),
            cacheExtent: 10000,
            scrollDirection: Axis.vertical,
            itemCount: model.itemList.length,
            itemBuilder: (BuildContext context, int index) {
              final item = model.itemList[index];

              return ScaleTap(
                scaleMinValue: 0.99,
                opacityMinValue: 0.6,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 180,
                          width: 100,
                          child: Twemoji(
                            emoji: item.emoji,
                          )),
                      Text(
                        '商品名 : ${item.title}',
                        textScaleFactor: 1,
                      ),
                      Text(
                        '価格 : ￥${item.price}',
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).push<dynamic>(
                    MaterialPageRoute<dynamic>(
                      builder: (context) => StoreDetailPage(
                        item: item,
                      ),
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
