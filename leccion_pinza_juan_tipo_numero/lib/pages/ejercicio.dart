import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../logica/logica_ejercicio.dart';

class NumberCheckScreen extends StatefulWidget {
  @override
  _NumberCheckScreenState createState() => _NumberCheckScreenState();
}

class _NumberCheckScreenState extends State<NumberCheckScreen> {
  final TextEditingController _controller = TextEditingController();
  String _message = "";

  void _checkNumber() {
    setState(() {
      final input = _controller.text;
      if (input.isEmpty) {
        _message = "⚠️ Ingrese un número!!";
        return;
      }
      final number = int.tryParse(input);
      if (number == null) {
        _message = "❌ Número no válido.";
        return;
      }
      _message = NumberChecker.getNumberType(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_box_outlined, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text('Prueba Parcial | Juan Pablo Pinza',
                style: TextStyle(fontFamily: 'Roboto')),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.amber[400],
                child: Icon(
                  FontAwesomeIcons.question,
                  size: 50,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Es Positivo, Negativo o Nulo?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  labelText: 'Ingrese un número:',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _checkNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[400],
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                icon: Icon(Icons.check, color: Colors.deepPurple),
                label: Text(
                  'Comprobar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _message.contains('positivo')
                          ? Icons.add_circle_outline
                          : _message.contains('negativo')
                              ? Icons.remove_circle_outline
                              : Icons.info_outline,
                      color: Colors.deepPurple,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _message,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
