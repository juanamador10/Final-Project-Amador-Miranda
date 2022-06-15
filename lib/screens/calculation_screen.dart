import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  final double textInfo;

  const CalculationScreen(this.textInfo, {Key? key}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CalculationScreen> {
  final controllerAmount = TextEditingController();
  final controllerPercent = TextEditingController();
  String tip = "0";

  @override
  Widget build(BuildContext context) {
    const fontStyle1 = TextStyle(fontSize: 20);
    const fontStyle2 = TextStyle(fontSize: 30);
    controllerPercent.text = (widget.textInfo).toString();

    double tipNum = 0;
    double percentAmount = widget.textInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controllerAmount,
                  decoration: const InputDecoration(
                    //contentPadding: EdgeInsets.all(20.0),
                    // icon: Icon(Icons.tag),
                    //hintText: 'What do people call you?',
                    labelText: 'Amount',
                    labelStyle: TextStyle(color: Colors.purple),
                    contentPadding: EdgeInsets.all(20.0),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                ),
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
                ),
                const Text("Tip to pay"),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () {
                      tipNum = (double.parse(controllerAmount.text)) *
                          percentAmount /
                          100;
                      tip = tipNum.toString();
                      setState(() {});
                    },
                    child: const Text("Calculate")),
                const Text(
                  "The tip is:",
                  style: fontStyle1,
                ),
                Text(
                  "\$$tip",
                  style: fontStyle2,
                ),
              ])),
    );
  }
}
