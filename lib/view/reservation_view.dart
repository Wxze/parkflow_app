import 'dart:convert';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:parkflow_app/models/parking_lot.dart';
import 'package:parkflow_app/models/vacancy.dart';
import 'package:parkflow_app/repository/reservations_repository.dart';
import 'package:parkflow_app/repository/vacancies_repository.dart';
import 'package:parkflow_app/view/widgets/default_vacancy_card_message.dart';
import 'package:parkflow_app/view/widgets/vacancy_card.dart';
import 'package:parkflow_app/view/widgets/vehicle_card.dart';

import '../models/vehicle.dart';
import '../repository/vehicles_repository.dart';

class ReservationView extends StatefulWidget {
  const ReservationView({super.key, required this.parkingLot});
  final ParkingLot parkingLot;

  @override
  State<ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView> {
  final format = DateFormat("dd/MM/yyyy HH:mm");
  DateTime selectedDate = DateTime.now();
  final TextEditingController _dateTimeController = TextEditingController();
  late List<Vacancy> vacancies;
  String selectedVacancyCardId = '';
  String selectedVehicleCardId = '';

  late List<Vehicle> vehicles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.parkingLot.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFF35244E), fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Selecione a vaga desejada',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF35244E),
                  ),
                ),
              ),
              SizedBox(
                height: 135,
                child: FutureBuilder<List<Vacancy>>(
                  future: VacanciesRepository().getAll(widget.parkingLot.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return const DefaultVacancyCardMessage(message: 'Não há vagas disponíveis.');
                    } else {
                      vacancies = snapshot.data!;
                      if (vacancies.isNotEmpty) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: vacancies.length,
                          itemBuilder: (context, index) {
                            return VacancyCard(
                              vacancy: vacancies[index],
                              isSelected: vacancies[index].id == selectedVacancyCardId,
                              onCardTapped: () {
                                setState(() {
                                  selectedVacancyCardId = vacancies[index].id;
                                });
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 5);
                          },
                        );
                      } else {
                        return const DefaultVacancyCardMessage(message: 'Não há vagas disponíveis.');
                      }
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Selecione seu veículo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF35244E),
                  ),
                ),
              ),
              SizedBox(
                height: 135,
                child: FutureBuilder<List<Vehicle>>(
                  future: VehiclesRepository().getAll(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return const DefaultVacancyCardMessage(message: 'Não há veículos cadastrados.');
                    } else {
                      vehicles = snapshot.data!;
                      if (vehicles.isNotEmpty) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: vehicles.length,
                          itemBuilder: (context, index) {
                            return VehicleCard(
                              vehicle: vehicles[index],
                              isSelected: vehicles[index].id == selectedVehicleCardId,
                              onCardTapped: () {
                                setState(() {
                                  selectedVehicleCardId = vehicles[index].id;
                                });
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 5);
                          },
                        );
                      } else {
                        return const DefaultVacancyCardMessage(message: 'Não há veículos cadastrados.');
                      }
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: DateTimeField(
                        controller: _dateTimeController,
                        format: format,
                        decoration: const InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.calendar_month),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: Color(0xFF583290),
                          )),
                          labelText: "Clique para informar a data da reserva",
                          labelStyle: TextStyle(fontSize: 15),
                          hintStyle: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                          ),
                        ),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2101),
                          ).then((date) {
                            if (date == null) return null;
                            return showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            ).then((time) {
                              if (time == null) return null;
                              return DateTimeField.combine(date, time);
                            });
                          });
                        },
                        onChanged: (date) {
                          setState(() {
                            selectedDate = date ?? DateTime.now();
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          child: Row(
                            children: [
                              Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(Icons.error, color: Colors.white),
                                  )),
                              Flexible(
                                flex: 8,
                                child: Text(
                                  'Caso necessário cancelar a reserva, entre em contato com o estabelecimento.',
                                  style: TextStyle(fontFamily: 'Lato', fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        color: const Color(0xFF583290),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                if (_dateTimeController.text != '' && selectedVacancyCardId != '' && selectedVehicleCardId != '') {
                  DateTime data = DateFormat("dd/MM/yyyy HH:mm").parse(_dateTimeController.text);
                  String dataFormatada = DateFormat("yyyy-MM-dd'T'HH:mm:ss-03:00").format(data);

                  Response resp = await ReservationsRepository().createReservation(selectedVacancyCardId, selectedVehicleCardId, dataFormatada);

                  if (resp.statusCode == 200) {
                    setState(() {
                      selectedVacancyCardId = '';
                      selectedVehicleCardId = '';
                      _dateTimeController.text = '';
                    });
                    showSucessSnackBar('Reserva criada com sucesso!');
                  } else {
                    final data = await json.decode(resp.body.toString());
                    showErrorSnackBar("${data['errors']['message']}.");
                  }
                } else {
                  showErrorSnackBar("Preencha todos os campos.");
                }
              },
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Reservar',
                    style: TextStyle(color: Color(0xFF583290), fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.check_circle, color: Color(0xFF583290), size: 20)
                ],
              ),
            )
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
