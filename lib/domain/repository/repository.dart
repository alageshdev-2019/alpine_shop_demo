import 'package:alpine_shop_demo/domain/model/Brand.dart';
import 'package:alpine_shop_demo/domain/model/ItemCategory.dart';
import 'package:alpine_shop_demo/domain/model/ItemGroup.dart';
import 'package:alpine_shop_demo/domain/model/Items.dart';

import '../../data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Brands>> getBrands();
  Future<Either<Failure, ItemGroups>> getItemGroups();
  Future<Either<Failure, ItemCategories>> getItemCategories();
  Future<Either<Failure, Items>> getItems();
}
