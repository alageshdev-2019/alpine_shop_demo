import 'package:alpine_shop_demo/data/network/error_handler.dart';
import 'package:alpine_shop_demo/domain/model/ItemCategory.dart';

const cacheHomeKey = 'cacheHomeKey';
const cacheCategoriesKey = 'cacheCategoriesKey';
const cacheHomeInterval = 60 * 1000;

abstract class LocalDataSource {
  void clearCache();
  void removeFromCache(String key);
  Future<void> saveCategoriesToCache(ItemCategories categories);
  Future<ItemCategories> getCategoriesToCache();
}

class LocalDataSourceImpl implements LocalDataSource {
  Map<String, CachedItem> cacheMap = {};
  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<void> saveCategoriesToCache(ItemCategories categories) async {
    cacheMap[cacheCategoriesKey] = CachedItem(categories);
  }

  @override
  Future<ItemCategories> getCategoriesToCache() {
     CachedItem? cachedItem = cacheMap[cacheCategoriesKey];
    if (cachedItem != null && cachedItem.isValid(cacheHomeInterval)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTime) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isCacheValid = currentTimeInMillis - expirationTime < cacheTime;
    return isCacheValid;
  }
}
