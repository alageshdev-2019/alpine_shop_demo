import 'package:alpine_shop_demo/domain/model/Items.dart';
import 'package:alpine_shop_demo/domain/usecase/home_usecase.dart';
import 'package:flutter/cupertino.dart';

class ItemViewModel extends ChangeNotifier {
  late Item selectedItem;

  void setSelectedItem(Item item) {
    selectedItem = item;
    notifyListeners();
  }
}
