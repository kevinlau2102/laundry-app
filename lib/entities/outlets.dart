class Outlets {
  final int? id;
  final String? name;
  final String? imageUrl;
  final double? rating;
  final String? address;
  final String? description;
  final String? categories;
  final double? latitude;
  final double? longitude;
  final String? phone;

  Outlets({this.id, this.phone,
  this.name, this.imageUrl, this.rating, this.address, this.description, this.categories, this.latitude, this.longitude });

  factory Outlets.fromJson(Map<String, dynamic> json) => Outlets(
    id: json['id'],
    name: json['name'],
    imageUrl: json['imageUrl'],
    rating: json['rating'],
    address: json['address'],
    description: json['description'],
    categories: json['categories'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    phone: json['phone'],
  );

  factory Outlets.fromJsonFav(Map<String, dynamic> json) => Outlets(
    id: Outlets.fromJson(json['outlets']).id,
    name: Outlets.fromJson(json['outlets']).name,
    imageUrl: Outlets.fromJson(json['outlets']).imageUrl,
    rating: Outlets.fromJson(json['outlets']).rating,
    address: Outlets.fromJson(json['outlets']).address,
    description: Outlets.fromJson(json['outlets']).description,
    categories: Outlets.fromJson(json['outlets']).categories,
    latitude: Outlets.fromJson(json['outlets']).latitude,
    longitude: Outlets.fromJson(json['outlets']).longitude,
    phone: Outlets.fromJson(json['outlets']).phone
  );
  Map<String, dynamic> toJson() => 
  {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'address': address,
    'rating': rating,
    'description': description,
    'categories' : categories,
    'latitude': latitude,
    'longitude' : longitude,
    'phone': phone
  };
  
}