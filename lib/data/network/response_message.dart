import 'package:alpine_shop_demo/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class ResponseMessage {
  //api status code
  static String success = AppStrings.success.tr();
  static String noContent = AppStrings.noContent.tr();
  static String badRequest = AppStrings.badRequestError.tr();
  static String forbidden = AppStrings.forbiddenError.tr();
  static String unauthorized = AppStrings.unauthorizedError.tr();
  static String notFound = AppStrings.notFoundError.tr();
  static String internalServerError = AppStrings.internalServerError.tr();

  //local status code
  static String defaulT = AppStrings.defaultError.tr();
  static String connectTimeout = AppStrings.timeoutError.tr();
  static String cancel = AppStrings.defaultError.tr();
  static String receiveTimeout = AppStrings.timeoutError.tr();
  static String sendTimeout = AppStrings.timeoutError.tr();
  static String cacheError = AppStrings.cacheError.tr();
  static String noInternetConnection = AppStrings.noInternetError.tr();
}
