class PageSearchEvent {
  final String query;

  const PageSearchEvent(this.query);

  @override
  String toString() => 'WikiPageSearchEvent { query: $query }';
}