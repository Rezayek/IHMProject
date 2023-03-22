import 'package:coffeeihmproject/Services/auth/bloc/auth_event.dart';
import 'package:coffeeihmproject/widgets/button_widget.dart';
import 'package:coffeeihmproject/widgets/input_widget.dart';
import 'package:coffeeihmproject/widgets/login_with_button.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffeeihmproject/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:developer' as debug;

import '../../Services/auth/api_controller/auth_exception.dart';
import '../../Services/auth/bloc/auth_bloc.dart';
import '../../Services/auth/bloc/auth_state.dart';
import '../../dialogs/error_dialog.dart';
import '../../dialogs/loading_dialog.dart';



class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  CloseDialog? _closeDialogHandle;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        final closeDialog = _closeDialogHandle;
        if (state is AuthStateLoggedOut) {
          if (!state.isLoading && closeDialog != null) {
            closeDialog();
            _closeDialogHandle = null;
          } else if (state.isLoading && closeDialog == null) {
            _closeDialogHandle =
                showLoadingDialog(context: context, text: state.loadingText);
          }
          if (state.exception is UserNotFoundAuthException) {
            await errorDialog('An Error has occurred',context, 'User not found');
          } else if (state.exception is WrongPasswordAuthException) {
            await errorDialog('An Error has occurred',context, 'Wrong email or password');
          } else if (state.exception is GenericAuthException) {
            await errorDialog('An Error has occurred',context, 'indentified Error try again');
          }
        } else if (state is AuthStateForgotPassword) {
          if (state.exception is InvalidEmailAuthException) {
            await errorDialog('An Error has occurred', context, 'Invalid email');
          } else if (state.exception is UserNotFoundAuthException) {
            await errorDialog('An Error has occurred', context, 'User not found');
          } else if (state.exception is GenericAuthException) {
            await errorDialog('An Error has occurred', context, 'indentified Error try again');
          } else if (state.exception == null && state.hasSentEmail) {
            await errorDialog('An Error has occurred', context, 'Areset Email has been sended');
          }
        } else if (state is AuthStateNeedsVerification) {
          if (!state.isLoading && closeDialog != null) {
            closeDialog();
            _closeDialogHandle = null;
            await errorDialog('An Error has occurred', context, 'Account is not verified');
          }
          
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.jpg'), fit: BoxFit.fill),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.10)),
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/beens_categorie.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: orangeCoffeeColor.withOpacity(0.6), width: 6),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04)),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: freshlyRoastedCoffeeColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.48,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Column(
                            children: [
                              TitleWidget(
                                text: "Login",
                                size: 35,
                                textWeight: FontWeight.w600,
                                textColor: coffeeCakeColor,
                                paddingTop: 10,
                                paddingBottom: 15,
                                paddingLeft: 0,
                                aligment: Alignment.topCenter,
                              ),
                              TitleWidget(
                                text: "Email",
                                size: 20,
                                textWeight: FontWeight.w400,
                                textColor: coffeeCakeColor,
                                paddingTop: 5,
                                paddingBottom: 10,
                                paddingLeft: 15,
                                aligment: Alignment.centerLeft,
                              ),
                              InputWidget(
                                controller: _emailController,
                                textColor: coffeeCakeColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                textType: TextInputType.emailAddress,
                                isObscure: false,
                                hintText: "Enter email",
                                paddingTop: 5,
                                paddingBottom: 10,
                                paddingLeft: 12,
                              ),
                              TitleWidget(
                                text: "Password",
                                size: 20,
                                textWeight: FontWeight.w400,
                                textColor: coffeeCakeColor,
                                paddingTop: 5,
                                paddingBottom: 10,
                                paddingLeft: 10,
                                aligment: Alignment.centerLeft,
                              ),
                              InputWidget(
                                controller: _passwordController,
                                textColor: coffeeCakeColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                textType: TextInputType.emailAddress,
                                isObscure: true,
                                hintText: "Enter password",
                                paddingTop: 5,
                                paddingBottom: 10,
                                paddingLeft: 12,
                              ),
                              SizedBox(
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TitleWidget(
                                      text: "Fogot password? ",
                                      size: 15,
                                      textWeight: FontWeight.w400,
                                      textColor: coffeeCakeColor,
                                      paddingTop: 5,
                                      paddingBottom: 10,
                                      paddingLeft: 0,
                                      aligment: Alignment.centerLeft,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: TitleWidget(
                                        text: "Tap here",
                                        size: 15,
                                        textWeight: FontWeight.w600,
                                        textColor:
                                            Color.fromARGB(255, 0, 139, 253),
                                        paddingTop: 5,
                                        paddingBottom: 10,
                                        paddingLeft: 0,
                                        aligment: Alignment.centerLeft,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          context
                                          .read<AuthBloc>()
                                          .add(AuthEventLogIn(_emailController.text, _passwordController.text));
                                        },
                                        child: ButtonWidget(
                                          heightCoef: 0.07,
                                          widthCoef: 0.24,
                                          text: "Login",
                                          textColor: coffeeCakeColor,
                                          fontSize: 20,
                                          textWeight: FontWeight.w500,
                                          aligment: Alignment.center,
                                          paddingTop: 0,
                                          paddingBottom: 0,
                                          paddingLeft: 0,
                                          paddingLeftContainer: 0,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          context
                                          .read<AuthBloc>()
                                          .add(const AuthEventShouldRegister());
                                        },
                                        child: ButtonWidget(
                                          heightCoef: 0.07,
                                          widthCoef: 0.25,
                                          text: "SignUp",
                                          textColor: coffeeCakeColor,
                                          fontSize: 20,
                                          textWeight: FontWeight.w500,
                                          aligment: Alignment.center,
                                          paddingTop: 0,
                                          paddingBottom: 0,
                                          paddingLeft: 0,
                                          paddingLeftContainer: 15,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginWithButton(height: 50, width: MediaQuery.of(context).size.width*0.75, icon: FontAwesomeIcons.google, text: "Login With Google"),
                          LoginWithButton(height: 50, width: MediaQuery.of(context).size.width*0.75, icon: FontAwesomeIcons.twitter, text: "Login With Twitter"),
                        ],
                      )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
