class SoldProductModel {
  String? productImage1;
  String? productCollectionName;
  String? productName;
  String? productDescription;
  String? productSpecification;
  String? productUid;
  String? buyerUid;
  String? shopkeeperUid;
  String? sellerStatus;
  String? buyerName;
  String? buyerPhoneNumber;
  String? buyerAddress;
  String? buyerEmail;
  String? accepted;
  int? productCurrentBid;
  int? bidEndTimeInSeconds;
  int? productShipping;
  int? productPrice;
  DateTime? productDateTime;
  DateTime? bidDateTimeLeft;
  bool? productPTAApproved;
  bool? isStartingBid;
  bool? productAccepted;
  List<String>? imagesList;

  SoldProductModel({
    required this.buyerUid,
    required this.buyerName,
    required this.buyerEmail,
    required this.buyerAddress,
    required this.buyerPhoneNumber,
    required this.accepted,
    this.productAccepted,
    this.isStartingBid,
    this.bidEndTimeInSeconds,
    this.imagesList,
    this.productCollectionName,
    this.productImage1,
    required this.productName,
    this.sellerStatus,
    this.productDescription,
    this.productSpecification,
    this.productUid,
    this.shopkeeperUid,
    this.productCurrentBid,
    this.productShipping,
    this.productPrice,
    this.productDateTime,
    this.bidDateTimeLeft,
    this.productPTAApproved,
  });
}
