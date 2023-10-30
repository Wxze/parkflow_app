import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';
import 'package:parkflow_app/view/widgets/masked_text_field.dart';

import '../repository/auth_repository.dart';
import '../utils/regex.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

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
                                'Nome',
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
                            child: DefaultTextField(
                              formController: _nameController,
                              hintText: 'Gabriel da Silva Toledo',
                              icon: Icons.person,
                              isPasswordField: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Preencha este campo';
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
                            child: DefaultTextField(
                              formController: _password1Controller,
                              hintText: '••••••',
                              icon: Icons.lock,
                              isPasswordField: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Preencha este campo';
                                }
                                if (value.length < 6) {
                                  return 'A senha deve ter no mínimo 6 caracteres';
                                }
                                if (value != _password2Controller.text) {
                                  return 'As senhas devem ser iguais';
                                }
                                return null;
                              },
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
                          SizedBox(
                            child: DefaultTextField(
                              formController: _password2Controller,
                              hintText: '••••••',
                              icon: Icons.lock,
                              isPasswordField: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Preencha este campo';
                                }
                                if (value.length < 6) {
                                  return 'A senha deve ter no mínimo 6 caracteres';
                                }
                                if (value != _password1Controller.text) {
                                  return 'As senhas devem ser iguais';
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
                          SizedBox(
                            child: MaskedTextField(
                              controller: _phoneController,
                              text: '(99) 99999-9999',
                              icon: Icons.phone,
                              isPasswordField: false,
                              keyboardType: TextInputType.phone,
                              maskFormatter: MaskTextInputFormatter(
                                mask: '(##) #####-####',
                                filter: {"#": RegExp(r'[0-9]')},
                                type: MaskAutoCompletionType.lazy,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Preencha este campo';
                                }
                                if (!RegExp(Regex.phone).hasMatch(value)) {
                                  return 'Número de telefone inválido';
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
                          SizedBox(
                            child: MaskedTextField(
                              controller: _cpfController,
                              text: '998.303.090-02',
                              icon: Icons.pin,
                              keyboardType: TextInputType.number,
                              maskFormatter: MaskTextInputFormatter(
                                mask: '###.###.###-##',
                                filter: {"#": RegExp(r'[0-9]')},
                                type: MaskAutoCompletionType.lazy,
                              ),
                              isPasswordField: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Preencha este campo';
                                }
                                if (!RegExp(Regex.cpf).hasMatch(value)) {
                                  return 'CPF inválido';
                                }
                                return null;
                              },
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
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (formKey.currentState!.validate()) {
                                      Response resp = await AuthRepository()
                                          .register(
                                              _emailController.text,
                                              _password1Controller.text,
                                              _cpfController.text,
                                              _nameController.text,
                                              _phoneController.text);

                                      if (resp.statusCode == 200 ||
                                          resp.statusCode == 201) {
                                        showSucessSnackBar(
                                            'Usuário cadastrado com sucesso!');
                                        redirectUser();
                                      } else {
                                        final data = await json
                                            .decode(resp.body.toString());
                                            
                                        showErrorSnackBar(
                                          data['errors']['full_messages']
                                              .join(',\n'),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Cadastrar',
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
            ),
          )
        ],
      ),
    );
  }

  void redirectUser() {
    Navigator.of(context).pop();
  }

  void showSucessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
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

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
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
}
