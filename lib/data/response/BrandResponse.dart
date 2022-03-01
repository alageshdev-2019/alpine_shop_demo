import 'package:alpine_shop_demo/domain/model/Brand.dart';

Brand brandFromJson(Map<String, dynamic> json) => Brand(
      id: json["_id"] ?? 1,
      brandname: json["brandname"] ?? '',
      brandimage: json["brandimage"] ?? '',
    );

Brands brandsFromJson(List json) => Brands(
      brands: json.map((brand) => brandFromJson(brand)).toList(),
    );
