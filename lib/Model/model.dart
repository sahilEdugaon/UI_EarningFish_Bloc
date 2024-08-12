class FishDataModel {
  String image;
  String name;
  String details;
  String price;
  List<RelatedItem> relatedItems;

  FishDataModel({
    required this.image,
    required this.name,
    required this.details,
    required this.price,
    required this.relatedItems,
  });

  // Factory method to create an instance from a map
  factory FishDataModel.fromJson(Map<String, dynamic> json) {
    return FishDataModel(
      image: json['image'],
      name: json['name'],
      details: json['Details'],
      price: json['price'],
      relatedItems: (json['related_item'] as List)
          .map((item) => RelatedItem.fromJson(item))
          .toList(),
    );
  }

  // Method to convert an instance to a map
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'Details': details,
      'price': price,
      'related_item': relatedItems.map((item) => item.toJson()).toList(),
    };
  }
}

class RelatedItem {
  String image;
  String name;
  String price;

  RelatedItem({
    required this.image,
    required this.name,
    required this.price,
  });

  // Factory method to create an instance from a map
  factory RelatedItem.fromJson(Map<String, dynamic> json) {
    return RelatedItem(
      image: json['image'],
      name: json['name'],
      price: json['price'],
    );
  }

  // Method to convert an instance to a map
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'price': price,
    };
  }
}
