class FavoriteProduct {
  final int id;
  final int userId;
  final int productId;
  final String createdAt;
  final String updatedAt;
  final Product product;

  FavoriteProduct({
    required this.id,
    required this.userId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      product: Product.fromJson(json['product']),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final String price;
  final String color;
  final String size;
  final int soldCount;
  final int categoryId;
  final String createdAt;
  final String updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.color,
    required this.size,
    required this.soldCount,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      color: json['color'],
      size: json['size'],
      soldCount: json['sold_count'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
