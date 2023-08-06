import 'package:flutter/material.dart';
import 'package:parkflow_app/view/widgets/parking_lots_list_tile.dart';

class ParkingLotsPage extends StatefulWidget {
  const ParkingLotsPage({super.key});

  @override
  State<ParkingLotsPage> createState() => _ParkingLotsPageState();
}

class _ParkingLotsPageState extends State<ParkingLotsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Estacionamentos',
                  style: TextStyle(
                      color: Color(0xFF35244E),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'perto de você',
                  style: TextStyle(
                      color: Color(0xBF4A326D),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filtros',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xFF583290),
                      child: IconButton(
                        onPressed: () {},
                        splashRadius: 25,
                        icon: const Icon(
                          Icons.tune,
                          size: 20,
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    maxLines: 1,
                    textInputAction: TextInputAction.search,
                    decoration: const InputDecoration(
                      isDense: true,
                      filled: true,
                      // fillColor: Color(0xFFF0EDF5),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      prefixIconConstraints:
                          BoxConstraints(minHeight: 32, minWidth: 32),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Pesquisar estacionamentos por localização',
                      hintStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 14,
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const ParkingLotsListTile();
            },
            clipBehavior: Clip.none,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 16,
              );
            },
          )
        ],
      ),
    );
  }
}
