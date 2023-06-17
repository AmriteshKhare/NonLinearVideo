class Videos {
  final String image;
  final String category;
  final List assetsVideos;
  final List networkVideos;

  Videos({
    required this.image,
    required this.category,
    required this.assetsVideos,
    required this.networkVideos,
  });
  factory Videos.fromJSON(Map json) {
    return Videos(
      image: json["image"],
      category: json["category"],
      assetsVideos: json["assetsVideos"],
      networkVideos: json["networkVideos"],
    );
  }
}
