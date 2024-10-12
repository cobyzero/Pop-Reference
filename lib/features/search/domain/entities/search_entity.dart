class SearchEntity {
  List<Result> results;
  int totalResults;
  String currentPage;

  SearchEntity({
    required this.results,
    required this.totalResults,
    required this.currentPage,
  });

  SearchEntity copyWith({
    List<Result>? results,
    int? totalResults,
    String? currentPage,
  }) =>
      SearchEntity(
        results: results ?? this.results,
        totalResults: totalResults ?? this.totalResults,
        currentPage: currentPage ?? this.currentPage,
      );

  factory SearchEntity.fromJson(Map<String, dynamic> json) => SearchEntity(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalResults: json["totalResults"],
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "totalResults": totalResults,
        "currentPage": currentPage,
      };
}

class Result {
  String title;
  String authors;
  String year;
  String link;
  String domain;
  String description;

  Result({
    required this.title,
    required this.authors,
    required this.year,
    required this.link,
    required this.domain,
    required this.description,
  });

  Result copyWith({
    String? title,
    String? authors,
    String? year,
    String? link,
    String? domain,
    String? description,
  }) =>
      Result(
        title: title ?? this.title,
        authors: authors ?? this.authors,
        year: year ?? this.year,
        link: link ?? this.link,
        domain: domain ?? this.domain,
        description: description ?? this.description,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        authors: json["authors"],
        year: json["year"],
        link: json["link"],
        domain: json["domain"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": authors,
        "year": year,
        "link": link,
        "domain": domain,
        "description": description,
      };
}
