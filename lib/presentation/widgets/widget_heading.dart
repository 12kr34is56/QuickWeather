import 'package:flutter/material.dart';
import 'package:weather_app_project/presentation/screens/screens.dart';
import 'package:weather_app_project/services/services.dart';


class WidgetHeading extends StatelessWidget {
  final String locationName;
  final DateTime? time;
  const WidgetHeading({
    super.key, required this.locationName, required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: Container(

        decoration:  BoxDecoration(
          color: const Color(0xff060606),
          borderRadius: BorderRadius.circular(15),
          backgroundBlendMode: BlendMode.overlay,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${getGreeting(time.toString())},Buddy!",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Text(
                    formatTime(time.toString()),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
                },
                child: Container(
                  height: 48,
                  width: 100,
                  decoration: BoxDecoration(
                    // color: Color(0xff202020),
                    // backgroundBlendMode: BlendMode.softLight,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Search",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
