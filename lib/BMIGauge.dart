import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiGauge extends StatefulWidget {
  final double? bmiValue;
  BmiGauge({this.bmiValue = 0});
  @override
  _BmiGaugeState createState() => _BmiGaugeState();
}

class _BmiGaugeState extends State<BmiGauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      animationDuration: 3500,
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            startAngle: 130,
            endAngle: 50,
            minimum: 10,
            maximum: 45,
            interval: 6,
            minorTicksPerInterval: 10,
            showAxisLine: false,
            radiusFactor: 0.93,
            labelOffset: 2,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 10,
                  endValue: 16,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(34, 144, 199, 0.75)),
              GaugeRange(
                  startValue: 16,
                  endValue: 18.5,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(34, 195, 199, 0.75)),
              GaugeRange(
                  startValue: 18.5,
                  endValue: 25.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(123, 199, 34, 0.75)),
              GaugeRange(
                  startValue: 25.0,
                  endValue: 30.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 193, 34, 0.75)),
              GaugeRange(
                  startValue: 30.0,
                  endValue: 35.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 79, 34, 0.65)),
              GaugeRange(
                  startValue: 35.0,
                  endValue: 45.0,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(255, 79, 34, 0.65)),
            ],
            annotations: <GaugeAnnotation>[
              // GaugeAnnotation(
              //     angle: 90,
              //     positionFactor: 0.35,
              //     widget: Container(
              //         child: const Text('BMI',
              //             style: TextStyle(
              //                 color: Color(0xFFF8B195), fontSize: 12)))),
              GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0.8,
                  widget: Container(
                    child: Text(
                      '${widget.bmiValue}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.pink.shade50),
                    ),
                  ))
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: widget.bmiValue!,
                needleLength: 0.6,
                lengthUnit: GaugeSizeUnit.factor,
                needleStartWidth: 1,
                needleEndWidth: 8,
                animationType: AnimationType.elasticOut,
                enableAnimation: true,
                animationDuration: 1200,
                knobStyle: KnobStyle(
                    knobRadius: 0.09,
                    sizeUnit: GaugeSizeUnit.factor,
                    borderColor: const Color(0xFFF8B195),
                    color: Colors.white,
                    borderWidth: 0.05),
                tailStyle: TailStyle(
                    color: const Color(0xFFF8B195),
                    width: 8,
                    lengthUnit: GaugeSizeUnit.factor,
                    length: 0.2),
                needleColor: const Color(0xFFF8B195),
              )
            ],
            axisLabelStyle: GaugeTextStyle(fontSize: 10),
            majorTickStyle: MajorTickStyle(
                length: 0.25, lengthUnit: GaugeSizeUnit.factor, thickness: 1.5),
            minorTickStyle: MinorTickStyle(
                length: 0.13, lengthUnit: GaugeSizeUnit.factor, thickness: 1))
      ],
    );
  }
}
