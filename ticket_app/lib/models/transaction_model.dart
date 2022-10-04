import 'package:equatable/equatable.dart';
import 'package:ticket_app/models/destination_model.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int traveler;
  final String seat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  const TransactionModel({
    required this.destination,
    this.id = '',
    this.traveler = 0,
    this.seat = '',
    this.insurance = true,
    this.refundable = false,
    this.vat = 0.0,
    this.price = 0,
    this.grandTotal = 0,
  });
  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
          id: id,
          destination: DestinationModel.fromJson(
              json['destination']['id'], json['destination']),
          traveler: json['traveler'],
          seat: json['seat'],
          insurance: json['insurance'],
          refundable: json['refundable'],
          vat: json['vat'],
          price: json['price'],
          grandTotal: json['grandTotal']);
  @override
  List<Object?> get props => [
        destination,
        traveler,
        seat,
        insurance,
        refundable,
        vat,
        price,
        grandTotal
      ];
}
