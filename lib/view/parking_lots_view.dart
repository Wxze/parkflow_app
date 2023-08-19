import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parkflow_app/view/parking_lots_page.dart';
import 'package:parkflow_app/view/reservations_page.dart';

import 'account_view.dart';
import 'vehicles_view.dart';

class ParkingLotsView extends StatefulWidget {
  const ParkingLotsView({Key? key}) : super(key: key);

  @override
  State<ParkingLotsView> createState() => _ParkingLotsViewState();
}

class _ParkingLotsViewState extends State<ParkingLotsView> {
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(15);

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  Color selectedColor = const Color(0xFF583290);
  Color unselectedColor = const Color(0xFF583290);

  // ignore: prefer_final_fields
  PageController _myPageController = PageController(initialPage: 0);

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
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Minha conta'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('Meus veículos'),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text('Sair'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 1) {
                Navigator.of(context).push(
                  PageTransition(
                    child: const AccountView(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 300),
                  ),
                );
              } else if (value == 2) {
                Navigator.of(context).push(
                  PageTransition(
                    child: const VehiclesView(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 300),
                  ),
                );
              } else if (value == 3) {
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: PageView(
        controller: _myPageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ParkingLotsPage(),
          ReservationsPage(),
          ParkingLotsPage(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: const Color(0xFFE7E7F3),
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: unselectedColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() {
          _selectedItemPosition = index;
          _myPageController.animateToPage(index,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300));
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.warehouse), label: 'Estacionamentos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.badge), label: 'Minhas reservas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: 'Meus pagamentos'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
