
import 'package:iqapp/models/contact.dart';

class Store {
  Store({
    this.name,
    this.picture,
    this.cover,
    this.website,
    this.email,
    this.phoneNumber,
    this.bio,
    this.contact,
  });

  String name;
  String picture;
  String cover;
  dynamic website;
  dynamic email;
  String phoneNumber;
  dynamic bio;
  Contact contact;

  factory Store.fromMap(Map<String, dynamic> json) => Store(
    name: json["name"] == null ? null : json["name"],
    picture: json["picture"] == null ? null : json["picture"],
    cover: json["cover"] == null ? null : json["cover"],
    website: json["website"],
    email: json["email"],
    phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
    bio: json["bio"],
    contact: json["contact"] == null ? null : Contact.fromMap(json["contact"]),
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "picture": picture == null ? null : picture,
    "cover": cover == null ? null : cover,
    "website": website,
    "email": email,
    "phone_number": phoneNumber == null ? null : phoneNumber,
    "bio": bio,
    "contact": contact == null ? null : contact.toMap(),
  };
}