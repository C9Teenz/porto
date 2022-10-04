import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final int price;
  final double rating;

  const DestinationModel(
      {required this.id,
      this.name = '',
      this.city = '',
      this.imageUrl = '',
      this.price = 0,
      this.rating = 0.0});
  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        city: json['city'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
        price: json['price'],
      );
  //mengubah data dari destinationmodel menjadi json
  Map<String, dynamic> toJson() => {
        'id': id,
        'city': city,
        'name': name,
        'imageUrl': imageUrl,
        'rating': rating,
        'price': price
      };
  @override
  List<Object?> get props => [id, name, city, imageUrl, price, rating];
}
