class ItemModel {
  String title;
  int price;
  int size;
  String image;

  ItemModel({
    required this.title,
    required this.price,
    required this.size,
    required this.image,
  });

  factory ItemModel.fromMap(map) {
    return ItemModel(
      title: map['title'],
      price: map['price'],
      size: map['size'],
      image: map['image'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'size': size,
      'image': image,
    };
  }
}
