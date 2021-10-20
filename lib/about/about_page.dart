import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'about_model.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<AboutModel>(builder: (
      BuildContext context,
      AboutModel model,
      Widget? child,
    ) {
      return Scaffold(
        body: SafeArea(
          top: false,
          child: CustomScrollView(
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
                        'musicInfo!.title',
                        textScaleFactor: 1,
                        maxLines: 2,
                        style: textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'musicInfo!.artist',
                        textScaleFactor: 1,
                        maxLines: 1,
                        style: textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ),
              // SliverFixedExtentList(
              //   itemExtent: 70.0,
              //   delegate: SliverChildBuilderDelegate(
              //       (BuildContext context, int index) {
              //     // final SongInfo _songInfo = model.selectSongList[index];

              //     return Container(
              //       margin: const EdgeInsets.fromLTRB(10, 4, 10, 0),
              //       padding: const EdgeInsets.only(bottom: 10),
              //       decoration: BoxDecoration(
              //         border: Border(
              //           bottom: BorderSide(
              //             color: Colors.grey[400]!,
              //             width: 0.5,
              //           ),
              //         ),
              //       ),
              //     );
              //   }, childCount: 1),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
