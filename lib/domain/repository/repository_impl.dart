import 'package:alpine_shop_demo/data/data_source/local_data_source.dart';
import 'package:alpine_shop_demo/data/data_source/remote_data_source.dart';
import 'package:alpine_shop_demo/data/network/error_handler.dart';
import 'package:alpine_shop_demo/data/network/failure.dart';
import 'package:alpine_shop_demo/data/network/network_info.dart';
import 'package:alpine_shop_demo/domain/model/Brand.dart';
import 'package:alpine_shop_demo/domain/model/ItemCategory.dart';
import 'package:alpine_shop_demo/domain/model/ItemGroup.dart';
import 'package:alpine_shop_demo/domain/model/Items.dart';
import 'package:alpine_shop_demo/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Brands>> getBrands() async {
    if (await _networkInfo.isConnected) {
      try {
        //await Future.delayed(const Duration(seconds: 5));

        final response = await _remoteDataSource.getBrands();
        return Right(response);
        /*if (response.status == ApiInternalResponse.succes) {
          return Right(response);
        } else {
          return Left(Failure(response.status, response.message));
        }*/
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ItemGroups>> getItemGroups() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getItemGroups();
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ItemCategories>> getItemCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getItemCategories();
        //we can catch itemcategories
        //_localDataSource.saveCategoriesToCache(response);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Items>> getItems() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getItems();
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  //Catch ItemCategories
  /*
  Future<Either<Failure, ItemCategories>> getItemCategories() async {
    try {
      final response = await _localDataSource.getCategoriesToCache();
      return Right(response);
    } catch (cacheErro) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSource.getItemCategories();
          //we can catch itemcategories
          //_localDataSource.saveCategoriesToCache(response);
          return Right(response);
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    }
  }*/
}
