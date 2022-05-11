// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    required this.backdropPath,
    required this.adult,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  OriginalLanguage? originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum OriginalLanguage { EN, KO, FR, SV }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "ko": OriginalLanguage.KO,
  "sv": OriginalLanguage.SV
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// List<Welcome> welcomeFromJson(String str) =>
//     List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

// String welcomeToJson(List<Welcome> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Welcome {
//   Welcome({
//     required this.id,
//     required this.brand,
//     required this.name,
//     required this.price,
//     required this.priceSign,
//     required this.currency,
//     required this.imageLink,
//     required this.productLink,
//     required this.websiteLink,
//     required this.description,
//     required this.rating,
//     required this.category,
//     required this.productType,
//     required this.tagList,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.productApiUrl,
//     required this.apiFeaturedImage,
//     required this.productColors,
//   });

//   int id;
//   String brand;
//   String name;
//   String price;
//   String priceSign;
//   String currency;
//   String imageLink;
//   String productLink;
//   String websiteLink;
//   String description;
//   dynamic rating;
//   String category;
//   String productType;
//   List<TagList> tagList;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String productApiUrl;
//   String apiFeaturedImage;
//   List<ProductColor> productColors;

//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         id: json["id"],
//         brand: json["brand"],
//         name: json["name"],
//         price: json["price"],
//         priceSign: json["price_sign"],
//         currency: json["currency"],
//         imageLink: json["image_link"],
//         productLink: json["product_link"],
//         websiteLink: json["website_link"],
//         description: json["description"],
//         rating: json["rating"],
//         category: json["category"],
//         productType: json["product_type"],
//         tagList: List<TagList>.from(
//             json["tag_list"].map((x) => tagListValues.map[x])),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         productApiUrl: json["product_api_url"],
//         apiFeaturedImage: json["api_featured_image"],
//         productColors: List<ProductColor>.from(
//             json["product_colors"].map((x) => ProductColor.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "brand": brand,
//         "name": name,
//         "price": price,
//         "price_sign": priceSign,
//         "currency": currency,
//         "image_link": imageLink,
//         "product_link": productLink,
//         "website_link": websiteLink,
//         "description": description,
//         "rating": rating,
//         "category": category,
//         "product_type": productType,
//         "tag_list":
//             List<dynamic>.from(tagList.map((x) => tagListValues.reverse[x])),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "product_api_url": productApiUrl,
//         "api_featured_image": apiFeaturedImage,
//         "product_colors":
//             List<dynamic>.from(productColors.map((x) => x.toJson())),
//       };
// }

// class ProductColor {
//   ProductColor({
//     required this.hexValue,
//     required this.colourName,
//   });

//   String hexValue;
//   String colourName;

//   factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
//         hexValue: json["hex_value"],
//         colourName: json["colour_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "hex_value": hexValue,
//         "colour_name": colourName,
//       };
// }

// enum TagList { PURPICKS, CERT_CLEAN, VEGAN, GLUTEN_FREE }

// final tagListValues = EnumValues({
//   "CertClean": TagList.CERT_CLEAN,
//   "Gluten Free": TagList.GLUTEN_FREE,
//   "purpicks": TagList.PURPICKS,
//   "Vegan": TagList.VEGAN
// });

// // class EnumValues<T> {
// //     Map<String, T> map;
// //     Map<T, String> reverseMap;

// //     EnumValues( this.map);

// //     Map<T, String> get reverse {
// //         if (reverseMap == null) {
// //             reverseMap = map.map((k, v) => new MapEntry(v, k));
// //         }
// //         return reverseMap;
// //     }
// // }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
