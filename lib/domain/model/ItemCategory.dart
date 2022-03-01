class ItemCategory {
  String id;
  String itemcategoryname;
  String itemcategoryimage;
  ItemCategory(
      {required this.id,
      required this.itemcategoryname,
      required this.itemcategoryimage});
}

class ItemCategories {
  List<ItemCategory> itemCatrgories;
  ItemCategories({required this.itemCatrgories});
}
