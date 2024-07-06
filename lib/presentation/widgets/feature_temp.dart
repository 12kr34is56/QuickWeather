import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'feature_data.dart';
class FeatureTemp extends StatelessWidget {
  final String firstTitle;
  final String firstSubTitle;
  final String secondTitle;
  final String secondSubTitle;
  final String thirdTitle;
  final String thirdSubTitle;
  final dynamic firstMin;
  final dynamic firstMax;
  final dynamic firstAvg;
  final dynamic secondMin;
  final dynamic secondMax;
  final dynamic secondAvg;
  final dynamic thirdMin;
  final dynamic thirdMax;
  final dynamic thirdAvg;

  FeatureTemp({
    super.key,
    required this.firstTitle,required this.firstSubTitle,  required this.secondTitle, required this.secondSubTitle, required this.thirdTitle, required this.thirdSubTitle, required this.firstMin, required this.firstMax, required this.firstAvg, required this.secondMin, required this.secondMax, required this.secondAvg, required this.thirdMin, required this.thirdMax, required this.thirdAvg
  });

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.16,
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
        color: const Color(0xff181818),
        borderRadius: BorderRadius.circular(15),
        backgroundBlendMode: BlendMode.softLight,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12, left: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PageView(
                          controller: _pageController,
                          children: [
                            FeatureData(title: firstTitle, subTitle: firstSubTitle, min: firstMin, max: firstMax, avg: firstAvg),
                            FeatureData(title: secondTitle, subTitle: secondSubTitle, min: secondMin, max: secondMax, avg: secondMin),
                            FeatureData(title: thirdTitle, subTitle: thirdSubTitle, min: thirdMin, max: thirdMax, avg: thirdAvg),

                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          child: SmoothPageIndicator(
                            controller: _pageController, // PageController
                            count: 3,
                            effect: WormEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: Colors.grey,
                              dotColor: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
