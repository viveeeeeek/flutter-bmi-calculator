import 'package:bmicalculator/theme/theme.dart';
import 'package:flutter/material.dart';

class HintPage extends StatefulWidget {
  @override
  _HintPageState createState() => _HintPageState();
}

class _HintPageState extends State<HintPage> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 250,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                firstPage(),
                secondPage(),
              ],
            ),
          ),
          indicatorPage()
        ],
      ),
    );
  }

  Widget indicatorPage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DotWidget(
          color: selectedPage == 0 ? Colors.blue : Colors.grey,
        ),
        SizedBox(
          width: 10,
        ),
        DotWidget(color: selectedPage == 1 ? Colors.blue : Colors.grey),
      ],
    );
  }

  Widget secondPage() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            "How to Use",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: activeColor),
          ),
          SizedBox(height: 24),
          Text(
            'Enter your height and weight\n\nFor example height: 1.65 and weight: 50, then click \'Calculate BMI\' Button and see your result in the Dialog',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget firstPage() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              "BMI",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: activeColor),
            ),
            SizedBox(height: 16),
            Text(
              'BMI is a measurement of a persons leanness or corpulence based on their height and weight, and is intended to quantify tissue mass. It is widely used as a general indicator of whether a person has a healthy body weight for their height. Specifically, the value obtained from the calculation of BMI is used to categorize whether a person is underweight, normal weight, overweight, or obese depending on what range the value falls between.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
