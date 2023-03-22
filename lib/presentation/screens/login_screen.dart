import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_system/core/services/services_locator.dart';
import 'package:invoice_system/presentation/controller/logIn/log_in_bloc.dart';
import 'package:invoice_system/presentation/screens/main_screen.dart';
import 'package:invoice_system/presentation/screens/shared/custom_button.dart';
import 'package:invoice_system/presentation/screens/widget/custom_rich_text.dart';
import 'package:invoice_system/utils/appConst.dart';
import 'package:invoice_system/utils/extentions/padding_extention.dart';
import 'package:invoice_system/utils/extentions/string_validate_extention.dart';

import 'shared/custom_form_field.dart';
import 'widget/login_header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPassword = true;
  late TextEditingController emailController;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: 'hebaskhail@gmail.com');
    passwordController = TextEditingController(text: 'Heba@123456');
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          lazy: true,
          create: (context) => getIt<LogInBloc>()
            ..add(
              LoginBlocEvent(
                email: emailController.text.toString().trim(),
                password: passwordController.text.toString().trim(),
              ),
            ),
          child: BlocBuilder<LogInBloc, LogInBlocState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 34,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const LoginHeaderWidget(
                          title: 'LOG IN',
                        ),
                        34.ph,
                        CustomTextFormField(
                          validator: (value) {
                            if (!value!.isValidEmail) {
                              return 'enter valid email';
                            }
                          },
                          hintText: 'Email',
                          editingController: emailController,
                        ),
                        16.ph,
                        CustomTextFormField(
                          suffixIcon: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            disabledColor: Colors.transparent,
                            color: _isPassword ? Colors.grey : Colors.blue,
                            onPressed: () {
                              setState(() {
                                _isPassword = !_isPassword;
                              });
                            },
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter valid password';
                            }
                            if (value.trim().length < 6) {
                              return 'minimum length 6 ';
                            }
                            if (!value.isContainSmallLetter(value)) {
                              return 'Should contain at least a small letter';
                            }
                            if (!value.isContainCapitalLetter(value)) {
                              return 'Should contain at least a capital letter';
                            }
                            if (!value.isContainSpecialCharacter(value)) {
                              return 'Should contain at least a Special Character';
                            }
                            if (!value.isContainNumber(value)) {
                              return 'Should contain at least a Number';
                            }
                            return null;
                          },
                          isPassword: _isPassword,
                          hintText: 'Password',
                          editingController: passwordController,
                        ),
                        8.ph,
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('forget password ?'),
                          ),
                        ),
                        24.ph,
                        CustomButton(
                          onTap: () {
                            if (emailController.text.toString().isNotEmpty &&
                                passwordController.text.toString().isNotEmpty) {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const MainScreen();
                                }));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Success'),
                                  ),
                                );
                              }
                            }
                          },
                          title: 'LOG IN',
                        ),
                        CustomRichText(
                          title: 'Don\'t have an account yet ?',
                          subTitle: ' SIGN UP',
                          subTextStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: AppConstFontWeight.bold,
                                  color: ColorManger.primaryColor!),
                          tapGestureRecognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const MainScreen();
                                  },
                                ),
                              );
                            },
                          padding: const EdgeInsets.all(20),
                          titleStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.black.withOpacity(.7),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
