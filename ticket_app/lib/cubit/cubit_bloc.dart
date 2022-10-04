import 'package:bloc/bloc.dart';

class PageBloc extends Cubit<int> {
  PageBloc() : super(0);

  void newPage(int newPage) {
    emit(newPage);
  }
}
