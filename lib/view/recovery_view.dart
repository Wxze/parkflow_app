import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:parkflow_app/repository/password_repository.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';

import '../utils/regex.dart';

class RecoveryView extends StatefulWidget {
  const RecoveryView({super.key});

  @override
  State<RecoveryView> createState() => _RecoveryViewState();
}

class _RecoveryViewState extends State<RecoveryView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
                          "Recuperar senha",
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
                          child: Form(
                            key: formKey,
                            child: DefaultTextField(
                              formController: _emailController,
                              hintText: 'parkflow@email.com',
                              icon: Icons.mail,
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
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 5),
                                child: const Text(
                                  'Voltar',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFFC45454)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    Response resp = await PasswordRepository()
                                        .sendEmail(_emailController.text);

                                    final data =
                                        await json.decode(resp.body.toString());

                                    if (resp.statusCode == 200) {
                                      showSnackBar(
                                        data['message'],
                                      );
                                      redirectUser();
                                    }
                                  }
                                },
                                child: const Text(
                                  'Enviar',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 8),
      content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Flexible(child: Text(message))
      ]),
      backgroundColor: const Color(0xFF44A33C),
    ));
  }

  void redirectUser() {
    Navigator.of(context).pop();
  }
}
