import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FeatureData extends StatelessWidget {
  const FeatureData({
    super.key,
    required this.title,
    required this.subTitle, required this.min, required this.max, required this.avg,
  });

  final String title;
  final String subTitle;
  final dynamic min;
  final dynamic max;
  final dynamic avg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.55,
              child: Text(
                subTitle,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SleekCircularSlider(
            appearance: CircularSliderAppearance(
                customWidths: CustomSliderWidths(
                    progressBarWidth: 10, trackWidth: 10),
                size: 100,
                infoProperties: InfoProperties(
                    mainLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    modifier: (double value) {
                      return avg.toString();
                    })),
            min: min.toDouble(),
            max: max.toDouble(),
            initialValue: avg.toDouble(),
          ),
        )
      ],
    );
  }
}
