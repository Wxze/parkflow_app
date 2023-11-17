import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:parkflow_app/repository/external_customer_repository.dart';
import 'package:parkflow_app/view/widgets/default_card_message.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';
import 'package:parkflow_app/view/widgets/masked_text_field.dart';

import '../models/external_customer.dart';
import '../utils/regex.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          'ParkFlow',
          style: TextStyle(fontFamily: 'Galada', color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Minha conta',
                        style: TextStyle(color: Color(0xFF35244E), fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: const Color(0xFFFFFFFF),
                    elevation: 3,
                    child: Container(
                      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFF69479B), width: 5))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Form(
                          key: formKey,
                          child: FutureBuilder(
                            future: ExternalCustomersRepository().getExternalCustomer(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              } else if (!snapshot.hasData) {
                                return const DefaultCardMessage(message: 'Erro ao recuperar dados do usuário.');
                              } else {
                                ExternalCustomer externalCustomer = snapshot.data!;
                                _nameController.text = externalCustomer.driverName;
                                _phoneController.text = externalCustomer.driverPhone;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Nome',
                                      style: TextStyle(color: Color(0xFF4F2D82), fontWeight: FontWeight.bold),
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
                                      height: 16,
                                    ),
                                    const Text(
                                      'Telefone',
                                      style: TextStyle(color: Color(0xFF4F2D82), fontWeight: FontWeight.bold),
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
                                      height: 26,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              FocusManager.instance.primaryFocus?.unfocus();
                                              if (formKey.currentState!.validate()) {
                                                Response resp = await ExternalCustomersRepository().updateExternalCustomer(
                                                    email: externalCustomer.email,
                                                    driverId: externalCustomer.driverId,
                                                    driverName: _nameController.text,
                                                    driverPhone: _phoneController.text);

                                                if (resp.statusCode == 200) {
                                                  showSucessSnackBar(
                                                    'Dados alterados com sucesso!',
                                                  );
                                                } else {
                                                  showErrorSnackBar('Erro ao alterar dados.');
                                                }
                                              }
                                            },
                                            child: const Text(
                                              'Salvar alterações',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
