import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final int id;
  final String title;
  final String time;
  final String body;
  final String? imageUrl;

  const PostCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.time,
      required this.body,
      this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
