class FilterEntity {
  final bool google;
  final bool scielo;
  final bool secureMode;

  FilterEntity({
    required this.google,
    required this.scielo,
    required this.secureMode,
  });

  FilterEntity copyWith({
    bool? google,
    bool? scielo,
    bool? secureMode,
  }) {
    return FilterEntity(
      google: google ?? this.google,
      scielo: scielo ?? this.scielo,
      secureMode: secureMode ?? this.secureMode,
    );
  }
}
