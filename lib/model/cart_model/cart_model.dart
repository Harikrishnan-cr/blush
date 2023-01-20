class CartModel {
  String itemId;
  String cartId;
  int quantity;
  String timeSlot;
  String dateForBooking;
  String userId;
  String title;
  String subCatDiscription;
  String imageUrl;
  CartModel(
      {required this.cartId,
      required this.itemId,
      required this.subCatDiscription,
      required this.title,
      required this.imageUrl,
      required this.quantity,
      required this.timeSlot,
      required this.dateForBooking,
      required this.userId});
}
