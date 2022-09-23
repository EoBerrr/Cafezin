import 'package:flutter/material.dart';

const List<String> userPerfil = <String>[
  'Selecione seu perfil',
  'Adulto saudável com cerca de 70 kg',
  'Crianças (a partir de 2 anos) e adolescentes',
  'Gestantes e lactantes',
  'Sensíveis à cafeína',
];

void main() {
  runApp(const MaterialApp(
      home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super (key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _dropdownValue = userPerfil.first;
  TextEditingController weightController = TextEditingController () ;
  TextEditingController heightController = TextEditingController () ;
  String _infoText = "Informe seus dados";
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _resetFields(){
    setState((){
      _formkey = GlobalKey<FormState>();
      weightController .text = "";
      heightController .text = "";
      _infoText = "Infome seus dados";
    });
  }

  void _calculate(){
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caffeine Controller"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.refresh),
              onPressed: _resetFields),
        ],
      ),
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.coffee_maker, size: 60, color: Colors.brown),
              //colocar texto
              Padding(padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.black,
                    ),
                    child: DropdownButton<String>(
                        isExpanded: true,
                        value: _dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        style: const TextStyle(color: Colors.green,
                            fontSize: 18),
                        underline: Container(
                          height: 2,
                          color: Colors.green,
                        ),
                        items: userPerfil.map<DropdownMenuItem<String>>((
                            String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _dropdownValue = value!;
                          });
                        }
                    ),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                      child: Container(
                        height: 50, width: 154,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white54,
                            elevation: 20,
                            shadowColor: Colors.indigo,
                          ),
                          child: const Text("Add cup of coffee"),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _calculate();
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                      child: Container(
                        height: 50, width: 153,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white54,
                            elevation: 20,
                            shadowColor: Colors.indigo,
                          ),
                          child: const Text('Sub cup of coffee'),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _calculate();
                            }
                          },
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white54,
                            elevation: 20,
                            shadowColor: Colors.indigo,
                          ),
                          child: const Text("Add cup of express"),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _calculate();
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white54,
                            elevation: 20,
                            shadowColor: Colors.indigo,
                          ),
                          child: const Text('Sub cup of express'),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _calculate();
                            }
                          },
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                      child: Container(
                        height: 50,
                        width: 250,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            label: Text("ADD caffeine (mg)"),
                            labelStyle: TextStyle(color: Colors.green),
                            fillColor: Colors.white12,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 10),
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white54,
                            elevation: 20,
                            shadowColor: Colors.indigo,
                          ),
                          child: const Text('ADD'),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _calculate();
                            }
                          },
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        height: 50, width: 345,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            elevation: 20,
                            shadowColor: Colors.indigo,
                          ),
                          child: const Text('Calculate'),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _calculate();
                            }
                          },
                        ),
                      ),
                    ),
                  ]
              ),

              Padding(padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 100,
                  child: Text(
                    _infoText,
                    style: const TextStyle(
                        color: Colors.lightGreenAccent, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  }
