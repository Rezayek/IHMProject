import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../holders/current_user.dart';
import '../../cart_services/cart_provider.dart';
import '../api_controller/auth_services.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'dart:developer' as debug;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  CurrentUser currentUser = CurrentUser();
  CartProvider cartDb = CartProvider();
  AuthBloc(AuthServices provider)
      : super(const AuthStateUnInitialized(isLoading: false)) {
    on<AuthEventInitialize>(
      (event, emit) async {
        await provider.initialize();
        final user = provider.currentUser;
        if (user == null) {
          debug.log("logout");
          emit(const AuthStateLoggedOut(exception: null, isLoading: false));
        } else if (!user.isEmailVerified) {
          debug.log("logout-1");
          emit(const AuthStateNeedsVerification(isLoading: false));
        } else {
          debug.log("logout-2");
          emit(AuthStateLoggedIn(user: user, isLoading: false));
        }
      },
    );

    on<AuthEventLogIn>(
      ((event, emit) async {
        final email = event.email;
        final password = event.password;
        try {
          emit(const AuthStateLoggedOut(exception: null, isLoading: true));
          final user = await provider.logIn(email: email, password: password);
          emit(const AuthStateLoggedOut(exception: null, isLoading: false));
          emit(AuthStateLoggedIn(user: user, isLoading: false));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e, isLoading: false));
        }
      }),
    );

    on<AuthEventShouldRegister>(
      ((event, emit) {
        emit(const AuthStateRegistering(exception: null, isLoading: false));
      }),
    );

    on<AuthEventSignUp>((event, emit) async {
      final name = event.name;
      final email = event.email;
      final password = event.password;
      final birthday = event.birthday;
      final phone = event.phone;

      try {
        await provider.signUp(
            name: name,
            email: email,
            password: password,
            birthday: birthday,
            phoneNumber: phone);
        emit(const AuthStateLoggedOut(exception: null, isLoading: false));
      } on Exception catch (e) {
        emit(AuthStateRegistering(exception: e, isLoading: false));
      }
    });

    on<AuthEventLogOut>(
      ((event, emit) async {
        try {
          await provider.logOut();
          emit(const AuthStateLoggedOut(exception: null, isLoading: false));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e, isLoading: false));
        }
      }),
    );

    on<AddProductSEvent>(
      ((event, emit) async {
        try {
          await cartDb.createCartItem(
              userId: currentUser.getUser().userId,
              itemId: event.itemId,
              itemName: event.itemName,
              itemCost: event.itemCost,
              itemQte: event.itemQte,
              itemImg: event.itemImg);
          debug.log("added to cart");
        } on Exception {
          return;
        }
      }),
    );
  }
}
