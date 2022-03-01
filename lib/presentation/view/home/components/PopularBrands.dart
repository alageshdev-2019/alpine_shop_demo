import 'package:alpine_shop_demo/presentation/resources/constants.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/brandcard.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/section_title.dart';
import 'package:alpine_shop_demo/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularBrands extends StatelessWidget {
  const PopularBrands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = context.watch<HomeViewModel>();
    final popularBrandsList = home.popularBrands.data ?? [];

    final ss = [];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular ${home.popularBrands.status}",
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              popularBrandsList.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: BrandCard(
                  id: popularBrandsList[index].id,
                  brandname: popularBrandsList[index].brandname,
                  brandimage: popularBrandsList[index].brandimage,
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
