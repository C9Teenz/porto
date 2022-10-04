import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_app/models/user_models.dart';
import 'package:ticket_app/services/auth_services.dart';
import 'package:ticket_app/services/user_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  //NOTE: BUTTON SIGNUP
  void signUp(
      {required String email,
      required String name,
      String hobby = '',
      required String password}) async {
    try {
      emit(
        AuthLoading(),
      );
      UserModels user = await AuthServices()
          .signUp(email: email, password: password, name: name, hobby: hobby);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthServices().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getUserById(String id) async {
    try {
      UserModels user = await UserServices().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModels user =
          await AuthServices().signIn(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
