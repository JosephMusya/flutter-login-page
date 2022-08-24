// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


List<Model> modelFromJson(String str) =>
    List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  int id;
  String coverImage;
  String title;
  String description;
  String author;
  int quantity;
  String status;
  double price;
  bool trending;
  Model(
    this.id,
    this.coverImage,
    this.title,
    this.description,
    this.author,
    this.quantity,
    this.status,
    this.price,
    this.trending,
  );

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        json["id"],
        json["cover_image"],
        json["title"],
        json["description"],
        json["author"],
        json["quantity"],
        json["status"],
        json["price"],
        json["trending"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cover_image": coverImage,
        "title": title,
        "description": description,
        "author": author,
        "quantity": quantity,
        "status": status,
        "price": price,
        "trending": trending,
      };
}
