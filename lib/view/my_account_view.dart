import 'package:flutter/material.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Minha conta',
                        style: TextStyle(
                            color: Color(0xFF35244E),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('Desativar conta pressionado');
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFC45454))),
                        child: const Row(
                          children: [
                            Icon(Icons.person_remove),
                            SizedBox(width: 9),
                            Text('Desativar conta')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
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
                            const DefaultTextField(
                              icon: Icons.person,
                              hintText: 'Fallen da Silva Toledo',
                              isPasswordField: false,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  color: Color(0xFF4F2D82),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const DefaultTextField(
                              icon: Icons.mail,
                              hintText: 'parkflow@email.com',
                              isPasswordField: false,
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
                            const DefaultTextField(
                              icon: Icons.phone,
                              hintText: '(16) 99999-9999',
                              isPasswordField: false,
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Salvar alterações',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
