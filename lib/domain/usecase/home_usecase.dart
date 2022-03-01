import 'package:alpine_shop_demo/data/network/failure.dart';
import 'package:alpine_shop_demo/domain/model/Brand.dart';
import 'package:alpine_shop_demo/domain/model/ItemCategory.dart';
import 'package:alpine_shop_demo/domain/model/ItemGroup.dart';
import 'package:alpine_shop_demo/domain/model/Items.dart';
import 'package:alpine_shop_demo/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase {
  final Repository _repository;
  HomeUseCase(this._repository);
  Future<Either<Failure, ItemCategories>> getItemCategories() async {
    return await _repository.getItemCategories();
  }

  Future<Either<Failure, ItemGroups>> getItemGroups() async {
    return await _repository.getItemGroups();
  }

  Future<Either<Failure, Brands>> getBrands() async {
    return await _repository.getBrands();
  }

  Future<Either<Failure, Items>> getItems() async {
    return await _repository.getItems();
  }
}
