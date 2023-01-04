class Outlets {
  final int? id;
  final String? name;
  final String? imageUrl;
  final double? rating;
  final String? address;
  final String? description;
  final String? categories;

  Outlets({this.id,
  this.name, this.imageUrl, this.rating, this.address, this.description, this.categories });

  factory Outlets.fromJson(Map<String, dynamic> json) => Outlets(
    id: json['id'],
    name: json['name'],
    imageUrl: json['imageUrl'],
    rating: json['rating'],
    address: json['address'],
    description: json['description'],
    categories: json['categories'],
  );
  
}