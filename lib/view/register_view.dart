import 'package:flutter/material.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Cadastro",
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
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Confirmar senha',
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
                          height: 17,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Telefone',
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
                            hintText: '(16) 99999-9999',
                            icon: Icons.phone,
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
                              'CPF',
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
                            hintText: '998.303.090-02',
                            icon: Icons.pin,
                            isPasswordField: false,
                          ),
                        ),
                        const SizedBox(
                          height: 29,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Cadastrar',
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
