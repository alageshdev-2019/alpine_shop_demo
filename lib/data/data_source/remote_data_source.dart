import 'package:alpine_shop_demo/data/network/app_api.dart';
import 'package:alpine_shop_demo/domain/model/Brand.dart';
import 'package:alpine_shop_demo/domain/model/ItemCategory.dart';
import 'package:alpine_shop_demo/domain/model/ItemGroup.dart';
import 'package:alpine_shop_demo/domain/model/Items.dart';

abstract class RemoteDataSource {
  Future<Brands> getBrands();
  Future<ItemGroups> getItemGroups();
  Future<ItemCategories> getItemCategories();
  Future<Items> getItems();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<Brands> getBrands() async {
    return await _appServiceClient.getBrands();
  }

  @override
  Future<ItemGroups> getItemGroups() async {
    return await _appServiceClient.getitemgroups();
  }

  @override
  Future<ItemCategories> getItemCategories() async {
    return await _appServiceClient.getitemcategories();
  }

  @override
  Future<Items> getItems() async {
    return await _appServiceClient.getItems();
  }
}
