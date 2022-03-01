import 'package:alpine_shop_demo/domain/model/Items.dart';

Item itemFromJson(Map<String, dynamic> json) => Item(
      id: json["_id"] ?? 1,
      itemname: json["itemname"] ?? '',
      itemimage: json["itemimage"] ?? '',
    );

Items itemsFromJson(List json) => Items(
      items: json.map((item) => itemFromJson(item)).toList(),
    );
