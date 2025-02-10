import 'package:examen_practico/models/driver_model.dart';
import 'package:examen_practico/widgets/passenger_input.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String originCity = '';
  String destinationCity = '';
  DateTime selectedDate = DateTime.now();
  int numberOfPassengers = 1;

  void _selectDate(BuildContext context, bool isTomorrow) {
    DateTime date = isTomorrow ? DateTime.now().add(Duration(days: 1)) : DateTime.now();
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CarDriverGuss"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Ciudad de Origen'),
              onChanged: (value) {
                setState(() {
                  originCity = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Ciudad de Destino'),
              onChanged: (value) {
                setState(() {
                  destinationCity = value;
                });
              },
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context, false),
                  child: Text("Hoy"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _selectDate(context, true),
                  child: Text("Mañana"),
                ),
              ],
            ),
            Text("Fecha seleccionada: ${selectedDate.toLocal()}"),
            PassengerInput(
              onChanged: (value) {
                setState(() {
                  numberOfPassengers = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinalizedScreen(
                      origin: originCity,
                      destination: destinationCity,
                      passengers: numberOfPassengers,
                      driver: Driver(name: "Gustavo Santos", license: "AB1234CD", card:"Toyota dorado"),
                    ),
                  ),
                );
              },
              child: Text("Ordenar nuevo viaje"),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalizedScreen extends StatelessWidget {
  final String origin;
  final String destination;
  final int passengers;
  final Driver driver;

  FinalizedScreen({required this.origin, required this.destination, required this.passengers, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Información Finalizada")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Ciudad de Origen: $origin"),
            Text("Ciudad de Destino: $destination"),
            Text("Número de Pasajeros: $passengers"),
            Text("Nombre del Chofer: ${driver.name}"),
            Text("Licencia del Chofer: ${driver.license}"),
            Text("carro: ${driver.card}"),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("buscar conductor"),
            ),
          ],
        ),
      ),
    );
  }
}
