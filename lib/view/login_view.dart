import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Column(
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
          Container(
            alignment: Alignment.topCenter,
            padding:
                EdgeInsets.only(top: height * .22, right: 20.0, left: 20.0),
            child: Container(
              height: 200.0,
              width: width,
              child: const Card(
                color: Colors.white,
                elevation: 4.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
