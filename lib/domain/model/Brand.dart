class Brand {
  String id;
  String brandname;
  String brandimage;
  Brand({required this.id, required this.brandname, required this.brandimage});
}

class Brands {
  List<Brand> brands;
  Brands({required this.brands});
}
