
class Contact {
  Contact({
    this.address,
    this.location,
    this.long,
    this.lat,
    this.openDay,
    this.closeDay,
    this.openHour,
    this.closeHour,
  });

  String address;
  String location;
  String long;
  String lat;
  String openDay;
  String closeDay;
  String openHour;
  String closeHour;

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
    address: json["address"] == null ? null : json["address"],
    location: json["location"] == null ? null : json["location"],
    long: json["long"] == null ? null : json["long"],
    lat: json["lat"] == null ? null : json["lat"],
    openDay: json["open_day"] == null ? null : json["open_day"],
    closeDay: json["close_day"] == null ? null : json["close_day"],
    openHour: json["open_hour"] == null ? null : json["open_hour"],
    closeHour: json["close_hour"] == null ? null : json["close_hour"],
  );

  Map<String, dynamic> toMap() => {
    "address": address == null ? null : address,
    "location": location == null ? null : location,
    "long": long == null ? null : long,
    "lat": lat == null ? null : lat,
    "open_day": openDay == null ? null : openDay,
    "close_day": closeDay == null ? null : closeDay,
    "open_hour": openHour == null ? null : openHour,
    "close_hour": closeHour == null ? null : closeHour,
  };
}
