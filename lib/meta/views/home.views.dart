import 'dart:io';

import 'package:bmicalculator/core/notifiers/bmi_calculate.notifiers.dart';
import 'package:bmicalculator/meta/views/hint_page.dart';
import 'package:bmicalculator/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './bmi_gauge.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? value1;
  String? value2;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    heightController = TextEditingController();
    weightController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BmiNotifier bmiNotifier =
        Provider.of<BmiNotifier>(context, listen: false);

    return WillPopScope(
      onWillPop: () => exit(0),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 10,
            toolbarHeight: 70,
            centerTitle: true,
            title: Text(
              "BMI Calculator",
            ),
            actions: [
              Padding(
                padding: kIsWeb
                    ? EdgeInsets.symmetric(horizontal: 50)
                    : EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    displayModalHint(context);
                  },
                  icon: Icon(
                    Icons.help,
                    color: activeColor,
                    size: 30,
                  ),
                ),
              ),
            ],
            automaticallyImplyLeading: false,
            backgroundColor: primaryColor,
          ),
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: kIsWeb ? 500 : 350,
                    width: kIsWeb ? 450 : double.infinity,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/girl.png",
                              height: kIsWeb ? 200 : 100,
                              width: kIsWeb ? 200 : 100,
                            ),
                          ),
                          TextField(
                            key: ValueKey("HEIGHT_FIELD"),
                            controller: heightController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Color(0xFFEEEEEE)),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9.]"))
                            ],
                            decoration: InputDecoration(
                              hintText: "Enter Height",
                              hintStyle: TextStyle(color: Color(0xFFEEEEEE)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: fieldColor, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: fieldColor, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Height",
                              labelStyle: TextStyle(
                                  color: Color(0xFFEEEEEE), fontSize: 18),
                              // suffixText: 'Meters',
                            ),
                          ),
                          TextField(
                            key: ValueKey("WEIGHT_FIELD"),
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Color(0xFFEEEEEE)),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9.]"))
                            ],
                            decoration: InputDecoration(
                              hintText: "Enter Weight",
                              hintStyle: TextStyle(color: Color(0xFFEEEEEE)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: fieldColor, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: fieldColor, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Weight",
                              labelStyle: TextStyle(
                                  color: Color(0xFFEEEEEE), fontSize: 18),
                              // suffixText: 'Kg',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DropdownButton(
                                items: const [
                                  DropdownMenuItem(
                                    child: Text("Meters"),
                                    value: "mts",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Centimeters"),
                                    value: "cm",
                                  ),
                                ],
                                value: value1,
                                onChanged: dropdownCallback,
                                iconSize: 40,
                                hint: Text(
                                  "m or cm",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                isDense: true,
                                underline: Container(
                                  height: 3,
                                  color: fieldColor,
                                ),
                                iconEnabledColor: fieldColor,
                                dropdownColor: primaryColor,
                                focusColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                              ),
                              DropdownButton(
                                items: const [
                                  DropdownMenuItem(
                                    child: Text("Kg"),
                                    value: "kg",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grams"),
                                    value: "g",
                                  ),
                                ],
                                value: value2,
                                onChanged: dropdownCallback2,
                                iconSize: 40,
                                hint: Text(
                                  "Kg or gms",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                isDense: true,
                                underline: Container(
                                  height: 3,
                                  color: fieldColor,
                                ),
                                iconEnabledColor: fieldColor,
                                dropdownColor: primaryColor,
                                focusColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: InkWell(
                    onTap: () async {
                      print(value1);
                      print(value2);
                      if (heightController.text.isEmpty ||
                          weightController.text.isEmpty ||
                          heightController.text == '.' ||
                          heightController.text == '..' ||
                          weightController.text == '.' ||
                          weightController.text == '..' ||
                          heightController.text.contains("..") ||
                          weightController.text.contains("..") ||
                          value1 == null ||
                          value2 == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Enter you correct height and weight!",
                                style: TextStyle(fontSize: 16)),
                            backgroundColor: activeColor,
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(
                              label: 'DONE',
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                              textColor: primaryColor,
                            ),
                          ),
                        );
                      } else {
                        var height = double.parse(heightController.text);
                        var weight = double.parse(weightController.text);
                        print(weight);
                        var heightUnits = value1;
                        var weightUnits = value2;
                        var bmiValue = await bmiNotifier.bmiCalculate(
                            height, weight, heightUnits, weightUnits);
                        var healthStatus;
                        setState(() {
                          bmiValue =
                              double.parse((bmiValue).toStringAsFixed(2));
                          if (bmiValue <= 18.5) {
                            healthStatus = 'Oops!\nYou are underweight.';
                          }
                          if (18.5 <= bmiValue && bmiValue <= 24.9) {
                            healthStatus = 'Awesome!\nYou are healthy.';
                          }
                          if (25 <= bmiValue && bmiValue <= 29.9) {
                            healthStatus = 'Eee!\nYou are over weight.';
                          }
                          if (30 <= bmiValue) {
                            healthStatus = 'Seesh!\nYou are obese.';
                          }
                        });

                        displayModalBottomSheet(
                            context, bmiValue.toString(), healthStatus);
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: fieldColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        "Calculate BMI",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        value1 = selectedValue;
      });
    }
  }

  void dropdownCallback2(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        value2 = selectedValue;
      });
    }
  }
}

void displayModalBottomSheet(context, String bmiValue, healthStatus) {
  showModalBottomSheet(
      //isDismissible: true,

      isScrollControlled: true,
      elevation: 6,
      context: context,
      backgroundColor: primaryColor,
      builder: (BuildContext bc) {
        return Wrap(children: [
          Container(
            key: ValueKey("BMI_RESPONSE"),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    Text(
                      "Your BMI is: $bmiValue",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEEEEEE)),
                    ),
                    ShowGauge(bmiValue, healthStatus),

                    // Text(
                    //   healthStatus,
                    //   style: TextStyle(
                    //       fontSize: 25,
                    //       fontWeight: FontWeight.bold,
                    //       color: activeColor),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                )),
          ),
        ]);
      });
}

void displayModalHint(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: primaryColor,
      builder: (BuildContext bc) {
        return Container(height: 300, child: HintPage());
      });
}
