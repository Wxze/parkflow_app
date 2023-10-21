import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';
import 'package:parkflow_app/view/widgets/masked_text_field.dart';

import '../utils/regex.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

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
          style: TextStyle(
              fontFamily: 'Galada', color: Colors.white, fontSize: 24),
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
                        style: TextStyle(
                            color: Color(0xFF35244E),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
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
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Color(0xFF69479B), width: 5))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nome',
                                style: TextStyle(
                                    color: Color(0xFF4F2D82),
                                    fontWeight: FontWeight.bold),
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
                                style: TextStyle(
                                    color: Color(0xFF4F2D82),
                                    fontWeight: FontWeight.bold),
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
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        if (formKey.currentState!.validate()) {
                                          print('form alter valid');
                                        }
                                      },
                                      child: const Text(
                                        'Salvar alterações',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
}
