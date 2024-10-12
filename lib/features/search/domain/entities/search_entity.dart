class SearchEntity {
  List<Result> results;
  Totals totals;
  String currentPage;

  SearchEntity({
    required this.results,
    required this.totals,
    required this.currentPage,
  });

  SearchEntity copyWith({
    List<Result>? results,
    Totals? totals,
    String? currentPage,
  }) =>
      SearchEntity(
        results: results ?? this.results,
        totals: totals ?? this.totals,
        currentPage: currentPage ?? this.currentPage,
      );

  factory SearchEntity.fromJson(Map<String, dynamic> json) => SearchEntity(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totals: Totals.fromJson(json["totals"]),
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "totals": totals.toJson(),
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
  Source source;

  Result({
    required this.title,
    required this.authors,
    required this.year,
    required this.link,
    required this.domain,
    required this.description,
    required this.source,
  });

  Result copyWith({
    String? title,
    String? authors,
    String? year,
    String? link,
    String? domain,
    String? description,
    Source? source,
  }) =>
      Result(
        title: title ?? this.title,
        authors: authors ?? this.authors,
        year: year ?? this.year,
        link: link ?? this.link,
        domain: domain ?? this.domain,
        description: description ?? this.description,
        source: source ?? this.source,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        authors: json["authors"],
        year: json["year"],
        link: json["link"],
        domain: json["domain"],
        description: json["description"],
        source: sourceValues.map[json["source"]]!,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": authors,
        "year": year,
        "link": link,
        "domain": domain,
        "description": description,
        "source": sourceValues.reverse[source],
      };
}

enum Source { GOOGLE_SCHOLAR, SCIELO }

final sourceValues = EnumValues(
    {"google-scholar": Source.GOOGLE_SCHOLAR, "scielo": Source.SCIELO});

class Totals {
  int google;
  int scielo;

  Totals({
    required this.google,
    required this.scielo,
  });

  Totals copyWith({
    int? google,
    int? scielo,
  }) =>
      Totals(
        google: google ?? this.google,
        scielo: scielo ?? this.scielo,
      );

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
        google: json["google"],
        scielo: json["scielo"],
      );

  Map<String, dynamic> toJson() => {
        "google": google,
        "scielo": scielo,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
