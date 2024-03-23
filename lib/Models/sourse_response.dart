class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      category: json['category'],
      language: json['language'],
      country: json['country'],
    );
  }
}

class SourseResponse {
  String status;
  List<Source> sources;
  String? message;
  String? code;

  SourseResponse({
    required this.status,
    required this.sources,
    this.code,
    this.message,
  });

  factory SourseResponse.fromJson(Map<String, dynamic> json) {
    var sourceList = json['sources'] as List;
    List<Source> sources =
        sourceList.map((source) => Source.fromJson(source)).toList();

    return SourseResponse(
      status: json['status'],
      message: json['message'],
      code: json['code'],
      sources: sources,
    );
  }
}


// class SourseResponse {
//   String? status;
//   List<Sources>? sources;
// }
// class Sources {
//   String? id;
//   String? name;
//   String? description;
//   String? url;
//   String? category;
//   String? language;
//   String? country;
//   Sources({
//     required this.id,
//     required this.description,
//     required this.category,
//     required this.country,
//     required this.language,
//     required this.name,
//     required this.url,
//   });
//   Sources.fromJson(Map<String, dynamic> data)
//       : this(
//           id: data['id'],
//           description: data['description'],
//           category: data['category'],
//           country: data['country'],
//           url: data['url'],
//           language: data['language'],
//           name: data['name'],
//         );
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'category': category,
//       'country': country,
//       'language': language,
//       'url': url,
//       'description': description,
//     };
//   }
// }
