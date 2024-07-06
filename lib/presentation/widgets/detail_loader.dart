import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class DetailLoader extends StatelessWidget {
  const DetailLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Text(
                    "Today's Weather",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      border: Border.all(color: Colors.lightBlueAccent),
                    ),
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                backgroundBlendMode: BlendMode.softLight,
                border: Border.all(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.sizeOf(context).width * 0.65),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        color: Colors.grey[500],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 16.0),
                      child: SkeletonAnimation(
                        shimmerDuration: 2000,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.04,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 16.0),
                      child: SkeletonAnimation(
                        shimmerDuration: 2000,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.04,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 16.0),
                      child: SkeletonAnimation(
                        shimmerDuration: 2000,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.04,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 16.0),
                      child: SkeletonAnimation(
                        shimmerDuration: 2000,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.04,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SkeletonAnimation(
              shimmerDuration: 2000,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.16,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  backgroundBlendMode: BlendMode.softLight,
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SkeletonAnimation(
              shimmerDuration: 2000,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.16,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  backgroundBlendMode: BlendMode.softLight,
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SkeletonAnimation(
              shimmerDuration: 2000,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.16,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  backgroundBlendMode: BlendMode.softLight,
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
              ),
            ),
          ],
    );
  }
}
