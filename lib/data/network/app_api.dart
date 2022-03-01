import 'package:alpine_shop_demo/data/response/ItemResponse.dart';
import 'package:alpine_shop_demo/domain/model/Items.dart';
import 'package:dio/dio.dart';
import 'package:alpine_shop_demo/data/response/BrandResponse.dart';
import 'package:alpine_shop_demo/data/response/ItemCategoryResponse.dart';
import 'package:alpine_shop_demo/data/response/ItemGroupResponse.dart';
import 'package:alpine_shop_demo/domain/model/Brand.dart';
import 'package:alpine_shop_demo/domain/model/ItemCategory.dart';
import 'package:alpine_shop_demo/domain/model/ItemGroup.dart';

class AppServiceClient {
  final Dio _dio;
  static const _apikey =
      "030e26fa8cbe08bb034b233361381c36d5450b4dc5dfd7fed66cbc587c6d2aaa";
  AppServiceClient(this._dio);
  Future<Brands> getBrands() async {
    final response = await _dio.get('/get/brands/withappkey/' + _apikey);
    return brandsFromJson(response.data);
  }

  Future<ItemGroups> getitemgroups() async {
    final response = await _dio.get('/get/itemgroups/withappkey' + _apikey);
    return itemGroupsFromJson(response.data);
  }

  Future<ItemCategories> getitemcategories() async {
    final response =
        await _dio.get('/get/itemcategories/withappkey/' + _apikey);
    return itemCategoriesFromJson(response.data);
  }
    Future<Items> getItems() async {
    final response =
        await _dio.get('/get/items/withappkey/' + _apikey);
    return itemsFromJson(response.data);
  }
}
