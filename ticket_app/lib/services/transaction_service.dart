import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/transaction_model.dart';

class TransactionService {
  final CollectionReference _transactionRef =
      FirebaseFirestore.instance.collection('transaction');
//fungsi add data ke firestore
  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionRef.add({
        'destination': transaction.destination.toJson(),
        'traveler': transaction.traveler,
        'seat': transaction.seat,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal
      });
    } catch (e) {
      rethrow;
    }
  }

//method get data firestore
  Future<List<TransactionModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _transactionRef.get();
      List<TransactionModel> transaction = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return transaction;
    } catch (e) {
      rethrow;
    }
  }
}
