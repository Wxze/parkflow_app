import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  child: Center(
                    child: Text(
                      'ParkFlow',
                      style:
                          GoogleFonts.galada(color: Colors.white, fontSize: 40),
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
          Container(
            alignment: Alignment.topCenter,
            padding:
                EdgeInsets.only(top: height * .22, right: 20.0, left: 20.0),
            child: SizedBox(
              width: width,
              child: Card(
                color: Colors.white,
                elevation: 4.0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.lato(
                            fontSize: 24,
                            color: const Color(0xFF35244E),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Email',
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              color: const Color(0xFF000000),
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
                          hintText: 'parflow@email.com',
                          icon: Icons.person,
                          isPasswordField: false,
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Senha',
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              color: const Color(0xFF000000),
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
                    ],
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
