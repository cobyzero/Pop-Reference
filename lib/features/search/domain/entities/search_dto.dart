class SearchDto {
  final String query;
  final int page;
  final bool google;
  final bool scielo;
  final bool secureMode;

  SearchDto({
    required this.query,
    required this.page,
    required this.google,
    required this.scielo,
    required this.secureMode,
  });
}
