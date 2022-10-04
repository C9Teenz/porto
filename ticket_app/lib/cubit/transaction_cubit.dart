import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_app/models/transaction_model.dart';
import 'package:ticket_app/services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(const TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransaction() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transaction =
          await TransactionService().fetchDestinations();
      emit(TransactionSuccess(transaction));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
