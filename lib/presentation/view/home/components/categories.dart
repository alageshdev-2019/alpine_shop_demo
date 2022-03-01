import 'package:alpine_shop_demo/data/response/ApiResponse.dart';
import 'package:alpine_shop_demo/presentation/resources/constants.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/LoadingWidget.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/section_title.dart';
import 'package:alpine_shop_demo/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyErrorWidget.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularCategories = context.watch<HomeViewModel>().popularCategories;
    final categoryList = popularCategories.data ?? [];
    switch (popularCategories.status) {
      case Status.loading:
        return const LoadingWidget();
      case Status.error:
        return MyErrorWidget(popularCategories.message ?? "NA");
      case Status.completed:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: SectionTitle(
                title: "Categories ${popularCategories.status}",
                pressSeeAll: () {},
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) => CategoryCard(
                  id: categoryList[index].id,
                  itemcategoryname: categoryList[index].itemcategoryname,
                  itemcategoryimage: categoryList[index].itemcategoryimage,
                  press: () {},
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(width: defaultPadding),
              ),
            ),
          ],
        );
      default:
        return Column(children: []);
    }
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.id,
    required this.itemcategoryname,
    required this.itemcategoryimage,
    required this.press,
  }) : super(key: key);

  final String id, itemcategoryname, itemcategoryimage;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            Image.network(
              itemcategoryimage,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              itemcategoryname,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
