class ItemGroup {
  String id;
  String itemgroupname;
  String itemgroupimage;
  ItemGroup(
      {required this.id,
      required this.itemgroupname,
      required this.itemgroupimage});
}

class ItemGroups {
  int status;
  String message;
  List<ItemGroup> itemGroups;
  ItemGroups(
      {required this.status, required this.message, required this.itemGroups,});
}
