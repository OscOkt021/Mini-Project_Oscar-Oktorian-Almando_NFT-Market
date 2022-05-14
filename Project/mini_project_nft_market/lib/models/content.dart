class Content {
  final int? id;
  final String title;
  final String imgUrl;
  final String description;
  final double price;
  final int creatorId;

  Content({
    this.id,
    required this.title,
    required this.imgUrl,
    required this.description,
    required this.price,
    required this.creatorId,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "imgUrl": imgUrl,
      "description": description,
      "price": price,
      "creatorId": creatorId,
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? "",
      imgUrl: map['imgUrl'] ?? "",
      description: map['description'] ?? "",
      price: map['price']?.toDouble() ?? "",
      creatorId: map['creatorId']?.toInt() ?? 0,
    );
  }

  @override
  String toString() =>
      'Creator(id : ${id}, title : ${title}, Url : ${imgUrl}, desctiption : ${description}, price : ${price}, creator id : ${creatorId})';
}
