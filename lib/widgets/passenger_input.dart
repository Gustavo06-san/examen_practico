import 'package:flutter/material.dart';

class PassengerInput extends StatefulWidget {
  final Function(int) onChanged;

  PassengerInput({required this.onChanged});

  @override
  _PassengerInputState createState() => _PassengerInputState();
}

class _PassengerInputState extends State<PassengerInput> {
  double _currentValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Número de Pasajeros"),
        Slider(
          value: _currentValue,
          min: 1,
          max: 6,
          divisions: 5,
          label: _currentValue.toInt().toString(),
          onChanged: (double value) {
            setState(() {
              _currentValue = value;
            });
            widget.onChanged(value.toInt());
          },
        ),
      ],
    );
  }
}
