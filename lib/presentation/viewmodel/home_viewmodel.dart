import 'package:alpine_shop_demo/data/response/ApiResponse.dart';
import 'package:alpine_shop_demo/domain/model/Brand.dart';
import 'package:alpine_shop_demo/domain/model/ItemCategory.dart';
import 'package:alpine_shop_demo/domain/model/Items.dart';
import 'package:alpine_shop_demo/domain/usecase/home_usecase.dart';

import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeUseCase _homeUseCase; 
  HomeViewModel(this._homeUseCase);
  ApiResponse<List<ItemCategory>> popularCategories = ApiResponse.loading();
  ApiResponse<List<Brand>> popularBrands = ApiResponse.loading();
  ApiResponse<List<Item>> popularItems = ApiResponse.loading();

  void _setpopularCategories(ApiResponse<List<ItemCategory>> response) {
    popularCategories = response;
    notifyListeners();
  }

  void _setpopularBrands(ApiResponse<List<Brand>> response) {
    popularBrands = response;
    notifyListeners();
  }

  void _setpopularItems(ApiResponse<List<Item>> response) {
    popularItems = response;
    notifyListeners();
  }

  Future<void> getCategories() async {
    (await _homeUseCase.getItemCategories()).fold(
        (l) => _setpopularCategories(ApiResponse.error(l.message)),
        (r) => _setpopularCategories(ApiResponse.completed(r.itemCatrgories)));
  }

  Future<void> getBrands() async {
    (await _homeUseCase.getBrands()).fold(
        (l) => _setpopularBrands(ApiResponse.error(l.message)),
        (r) => _setpopularBrands(ApiResponse.completed(r.brands)));
  }

  Future<void> getPopularItems() async {
    (await _homeUseCase.getItems()).fold(
        (l) => _setpopularItems(ApiResponse.error(l.message)),
        (r) => _setpopularItems(ApiResponse.completed(r.items)));
  }
}
