import 'package:bmicalculator/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HintPage extends StatefulWidget {
  @override
  _HintPageState createState() => _HintPageState();
}

class _HintPageState extends State<HintPage> {
  final PageController _controller = PageController(initialPage: 0);
  int selectedPage = 0;
  bool _isPageChanged = false;

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
            height: 200,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                  if (index == 0) _isPageChanged = false;
                  if (index == 1) _isPageChanged = true;
                });
              },
              children: [
                firstPage(),
                secondPage(),
              ],
            ),
          ),
          kIsWeb
              ? InkWell(
                  onTap: () {
                    _isPageChanged
                        ? _controller.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInCubic)
                        : _controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInCubic);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: activeColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        _isPageChanged
                            ? Icons.arrow_back_ios_new
                            : Icons.arrow_forward_ios,
                        color: primaryColor,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: 0,
                  height: 50,
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
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              "How to Use",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: activeColor),
            ),
            SizedBox(height: 24),
            Text(
              'Enter your height and weight\n\nFor example height: 1.65 and weight: 50, then click \'Calculate BMI\' Button and see your result in the Dialog',
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
