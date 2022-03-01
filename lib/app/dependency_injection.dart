import 'package:alpine_shop_demo/app/app_prefs.dart';
import 'package:alpine_shop_demo/data/data_source/local_data_source.dart';
import 'package:alpine_shop_demo/data/data_source/remote_data_source.dart';
import 'package:alpine_shop_demo/data/network/app_api.dart';
import 'package:alpine_shop_demo/data/network/dio_factory.dart';
import 'package:alpine_shop_demo/data/network/network_info.dart';
import 'package:alpine_shop_demo/domain/repository/repository.dart';
import 'package:alpine_shop_demo/domain/repository/repository_impl.dart';
import 'package:alpine_shop_demo/domain/usecase/home_usecase.dart';
import 'package:alpine_shop_demo/presentation/viewmodel/home_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetWorkInfoImpl(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));

  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  initHomeModule();
}

void initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}
