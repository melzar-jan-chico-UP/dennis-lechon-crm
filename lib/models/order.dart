class Order {
  final String id;
  final String customerid;
  final String firstName;
  final String lastName;
  final String celNum;
  final String adrCity;
  final String adrBarangay;
  final String adrZipcode;
  final String deliveryDate;
  final double deliveryFee;
  final bool deliveryType;
  final bool ifPaid;
  final double subPrice;
  final double totalPrice;
  final double smallLechon;
  final double mediumLechon;
  final double largeLechon;
  final double extraLargeLechon;

  const Order({
    required this.id,
    required this.customerid,
    required this.firstName,
    required this.lastName,
    required this.celNum,
    required this.adrCity,
    required this.adrBarangay,
    required this.adrZipcode,
    required this.deliveryDate,
    required this.deliveryFee,
    required this.deliveryType,
    required this.ifPaid,
    required this.subPrice,
    required this.totalPrice,
    required this.smallLechon,
    required this.mediumLechon,
    required this.largeLechon,
    required this.extraLargeLechon,
  });
}
