class LocationModel {
  LocationModel({
    required this.data,
  });

  final List<Datum> data;

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.lat,
    required this.long,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? userId;
  final String? lat;
  final String? long;
  final DateTime? createdAt;
  final dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      userId: json["user_id"],
      lat: json["lat"],
      long: json["long"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: json["updated_at"],
    );
  }
}
