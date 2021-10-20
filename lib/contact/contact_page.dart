import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twemoji/twemoji.dart';

import 'contact_model.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Consumer<ContactModel>(
      builder: (
        BuildContext context,
        ContactModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Contact'),
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
                      emoji: '📧',
                    )),
                const Text('E-mail',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'hoge@hogehoge.com',
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
