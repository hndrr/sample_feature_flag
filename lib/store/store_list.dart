import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_feature_flag/domain/get_it_service.dart';
import 'package:sample_feature_flag/domain/item_list.dart';
import 'package:sample_feature_flag/domain/remote_config_repository.dart';
import 'package:sample_feature_flag/store/store_detail.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:twemoji/twemoji.dart';

import 'store_model.dart';

class StoreListPage extends StatelessWidget {
  const StoreListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreModel>(
      builder: (
        BuildContext context,
        StoreModel model,
        Widget? child,
      ) {
        RemoteConfigRepository remoteConfig = getIt<RemoteConfigRepository>();
        final List<Item> itemList = model.itemList;
        final double width = MediaQuery.of(context).size.width;

        return Scaffold(
          appBar: AppBar(
            title: const Text('商品リスト'),
            elevation: 2,
            backgroundColor: Colors.amberAccent,
            foregroundColor: Colors.black87,
          ),
          body: GridView.builder(
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
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) {
              final item = itemList[index];

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
                        '価格 : ￥${(item.id == '1a' && remoteConfig.featPriceInt != 0) ? remoteConfig.featPriceInt : item.price}',
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
