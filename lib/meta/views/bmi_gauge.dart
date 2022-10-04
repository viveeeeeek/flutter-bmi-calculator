import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ShowGauge extends StatelessWidget {
  final String initialvalue;
  final String prompt;

  ShowGauge(this.initialvalue, this.prompt);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          minimum: 12,
          maximum: 41,
          radiusFactor: 0.8,
          interval: 4,
          axisLineStyle: AxisLineStyle(thickness: 50),
          axisLabelStyle: GaugeTextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
          ranges: <GaugeRange>[
            GaugeRange(
              label: 'UnderWeight',
              labelStyle: GaugeTextStyle(color: Colors.black,fontWeight: FontWeight.bold),

                startValue: 12,
                endValue: 18.5,
                color: Colors.blue,
                startWidth: 50,
                endWidth: 50),
            GaugeRange(
              label: 'Normal',
              labelStyle: GaugeTextStyle(color: Colors.black,fontWeight: FontWeight.bold),


                startValue: 18.5,
                endValue: 25,
                color: Colors.green,
                startWidth: 50,
                endWidth: 50),
            GaugeRange(
              label: 'OverWeight',
              labelStyle: GaugeTextStyle(color: Colors.black,fontWeight: FontWeight.bold),


                startValue: 25,
                endValue: 30,
                color: Colors.yellow,
                startWidth: 50,
                endWidth: 50),
            GaugeRange(
              label: 'Obese',
              labelStyle: GaugeTextStyle(color: Colors.black,fontWeight: FontWeight.bold),

                startValue: 30,
                endValue: 35,
                color: Colors.orange,
                startWidth: 50,
                endWidth: 50),
            GaugeRange(
              label: 'Morbidly Obese',
              labelStyle: GaugeTextStyle(color: Colors.black,fontWeight: FontWeight.bold),

                startValue: 35,
                endValue: 41,
                color: Colors.red,
                startWidth: 50,
                endWidth: 50),
          ],
          pointers: <GaugePointer>[
            
            NeedlePointer(

              knobStyle: KnobStyle(color: Color(0xFFE23E57)),
              needleColor: Color(0xFFE23E57),
              value: double.parse(initialvalue),
              enableAnimation: true,
              animationType: AnimationType.bounceOut,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                angle: 90,
                positionFactor: 1.1,
                widget: Container(
                  child: Text(
                    prompt,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE23E57)),
                    textAlign: TextAlign.center,
                  ),
                ))
          ])
    ]);
  }
}
