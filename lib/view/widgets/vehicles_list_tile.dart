import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:parkflow_app/repository/vehicles_repository.dart';

import '../../models/vehicle.dart';

class VehiclesListTile extends StatefulWidget {
  const VehiclesListTile(
      {super.key, required this.vehicle, required this.resetVehiclesListState});
  final Vehicle vehicle;
  final Function resetVehiclesListState;

  @override
  State<VehiclesListTile> createState() => _VehiclesListTileState();
}

class _VehiclesListTileState extends State<VehiclesListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFF0EDF5),
              child: Icon(
                widget.vehicle.vehicleType == 'car'
                    ? Icons.directions_car_rounded
                    : Icons.two_wheeler_rounded,
                color: const Color(0xFF4A326D),
              ),
            ),
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.vehicle.brand} ${widget.vehicle.model}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF35244E),
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    widget.vehicle.licensePlate,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF583290),
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () async {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  'Deseja excluir o veículo selecionado?',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )),
                                      const SizedBox(height: 24),
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
                                                Response resp =
                                                    await VehiclesRepository()
                                                        .deleteVehicle(
                                                            widget.vehicle.id);

                                                if (resp.statusCode == 204) {
                                                  _redirectUser();
                                                  showSnackBar(
                                                      'Veículo excluído com sucesso!');
                                                  widget
                                                      .resetVehiclesListState();
                                                }
                                              },
                                              child: const Text(
                                                'Excluir',
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
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Color(0xFFC45454),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  void showSnackBar(String message) {
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

  void _redirectUser() {
    Navigator.of(context).pop();
  }
}
