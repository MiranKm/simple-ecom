// To parse this JSON data, do
//
//     final modelHolder = modelHolderFromMap(jsonString);

import 'dart:convert';

import 'package:iqapp/models/product.dart';

List<ModelHolder> modelHolderFromMap(str) => List<ModelHolder>.from(str.map((x) => ModelHolder.fromMap(x)));

String modelHolderToMap(List<ModelHolder> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ModelHolder {
  ModelHolder({
    this.sections,
    this.id,
  });

  List<Section> sections;
  String id;

  factory ModelHolder.fromMap(Map<String, dynamic> json) => ModelHolder(
    sections: json["sections"] == null ? null : List<Section>.from(json["sections"].map((x) => Section.fromMap(x))),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toMap() => {
    "sections": sections == null ? null : List<dynamic>.from(sections.map((x) => x.toMap())),
    "id": id == null ? null : id,
  };
}

class Section {
  Section({
    this.sectionType,
    this.sectionTitle,
    this.items,
  });

  String sectionType;
  String sectionTitle;
  List<Product> items;

  factory Section.fromMap(Map<String, dynamic> json) => Section(
    sectionType: json["sectionType"] == null ? null : json["sectionType"],
    sectionTitle: json["sectionTitle"] == null ? null : json["sectionTitle"],
    items: json["items"] == null ? null : List<Product>.from(json["items"].map((x) => Product.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "sectionType": sectionType == null ? null : sectionType,
    "sectionTitle": sectionTitle == null ? null : sectionTitle,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toMap())),
  };
}

