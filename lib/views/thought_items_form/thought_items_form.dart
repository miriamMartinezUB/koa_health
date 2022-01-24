import 'package:flutter/material.dart';
import 'package:koa_health/model/thought_item.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/views/thought_items_form/thought_item_view.dart';

class ThoughtItemsForm extends StatelessWidget {
  ThoughtItem title;
  ThoughtItem feeling;
  List<ThoughtItem> items;

  ThoughtItemsForm({Key? key, required this.title, required this.feeling, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_LARGE),
          child: ThoughtItemView(feeling),
        ),
        ThoughtItemView(title),
        ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_LARGE),
            shrinkWrap: true,
            primary: false,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ThoughtItemView(items[index]);
            })
      ],
    );
  }
}
