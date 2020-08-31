class WikiElement {
  final String title;
  final String body;
  final String image;
  final String path;
  final int wikiId;

  WikiElement({this.title, this.body, this.image, this.wikiId, this.path});
  factory WikiElement.fromJson(Map<String, dynamic> json) {
    return WikiElement(
        title: json['title'],
        body: json['title'],
        image: json['title'],
        wikiId: json['title'],
        path: json['path']);
  }
}
