import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/cubit/transaction_cubit.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/widgets/transaction_history.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transaction.isEmpty) {
            return Center(
              child: Text(
                'Riwayat Transaksi belum ada',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              itemCount: state.transaction.length,
              itemBuilder: (context, index) {
                return TransactionHistory(state.transaction[index]);
              },
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
