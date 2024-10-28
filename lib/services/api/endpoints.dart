class EndPoints {
  static const String paramIdentifier = "__param__";

  static const Map photos = {
    "url": "search?query=coder",
  };

  static const Map searchPins = {
    'url': 'search?query=$paramIdentifier',
  };
}
