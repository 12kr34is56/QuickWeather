import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class WidgetCurrentWeatherLoader extends StatelessWidget {
  const WidgetCurrentWeatherLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 165,
          width: MediaQuery.sizeOf(context).width * 0.9,
          decoration:  const BoxDecoration(
            backgroundBlendMode: BlendMode.softLight,
            color: Color(0xff202020),
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonAnimation(
                      shimmerColor: Colors.white54,
                      borderRadius: BorderRadius.circular(10.0),
                      shimmerDuration: 1000,
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SkeletonAnimation(
                      shimmerColor: Colors.white54,
                      borderRadius: BorderRadius.circular(10.0),
                      shimmerDuration: 1000,
                      child: Container(
                        height: 20,
                        width: 100,
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SkeletonAnimation(
                      shimmerColor: Colors.white54,
                      borderRadius: BorderRadius.circular(10.0),
                      shimmerDuration: 1000,
                      child: Container(
                        height: 15,
                        width: 100,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SkeletonAnimation(
                  shimmerColor: Colors.white54,
                  borderRadius: BorderRadius.circular(10.0),
                  shimmerDuration: 1000,
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
