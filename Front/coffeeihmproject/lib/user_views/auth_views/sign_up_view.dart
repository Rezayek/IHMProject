import 'package:coffeeihmproject/Services/auth/api_controller/auth_exception.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'dart:developer' as debug;

import '../../Services/auth/bloc/auth_bloc.dart';
import '../../Services/auth/bloc/auth_event.dart';
import '../../Services/auth/bloc/auth_state.dart';
import '../../constants/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/check_box_widget.dart';
import '../../widgets/input_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpView> {
  late final TextEditingController _userNameController;
  late final TextEditingController _userEmailController;
  late final TextEditingController _userPasswordController;
  late final TextEditingController _userConfirmPasswordController;
  late final TextEditingController _userBirthdayController;
  late final TextEditingController _userPhoneNumberController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _userEmailController = TextEditingController();
    _userPasswordController = TextEditingController();
    _userConfirmPasswordController = TextEditingController();
    _userBirthdayController = TextEditingController();
    _userPhoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userConfirmPasswordController.dispose();
    _userBirthdayController.dispose();
    _userPhoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateSignUp) {
          if (state.exception is GenericAuthException) {
            debug.log("Generic");
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context
                .read<AuthBloc>()
                .add(const AuthEventLogOut());
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 45,
                color: coldBrewCoffeeColor,
              )),
          title: TitleWidget(
              text: "SignUp",
              size: 35,
              textWeight: FontWeight.w600,
              textColor: coldBrewCoffeeColor,
              paddingTop: 5,
              paddingBottom: 0,
              paddingLeft: 0,
              aligment: Alignment.center),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          elevation: 0,
          backgroundColor: blackCoffeeColor.withOpacity(0.2),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/signup.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.82,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(colors: [
                      coffeeCakeColor.withOpacity(0.7),
                      arabicCoffeeColor.withOpacity(0.7),
                      oldCoffeeColor.withOpacity(0.7)
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleWidget(
                      text: "Please FIll your infos",
                      size: 27,
                      textWeight: FontWeight.w600,
                      textColor: brownCoffeeColor,
                      paddingTop: 10,
                      paddingBottom: 5,
                      paddingLeft: 0,
                      aligment: Alignment.topCenter,
                    ),
                    TitleWidget(
                      text: "Name",
                      size: 18,
                      textWeight: FontWeight.w600,
                      textColor: coffeeCakeColor,
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 25,
                      aligment: Alignment.centerLeft,
                    ),
                    InputWidget(
                      controller: _userNameController,
                      textColor: coffeeCakeColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      textType: TextInputType.emailAddress,
                      isObscure: false,
                      hintText: "Enter Name",
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 10,
                    ),
                    TitleWidget(
                      text: "Email Address",
                      size: 18,
                      textWeight: FontWeight.w600,
                      textColor: coffeeCakeColor,
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 25,
                      aligment: Alignment.centerLeft,
                    ),
                    InputWidget(
                      controller: _userEmailController,
                      textColor: coffeeCakeColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      textType: TextInputType.emailAddress,
                      isObscure: false,
                      hintText: "Enter Email",
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 10,
                    ),
                    TitleWidget(
                      text: "Password",
                      size: 18,
                      textWeight: FontWeight.w600,
                      textColor: coffeeCakeColor,
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 25,
                      aligment: Alignment.centerLeft,
                    ),
                    InputWidget(
                      controller: _userPasswordController,
                      textColor: coffeeCakeColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      textType: TextInputType.emailAddress,
                      isObscure: true,
                      hintText: "Enter password",
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 10,
                    ),
                    TitleWidget(
                      text: "Confirm password",
                      size: 18,
                      textWeight: FontWeight.w600,
                      textColor: coffeeCakeColor,
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 25,
                      aligment: Alignment.centerLeft,
                    ),
                    InputWidget(
                      controller: _userConfirmPasswordController,
                      textColor: coffeeCakeColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      textType: TextInputType.emailAddress,
                      isObscure: false,
                      hintText: "Confirm password",
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 10,
                    ),
                    TitleWidget(
                      text: "Birthday",
                      size: 18,
                      textWeight: FontWeight.w600,
                      textColor: coffeeCakeColor,
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 25,
                      aligment: Alignment.centerLeft,
                    ),
                    InputWidget(
                      controller: _userBirthdayController,
                      textColor: coffeeCakeColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      textType: TextInputType.emailAddress,
                      isObscure: false,
                      hintText: "Enter birthday",
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 10,
                    ),
                    TitleWidget(
                      text: "Phone Number",
                      size: 18,
                      textWeight: FontWeight.w600,
                      textColor: coffeeCakeColor,
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 25,
                      aligment: Alignment.centerLeft,
                    ),
                    InputWidget(
                      controller: _userPhoneNumberController,
                      textColor: coffeeCakeColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      textType: TextInputType.emailAddress,
                      isObscure: false,
                      hintText: "Enter phone Number",
                      paddingTop: 5,
                      paddingBottom: 5,
                      paddingLeft: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          CheckBoxWidget(),
                          TitleWidget(
                            text: "I agree to all terms",
                            size: 15,
                            textWeight: FontWeight.w600,
                            textColor: coffeeCakeColor,
                            paddingTop: 5,
                            paddingBottom: 3,
                            paddingLeft: 5,
                            aligment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          context
                          .read<AuthBloc>()
                          .add(AuthEventSignUp(_userNameController.text, _userEmailController.text, _userPasswordController.text, _userBirthdayController.text, _userPhoneNumberController.text));
                        },
                        child: ButtonWidget(
                          heightCoef: 0.07,
                          widthCoef: 0.35,
                          text: "Sign",
                          textColor: coffeeCakeColor,
                          fontSize: 30,
                          textWeight: FontWeight.w600,
                          aligment: Alignment.center,
                          paddingTop: 0,
                          paddingBottom: 0,
                          paddingLeft: 0,
                          paddingLeftContainer: 0,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
