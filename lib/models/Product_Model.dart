class ProductModel {
  String? productImage1;
  String? productImage2;
  String? productImage3;
  String? productImage4;
  String? productImage5;
  String? productImage6;
  String? productCollectionName;
  String? productName;
  String? productDescription;
  String? productSpecification;
  String? productUid;
  String? productShopkeeperUid;
  String? higherBidder;
  int? productCurrentBid;
  int? bidEndTimeInSeconds;
  int? productShipping;
  int? productPrice;
  DateTime? productDateTime;
  DateTime? bidDateTimeLeft;
  bool? productPTAApproved;
  bool? isStartingBid;
  List<String>? imagesList;

  ProductModel({
    required this.isStartingBid,
    this.bidEndTimeInSeconds,
    this.imagesList,
    this.higherBidder,
    this.productCollectionName,
    this.productImage1,
    this.productImage2,
    this.productImage3,
    this.productImage4,
    this.productImage5,
    this.productImage6,
    this.productName,
    this.productDescription,
    this.productSpecification,
    this.productUid,
    this.productShopkeeperUid,
    this.productCurrentBid,
    this.productShipping,
    this.productPrice,
    this.productDateTime,
    this.bidDateTimeLeft,
    this.productPTAApproved,
  });
}
