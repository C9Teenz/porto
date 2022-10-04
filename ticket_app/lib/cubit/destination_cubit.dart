import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_app/models/destination_model.dart';
import 'package:ticket_app/services/destination_service.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestination() async {
    try {
      emit(DestinationLoading());
      List<DestinationModel> destination =
          await DestinationService().fetchDestinations();
      emit(DestinationSuccess(destination));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
