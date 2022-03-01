import 'package:alpine_shop_demo/domain/model/ItemCategory.dart';

ItemCategory itemCategoryFromJson(Map<String, dynamic> json) => ItemCategory(
      id: json["_id"] ?? 1,
      itemcategoryname: json["itemcategoryname"] ?? '',
      itemcategoryimage: json["itemcategoryimage"] ?? '',
    );
ItemCategories itemCategoriesFromJson(List json) => ItemCategories(
      itemCatrgories:
          json.map((itemgroup) => itemCategoryFromJson(itemgroup)).toList(),
    );
