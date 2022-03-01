import 'package:alpine_shop_demo/presentation/resources/constants.dart';
import 'package:alpine_shop_demo/presentation/resources/strings_manager.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/PopularBrands.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/PopularItems.dart';
import 'package:alpine_shop_demo/presentation/view/home/components/categories.dart';
import 'package:alpine_shop_demo/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'components/search_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.microtask(
      () => context.read<HomeViewModel>().getCategories(),
    );
    Future.microtask(
      () => context.read<HomeViewModel>().getBrands(),
    );
    Future.microtask(
      () => context.read<HomeViewModel>().getPopularItems(),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              AppStrings.home,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "best Outfits for you",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            Categories(),
            const PopularBrands(),
            const PopularItems(),
            //const PopularProducts(),
          ],
        ),
      ),
    );
  }
}
