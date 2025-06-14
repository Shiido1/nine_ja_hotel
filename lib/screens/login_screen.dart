// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nine_ja_hotel/screens/app_color.dart';
import 'package:nine_ja_hotel/screens/text_form_widget.dart';
import 'package:nine_ja_hotel/screens/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../core/connect_end/model/login_entity_model.dart';
import '../core/connect_end/view_model/auth_view_model.dart';
import '../core/core_folder/app/app.locator.dart';
import 'app_validation.dart';
import 'button_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.redDark,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 100, left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  TextView(
                    text: '9jahotels',
                    color: AppColor.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 40),

                  Card(
                    elevation: 2,
                    shadowColor: const Color.fromARGB(
                      255,
                      77,
                      73,
                      73,
                    ).withOpacity(.5),
                    color: AppColor.red.withOpacity(.4),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 18,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColor.redDark,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView(
                            text: 'Sign',
                            color: AppColor.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),

                          SizedBox(height: 15.0),
                          TextFormWidget(
                            hint: 'Email address',
                            hintColor: AppColor.white,
                            label: '',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.2,
                              color: AppColor.textColor,
                            ),
                            fillColor: AppColor.white,
                            borderColor: AppColor.textColor,
                            border: 14,
                            isFilled: true,
                            controller: emailController,
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 15.0),
                          TextFormWidget(
                            hint: 'Password',
                            hintColor: AppColor.white,
                            label: '',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.2,
                              color: AppColor.textColor,
                            ),
                            fillColor: AppColor.white,
                            borderColor: AppColor.textColor,
                            border: 14,
                            isFilled: true,
                            controller: passwordController,
                            validator: AppValidator.validateString(),
                            suffixIcon: !model.isTogglePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        obscureText: !model.isTogglePassword,
                        onPasswordToggle: model.isOnTogglePassword,
                          ),
                          SizedBox(height: 35.0),
                          ButtonWidget(
                            buttonText: 'Sign in',
                            color: AppColor.white,
                            border: 14,
                            buttonWidth: double.infinity,
                            buttonColor: const Color.fromARGB(255, 101, 32, 27),
                            buttonBorderColor: Colors.transparent,
                            isLoading: model.isLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                model.loginUser(
                                  loginEntity: LoginEntityModel(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                  contxt: context,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
