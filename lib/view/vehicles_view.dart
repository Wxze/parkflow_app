import 'package:flutter/material.dart';
import 'package:parkflow_app/models/vehicle.dart';
import 'package:parkflow_app/repository/vehicles_repository.dart';
import 'package:parkflow_app/view/widgets/default_card_message.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';
import 'package:parkflow_app/view/widgets/vehicles_list_tile.dart';

class VehiclesView extends StatefulWidget {
  const VehiclesView({super.key});

  @override
  State<VehiclesView> createState() => _VehiclesViewState();
}

class _VehiclesViewState extends State<VehiclesView> {
  TextEditingController _defaultController = TextEditingController();
  late List<Vehicle> vehicles;

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
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meus veículos',
                          style: TextStyle(
                            color: Color(0xFF35244E),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List<Vehicle>>(
                    future: VehiclesRepository().getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (!snapshot.hasData) {
                        return const DefaultCardMessage(
                            message: 'Não há veículos cadastrados.');
                      } else {
                        vehicles = snapshot.data!;
                        if (vehicles.isNotEmpty) {
                          return ListView.separated(
                            itemCount: vehicles.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return VehiclesListTile(
                                vehicle: vehicles[index],
                                resetVehiclesListState: () {
                                  setState(
                                    () {
                                      vehicles = vehicles;
                                    },
                                  );
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 16,
                              );
                            },
                          );
                        } else {
                          return const DefaultCardMessage(
                              message: 'Não há veículos cadastrados.');
                        }
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF583290),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Número de placa',
                            style: TextStyle(
                                color: Color(0xFF4F2D82),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          DefaultTextField(
                            formController: _defaultController,
                            icon: Icons.abc,
                            hintText: 'BRA2E19',
                            isPasswordField: false,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Marca',
                            style: TextStyle(
                                color: Color(0xFF4F2D82),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          DefaultTextField(
                            formController: _defaultController,
                            icon: Icons.branding_watermark_outlined,
                            hintText: 'Honda',
                            isPasswordField: false,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Modelo',
                            style: TextStyle(
                                color: Color(0xFF4F2D82),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          DefaultTextField(
                            formController: _defaultController,
                            icon: Icons.branding_watermark_outlined,
                            hintText: 'Civic',
                            isPasswordField: false,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Cor',
                            style: TextStyle(
                                color: Color(0xFF4F2D82),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          DefaultTextField(
                            formController: _defaultController,
                            icon: Icons.colorize,
                            hintText: 'Preto',
                            isPasswordField: false,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Tipo de veículo',
                            style: TextStyle(
                                color: Color(0xFF4F2D82),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          DefaultTextField(
                            formController: _defaultController,
                            icon: Icons.directions_car_rounded,
                            hintText: 'Carro',
                            isPasswordField: false,
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        color: Color(0xFF583290),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancelar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xFF583290)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Adicionar',
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
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(
      () {
        vehicles = vehicles;
      },
    );
  }
}
