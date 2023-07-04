// To parse this JSON data, do
//
//     final offerModel = offerModelFromJson(jsonString);

import 'dart:convert';

List<OfferModel> offerModelFromJson(String str) => List<OfferModel>.from(json.decode(str).map((x) => OfferModel.fromJson(x)));

String offerModelToJson(List<OfferModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfferModel {
    int id;
    String title;
    String percentage;
    String description;
    DateTime startDate;
    DateTime endDate;
    String scope;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int storeId;
    dynamic createdById;
    Image image;
    String type;
    Store store;
    dynamic createdBy;
    List<Image> media;

    OfferModel({
        required this.id,
        required this.title,
        required this.percentage,
        required this.description,
        required this.startDate,
        required this.endDate,
        required this.scope,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        this.deletedAt,
        required this.storeId,
        this.createdById,
        required this.image,
        required this.type,
        required this.store,
        this.createdBy,
        required this.media,
    });

    factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json["id"],
        title: json["title"],
        percentage: json["percentage"].toString(),
        description: json["description"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        scope: json["scope"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        storeId: json["store_id"],
        createdById: json["created_by_id"],
        image: Image.fromJson(json["image"]),
        type: json["type"],
        store: Store.fromJson(json["store"]),
        createdBy: json["created_by"],
        media: List<Image>.from(json["media"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "percentage": percentage.toString(),
        "description": description,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "scope": scope,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "store_id": storeId,
        "created_by_id": createdById,
        "image": image.toJson(),
        "type": type,
        "store": store.toJson(),
        "created_by": createdBy,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
    };
}

class Image {
    int id;
    String modelType;
    int modelId;
    String collectionName;
    String name;
    String fileName;
    String mimeType;
    String disk;
    int size;
    List<dynamic> manipulations;
    CustomProperties customProperties;
    List<dynamic> responsiveImages;
    int orderColumn;
    DateTime createdAt;
    DateTime updatedAt;
    String url;
    String thumbnail;
    String preview;

    Image({
        required this.id,
        required this.modelType,
        required this.modelId,
        required this.collectionName,
        required this.name,
        required this.fileName,
        required this.mimeType,
        required this.disk,
        required this.size,
        required this.manipulations,
        required this.customProperties,
        required this.responsiveImages,
        required this.orderColumn,
        required this.createdAt,
        required this.updatedAt,
        required this.url,
        required this.thumbnail,
        required this.preview,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties: CustomProperties.fromJson(json["custom_properties"]),
        responsiveImages: List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
        thumbnail: json["thumbnail"],
        preview: json["preview"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": customProperties.toJson(),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
        "thumbnail": thumbnail,
        "preview": preview,
    };
}

class CustomProperties {
    GeneratedConversions generatedConversions;

    CustomProperties({
        required this.generatedConversions,
    });

    factory CustomProperties.fromJson(Map<String, dynamic> json) => CustomProperties(
        generatedConversions: GeneratedConversions.fromJson(json["generated_conversions"]),
    );

    Map<String, dynamic> toJson() => {
        "generated_conversions": generatedConversions.toJson(),
    };
}

class GeneratedConversions {
    bool thumb;
    bool preview;

    GeneratedConversions({
        required this.thumb,
        required this.preview,
    });

    factory GeneratedConversions.fromJson(Map<String, dynamic> json) => GeneratedConversions(
        thumb: json["thumb"],
        preview: json["preview"],
    );

    Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "preview": preview,
    };
}

class Store {
    int id;
    String name;
    String phone;
    String email;
    String description;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int cityId;
    int regionId;
    int areaId;
    Image image;
    List<Image> media;

    Store({
        required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.description,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        this.deletedAt,
        required this.cityId,
        required this.regionId,
        required this.areaId,
        required this.image,
        required this.media,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        cityId: json["city_id"],
        regionId: json["region_id"],
        areaId: json["area_id"],
        image: Image.fromJson(json["image"]),
        media: List<Image>.from(json["media"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "city_id": cityId,
        "region_id": regionId,
        "area_id": areaId,
        "image": image.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
    };
}
