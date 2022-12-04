import 'package:coffeeihmproject/Services/auth/api_controller/auth_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_controller/auth_services.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthServices provider) : super(const AuthStateUnInitialized()) {

    on<AuthEventInitialize>(
      ((event, emit) async {
        final user = provider.currentUser;
        if (user == null) {
          emit(const AuthStateLoggedOut(exception: null));
        } else {
          emit(AuthStateLoggedIn(user: user));
        }
      }),
    );

    on<AuthEventLogIn>(
      ((event, emit) async {
        final email = event.email;
        final password = event.password;
        try {
          final user = await provider.logIn(email: email, password: password);
          emit(AuthStateLoggedIn(user: user));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e));
        }
      }),
    );

    on<AuthEventShouldSignUp>(
      ((event, emit) {
        emit(const AuthStateSignUp(exception: null));
      }),
    );

    on<AuthEventSignUp>((event, emit) async {
      final name = event.name;
      final email = event.email;
      final password = event.password;
      final birthday = event.birthday;
      final phone = event.phone;

      try {
        final user = await provider.signUp(
            name: name,
            email: email,
            password: password,
            birthday: birthday,
            phoneNumber: phone);

        emit(AuthStateLoggedIn(user: user));
      } on Exception catch (e) {
        emit(AuthStateSignUp(exception: e));
      }
    });

    on<AuthEventLogOut>(
      ((event, emit) async {
        try {
          await provider.logOut();
          emit(const AuthStateLoggedOut(exception: null));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e));
        }
      }),
    );
  }
}
