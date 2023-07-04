import 'dart:convert';

List<JanazaModel> janazaModelFromJson(String str) => List<JanazaModel>.from(
    json.decode(str).map((x) => JanazaModel.fromJson(x)));

String janazaModelToJson(JanazaModel data) => json.encode(data.toJson());

class JanazaModel {
  int id;
  String personName;
  DateTime date;
  String burialTime;
  String description;
  String address;
  String latitude;
  String longitude;
  String status;
  Image image;
  String type;

  JanazaModel({
    required this.id,
    required this.personName,
    required this.date,
    required this.burialTime,
    required this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.image,
    required this.type,
  });

  factory JanazaModel.fromJson(Map<String, dynamic> json) => JanazaModel(
        id: json["id"],
        personName: json["person_name"],
        date: DateTime.parse(json["date"]),
        burialTime: json["burial_time"],
        description: json["description"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        status: json["status"],
        image: Image.fromJson(json["image"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "person_name": personName,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "burial_time": burialTime,
        "description": description,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
        "image": image.toJson(),
        "type": type,
      };
}

class Image {
  String modelType;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  List<dynamic> responsiveImages;
  String url;
  String thumbnail;
  String preview;

  Image({
    required this.modelType,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.responsiveImages,
    required this.url,
    required this.thumbnail,
    required this.preview,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        modelType: json["model_type"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        url: json["url"],
        thumbnail: json["thumbnail"],
        preview: json["preview"],
      );

  Map<String, dynamic> toJson() => {
        "model_type": modelType,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "url": url,
        "thumbnail": thumbnail,
        "preview": preview,
      };
}
