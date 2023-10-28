import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parkflow_app/models/parking_lot.dart';
import 'package:parkflow_app/view/widgets/reservation_card.dart';

class ReservationView extends StatefulWidget {
  const ReservationView({super.key, required this.parkingLot});
  final ParkingLot parkingLot;

  @override
  State<ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView> {
  final format = DateFormat("dd/MM/yyyy HH:mm");
  DateTime selectedDate = DateTime.now();
  TextEditingController _dateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: const TextStyle(
                      color: Color(0xFF35244E),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return const ReservationCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 5);
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: DateTimeField(
                        controller: _dateTimeController,
                        format: format,
                        decoration: const InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.calendar_month),
                          // prefixIconConstraints:
                          //     BoxConstraints(minHeight: 32, minWidth: 32),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: Color(0xFF583290),
                          )),
                          labelText: "Selecione a data da reserva",
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
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
              onPressed: () {
                DateTime data = DateFormat("dd/MM/yyyy HH:mm")
                    .parse(_dateTimeController.text);
                String dataFormatada =
                    DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(data);
                print(dataFormatada);
              },
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Reservar',
                    style: TextStyle(
                        color: Color(0xFF583290),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
}
