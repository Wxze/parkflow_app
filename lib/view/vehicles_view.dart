import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:parkflow_app/models/vehicle.dart';
import 'package:parkflow_app/repository/vehicles_repository.dart';
import 'package:parkflow_app/view/widgets/default_card_message.dart';
import 'package:parkflow_app/view/widgets/default_text_field.dart';
import 'package:parkflow_app/view/widgets/masked_text_field.dart';
import 'package:parkflow_app/view/widgets/vehicles_list_tile.dart';

import '../utils/regex.dart';

class VehiclesView extends StatefulWidget {
  const VehiclesView({super.key});

  @override
  State<VehiclesView> createState() => _VehiclesViewState();
}

class _VehiclesViewState extends State<VehiclesView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late List<Vehicle> vehicles;
  TextEditingController _licensePlateController = TextEditingController();
  TextEditingController _brandController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _vehicleTypeController = TextEditingController();

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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Form(
                          key: formKey,
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
                              SizedBox(
                                child: MaskedTextField(
                                  controller: _licensePlateController,
                                  text: 'BRA2E19',
                                  icon: Icons.abc,
                                  isPasswordField: false,
                                  maskFormatter: MaskTextInputFormatter(
                                    mask: '#######',
                                    filter: {"#": RegExp(r'[0-9A-Za-z]')},
                                    type: MaskAutoCompletionType.lazy,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Preencha este campo';
                                    }
                                    if (!RegExp(Regex.licensePlate)
                                        .hasMatch(value.toUpperCase())) {
                                      return 'Número de placa inválido';
                                    }
                                    return null;
                                  },
                                ),
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
                                formController: _brandController,
                                icon: Icons.branding_watermark_outlined,
                                hintText: 'Honda',
                                isPasswordField: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Preencha este campo';
                                  }
                                  return null;
                                },
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
                                formController: _modelController,
                                icon: Icons.branding_watermark_outlined,
                                hintText: 'Civic',
                                isPasswordField: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Preencha este campo';
                                  }
                                  return null;
                                },
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
                                formController: _colorController,
                                icon: Icons.colorize,
                                hintText: 'Preto',
                                isPasswordField: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Preencha este campo';
                                  }
                                  return null;
                                },
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
                                formController: _vehicleTypeController,
                                icon: Icons.directions_car_rounded,
                                hintText: 'Carro / Moto',
                                isPasswordField: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Preencha este campo';
                                  }
                                  if (value.toUpperCase() != 'CARRO' &&
                                      value.toUpperCase() != 'MOTO') {
                                    print(value.toUpperCase());
                                    return "O tipo de veículo deve ser 'Carro' ou 'Moto'";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                          const BorderSide(
                                            color: Color(0xFF583290),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
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
                                      onPressed: () async {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        if (formKey.currentState!.validate()) {
                                          Vehicle formVehicle = Vehicle(
                                              id: '',
                                              licensePlate:
                                                  _licensePlateController.text
                                                      .toUpperCase(),
                                              brand: _brandController.text,
                                              model: _modelController.text,
                                              color: _colorController.text,
                                              vehicleType:
                                                  _vehicleTypeController.text);

                                          Response resp =
                                              await VehiclesRepository()
                                                  .addVehicle(formVehicle);

                                          if (resp.statusCode == 200 ||
                                              resp.statusCode == 201) {
                                            showSucessSnackBar(
                                                'Veículo cadastrado com sucesso!');
                                            _pullRefresh();
                                            redirectUser();
                                          } else {
                                            final data = await json
                                                .decode(resp.body.toString());

                                            redirectUser();
                                            showErrorSnackBar(
                                                "O número de placa ${data['errors']['fields']['license_plate'].join(',\n')}.");
                                          }
                                        }
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
                      ),
                    ],
                  ),
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
