import 'package:alpine_shop_demo/domain/model/ItemGroup.dart';

ItemGroup itemGroupFromJson(Map<String, dynamic> json) => ItemGroup(
      id: json["_id"] ?? 1,
      itemgroupname: json["itemgroupname"] ?? '',
      itemgroupimage: json["itemgroupimage"] ?? '',
    );
ItemGroups itemGroupsFromJson(Map<String, dynamic> json) => ItemGroups(
      status: json["status"] ?? 1,
      message: json["message"] ?? '',
      itemGroups: json['data']
          .map((itemgroup) => itemGroupFromJson(itemgroup))
          .toList(),
    );
