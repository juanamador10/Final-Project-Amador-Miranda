import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/calculation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _HomeScreenState();
}

void setDefaultValues(double value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setDouble("percent", value);
}

Future<double?> getDefaultValues() async {
  final prefs = await SharedPreferences.getInstance();
  final double percent = prefs.getDouble("percent") ?? 10;

  return percent;
}

class _HomeScreenState extends State<ConfigurationScreen> {
  final controllerPercent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getDefaultValues()
        .then((value) => {controllerPercent.text = value.toString()});

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuration"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controllerPercent,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    // icon: Icon(Icons.tag),
                    // hintText: 'What do people call you?',
                    labelText: 'Percent',
                    labelStyle: TextStyle(color: Colors.purple),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                //const Text("Tip to pay"),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () {
                      setState(() {
                        double percent = double.parse(controllerPercent.text);
                        setDefaultValues(percent);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CalculationScreen(percent)));

                        //MaterialPageRoute(
                        //    builder: (context) => CalculationScreen(percent));
                      });
                    },
                    child: const Text("Save")),
              ])),
    );
  }
}
