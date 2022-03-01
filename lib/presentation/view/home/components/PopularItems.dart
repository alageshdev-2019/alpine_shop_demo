import 'package:alpine_shop_demo/presentation/resources/constants.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/item_card.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/section_title.dart';
import 'package:alpine_shop_demo/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = context.watch<HomeViewModel>();
    final popularItemList = home.popularItems.data ?? [];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular ${home.popularItems.status}",
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              popularItemList.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: ItemCard(
                  id: popularItemList[index].id,
                  itemname: popularItemList[index].itemname,
                  itemimage: popularItemList[index].itemimage,
                  press: () {},
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
