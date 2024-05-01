class Product {
  final int id;
  final String name;
  final String price;
  final String image;
  final String description;
  final String color;
  final String size;
  final int soldCount;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final bool? isFavorite; // Change bool to bool?

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.color,
    required this.size,
    this.isFavorite = false, // Set default value here
    required this.soldCount,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      color: json['color'],
      isFavorite: json['is_favorite'] ?? false, // Set default value here too
      size: json['size'],
      soldCount: json['sold_count'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
