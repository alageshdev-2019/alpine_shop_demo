class Item {
  String id;
  String itemname;
  String itemimage;
  Item({required this.id, required this.itemname, required this.itemimage});
}

class Items {
  List<Item> items;
  Items({required this.items});
}
