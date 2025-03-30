class AnimationData {
  late int id;
  late String url;

  AnimationData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "url": url};
  }
}
