class SubCatagoryModel {
  String id;
  String catId;
  String title;
  bool isInCart;
  String subCatDiscription;
  String imageUrl;
  SubCatagoryModel(
      {required this.id,
      required this.subCatDiscription,
      required this.title,
      required this.catId,
      required this.imageUrl,
      required this.isInCart});
}
