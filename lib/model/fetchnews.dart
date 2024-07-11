class FetchN {
  String imaUrl;
  String heading;
  String desc;
  String publishDate;
  String url;

  FetchN(
      {required this.desc,
      required this.publishDate,
      required this.heading,
      required this.imaUrl,
      required this.url});

  static FetchN fetchNews(Map<String, dynamic> article) {
    return FetchN(
        desc: article["description"] ?? article["content"],
        publishDate: article["publishedAt"],
        heading: article["title"] ?? "Mystery",
        imaUrl: article["urlToImage"],
        url: article["url"]);
  }
}
