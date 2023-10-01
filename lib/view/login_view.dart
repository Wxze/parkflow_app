import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parkflow_app/repository/login_repository.dart';
import 'package:parkflow_app/view/parking_lots_view.dart';
import 'package:parkflow_app/view/recovery_view.dart';
import 'package:parkflow_app/view/register_view.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';

import '../utils/regex.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: height * .30,
                  decoration: const BoxDecoration(
                    color: Color(0xFF583290),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                  child: const Center(
                    child: Text(
                      'ParkFlow',
                      style: TextStyle(
                          fontFamily: 'Galada',
                          color: Colors.white,
                          fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  height: height * .70,
                  color: const Color(0xFFF5F5F5),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              padding:
                  EdgeInsets.only(top: height * .22, right: 20.0, left: 20.0),
              child: SizedBox(
                width: width,
                child: Card(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 24,
                                color: Color(0xFF35244E),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                  color: Color(0xFF000000),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            // height: 31,
                            child: DefaultTextField(
                              formController: _emailController,
                              hintText: 'parkflow@email.com',
                              icon: Icons.person,
                              isPasswordField: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Preencha este campo';
                                }
                                if (!RegExp(Regex.email).hasMatch(value)) {
                                  return 'Email inválido';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Senha',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                  color: Color(0xFF000000),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            // height: 31,
                            child: DefaultTextField(
                              formController: _passwordController,
                              hintText: '•••••••••••••••',
                              icon: Icons.lock,
                              isPasswordField: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Preencha este campo';
                                }
                                if (value.length < 6) {
                                  return 'A senha deve ter no mínimo 6 caracteres';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  PageTransition(
                                    child: const RecoveryView(),
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 300),
                                  ),
                                ),
                                child: const Text(
                                  'Esqueci minha senha',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xBF120A1D)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (formKey.currentState!.validate()) {
                                      Response resp = await LoginRepository()
                                          .login(_emailController.text,
                                              _passwordController.text);

                                      if (resp.statusCode == 200) {
                                        _passwordController.text = '';
                                        redirectUser();
                                      } else {
                                        final data = await json
                                            .decode(resp.body.toString());

                                        showSnackBar(
                                          data['errors'].join(',\n'),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                            width: 155,
                            height: 5,
                            child: Divider(
                              color: Color(0x73120A1D),
                              thickness: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Não possui conta?',
                                style: TextStyle(
                                  color: Color(0xFF120A1D),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  PageTransition(
                                    child: const RegisterView(),
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 300),
                                  ),
                                ),
                                child: const Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                    color: Color(0xFF69479B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Icon(
          Icons.error,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Flexible(child: Text(message))
      ]),
      backgroundColor: Colors.red,
    ));
  }

  void redirectUser() {
    Navigator.of(context).push(
      PageTransition(
          child: const ParkingLotsView(),
          type: PageTransitionType.size,
          alignment: Alignment.center),
    );
  }
}
