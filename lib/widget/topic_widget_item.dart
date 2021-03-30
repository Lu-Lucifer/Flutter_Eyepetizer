import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/model/topic_model.dart';
import 'package:flutter_eyepetizer/util/view_util.dart';

class TopicWidgetItem extends StatelessWidget {
  final TopicItemModel itemModel;

  const TopicWidgetItem({Key key, this.itemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
                child: cacheImage(
                  itemModel.data.image,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ), //充满容器，可能会被截断
                borderRadius: BorderRadius.circular(4))),
        Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: Divider(height: 0.5))
      ],
    );
  }
}
