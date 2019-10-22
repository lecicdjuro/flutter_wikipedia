class WikiImage {
  WikiImage({this.imageName, this.url});

  factory WikiImage.fromJson(Map<String, dynamic> imageItemJSON) {
    return WikiImage(
      imageName: imageItemJSON['title'],
      url: imageItemJSON['url'],
    );
  }

  String url;
  String imageName;
}
