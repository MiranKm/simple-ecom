
import 'package:iqapp/models/store.dart';

class Product {
  Product({
    this.title,
    this.subtitle,
    this.image,
    this.price,
    this.currency,
    this.attributes,
    this.isWarranty,
    this.warrantyLength,
    this.warrantyDuration,
    this.galleries,
    this.monthsOfDeduction,
    this.storeInfo,
  });

  String title;
  String subtitle;
  String image;
  String price;
  String currency;
  dynamic attributes;
  bool isWarranty;
  dynamic warrantyLength;
  dynamic warrantyDuration;
  dynamic galleries;
  int monthsOfDeduction;
  Store storeInfo;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    title: json["title"] == null ? null : json["title"],
    subtitle: json["subtitle"] == null ? null : json["subtitle"],
    image: json["image"] == null ? null : json["image"],
    price: json["price"] == null ? null : json["price"],
    currency: json["currency"] == null ? null : json["currency"],
    attributes: json["attributes"],
    isWarranty: json["is_warranty"] == null ? null : json["is_warranty"],
    warrantyLength: json["warranty_length"],
    warrantyDuration: json["warranty_duration"],
    galleries: json["galleries"],
    monthsOfDeduction: json["months_of_deduction"] == null ? null : json["months_of_deduction"],
    storeInfo: json["store_info"] == null ? null : Store.fromMap(json["store_info"]),
  );

  Map<String, dynamic> toMap() => {
    "title": title == null ? null : title,
    "subtitle": subtitle == null ? null : subtitle,
    "image": image == null ? null : image,
    "price": price == null ? null : price,
    "currency": currency == null ? null : currency,
    "attributes": attributes,
    "is_warranty": isWarranty == null ? null : isWarranty,
    "warranty_length": warrantyLength,
    "warranty_duration": warrantyDuration,
    "galleries": galleries,
    "months_of_deduction": monthsOfDeduction == null ? null : monthsOfDeduction,
    "store_info": storeInfo == null ? null : storeInfo.toMap(),
  };
}
