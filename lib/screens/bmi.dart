import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();

  var result = "";
  var bgcolor = Colors.greenAccent.shade400;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "BMI Calculator",
          ),
        ),
        body: Container(
          color: bgcolor,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI Calculator",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: TextField(
                    controller: wtcontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your Weight",
                        prefixIcon: Icon(Icons.line_weight)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: TextField(
                    controller: ftcontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your Height (Feet)",
                        prefixIcon: Icon(Icons.height)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: TextField(
                    controller: incontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your Height(Inch)",
                        prefixIcon: Icon(Icons.height)),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          var wt = wtcontroller.text.toString();
                          var ft = ftcontroller.text.toString();
                          var inch = incontroller.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            var iWt = int.parse(wt);
                            var iFt = int.parse(ft);
                            var Inch = int.parse(inch);

                            var tInch = (iFt * 12) + Inch;
                            var tcm = tInch * 2.54 + Inch;
                            var tm = tcm / 100;

                            var BMI = (tm * tm);
                            var msg = "";

                            if (BMI > 25) {
                              msg = "You're OverWeight!!";
                              bgcolor = Colors.purpleAccent.shade400;
                            } else if (BMI < 18) {
                              msg = "You're UnderWeight!!";
                              bgcolor = Colors.lightGreen.shade300;
                            } else {
                              msg = "You're Healthy";
                              bgcolor = Colors.teal.shade400;
                            }

                            setState(() {
                              result =
                                  "$msg \n BMI is : ${BMI.toStringAsFixed(2)}";
                            });
                          } else {
                            setState(() {
                              result = "Please enter the required blanks!!";
                            });
                          }
                        },
                        child: const Text("Calculate"))),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      result,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
