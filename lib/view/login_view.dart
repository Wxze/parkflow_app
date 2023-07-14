import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parkflow_app/view/parking_lots_view.dart';
import 'package:parkflow_app/view/register_view.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  color: Colors.white,
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
                        const SizedBox(
                          height: 31,
                          child: DefaultTextField(
                            hintText: 'parkflow@email.com',
                            icon: Icons.person,
                            isPasswordField: false,
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
                        const SizedBox(
                          height: 31,
                          child: DefaultTextField(
                            hintText: '•••••••••••••••',
                            icon: Icons.lock,
                            isPasswordField: true,
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Esqueci minha senha',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xBF120A1D)),
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
                                onPressed: () {
                                  Navigator.of(context).push(
                                    PageTransition(
                                        child: const ParkingLotsView(),
                                        type: PageTransitionType.size,
                                        alignment: Alignment.center),
                                  );
                                },
                                child: const Text(
                                  'Entrar',
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          )
        ],
      ),
    );
  }
}
