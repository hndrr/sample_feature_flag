import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_feature_flag/domain/item_list.dart';
import 'package:sample_feature_flag/store/store_model.dart';
import 'package:twemoji/twemoji.dart';

class StoreDetailPage extends StatelessWidget {
  const StoreDetailPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

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
                    backgroundColor: Colors.amberAccent,
                    pinned: true,
                    expandedHeight: 300,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 100),
                            child: Twemoji(
                              emoji: item.emoji,
                            ),
                          ),
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
                            '商品名 : ${item.title}',
                            textScaleFactor: 1,
                            maxLines: 2,
                            style: textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '価格 : ￥${item.price}',
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
