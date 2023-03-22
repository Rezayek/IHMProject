import 'package:coffeeihmproject/Services/auth/bloc/auth_bloc.dart';
import 'package:coffeeihmproject/Services/auth/bloc/auth_event.dart';
import 'package:coffeeihmproject/Services/auth/bloc/auth_state.dart';
import 'package:coffeeihmproject/appContollers/inner_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_views/auth_views/login_view.dart';
import '../user_views/auth_views/sign_up_view.dart';
import 'dart:developer' as debug;

class OuterController extends StatefulWidget {
  const OuterController({super.key});

  @override
  State<OuterController> createState() => _OuterControllerState();
}

class _OuterControllerState extends State<OuterController> {
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthStateLoggedOut || state is AuthStateNeedsVerification) {
        return LoginView();
      } else if (state is AuthStateRegistering) {
        return const SignUpView();
      } else if (state is AuthStateLoggedIn) {
        return const InnerController();
      }else {
        return const  Scaffold(body: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
