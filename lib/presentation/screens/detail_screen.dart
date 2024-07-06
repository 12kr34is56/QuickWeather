import 'package:flutter/material.dart';
import 'package:weather_app_project/models/weather_forecast_model.dart';
import 'package:weather_app_project/presentation/widgets/widgets.dart';
import 'package:weather_app_project/services/services.dart';

class DetailScreen extends StatefulWidget {
  final String? location;
  const DetailScreen({super.key, required this.location});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: WeatherApi.getForecast(widget.location!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const DetailLoader();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else {
                final WeatherData? weatherData = snapshot.data;
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailLoader()));
                            },
                            child: const Text(
                              "Today's Weather",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                WeatherApi.getForecast(widget.location!);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                border:
                                    Border.all(color: Colors.lightBlueAccent),
                              ),
                              child: const Icon(
                                Icons.refresh,
                                color: Colors.lightBlueAccent,
                              ),
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
                        color: const Color(0xff181818),
                        borderRadius: BorderRadius.circular(15),
                        backgroundBlendMode: BlendMode.softLight,
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getCityAndCountry(
                                      weatherData!.location.name!),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return HourlyUpdate(
                                time: formatTime(weatherData
                                        .timelines['hourly']?[index].time ??
                                    "NA"),
                                weatherIcon: weatherIconWeek(weatherData
                                        .timelines['hourly']?[index]
                                        .values['weatherCode'] ??
                                    1000),
                                weather: weatherText(weatherData
                                        .timelines['hourly']?[index]
                                        .values['weatherCode'] ??
                                    1000),
                                temp: weatherData.timelines['hourly']?[index]
                                        .values["temperature"]
                                        .toString() ??
                                    "NA",
                              );
                            },
                            itemCount: weatherData.timelines['hourly']!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FeatureTemp(
                      firstTitle: "Wind Speed",
                      firstSubTitle: "36 kilometers per hour (km/h)",
                      firstMin: weatherData
                          .timelines['daily']![0].values['windSpeedMin'],
                      firstMax: weatherData
                          .timelines['daily']![0].values['windSpeedMax'],
                      firstAvg: weatherData
                          .timelines['daily']![0].values['windSpeedAvg'],
                      secondTitle: "Humidity",
                      secondSubTitle: "an average humidity of 60%",
                      secondMin: weatherData
                          .timelines['daily']![0].values['humidityMin'],
                      secondMax: weatherData
                          .timelines['daily']![0].values['humidityMax'],
                      secondAvg: weatherData
                          .timelines['daily']![0].values['humidityAvg'],
                      thirdTitle: "Pressure",
                      thirdSubTitle: "avg wind pressure around 1013.25(mb)",
                      thirdMin: weatherData.timelines['daily']![0]
                          .values['pressureSurfaceLevelMin'],
                      thirdMax: weatherData.timelines['daily']![0]
                          .values['pressureSurfaceLevelMax'],
                      thirdAvg: weatherData.timelines['daily']![0]
                          .values['pressureSurfaceLevelAvg'],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FeatureTemp(
                      firstTitle: "UV Index",
                      firstSubTitle: "average UV index typically ranges between 2 to 7 in most regions",
                      firstMin: weatherData
                          .timelines['daily']![0].values['uvIndexMin'],
                      firstMax: weatherData
                          .timelines['daily']![0].values['uvIndexMax'],
                      firstAvg: weatherData
                          .timelines['daily']![0].values['uvIndexAvg'],
                      secondTitle: "Visibility",
                      secondSubTitle: "Average visibility is 10 kilometers (6 miles).",
                      secondMin: weatherData
                          .timelines['daily']![0].values['visibilityMin'],
                      secondMax: weatherData
                          .timelines['daily']![0].values['visibilityMax'],
                      secondAvg: weatherData
                          .timelines['daily']![0].values['visibilityAvg'],
                      thirdTitle: "Dew Point",
                      thirdSubTitle: "The average dew point is 25.44°C.",
                      thirdMin: weatherData
                          .timelines['daily']![0].values['dewPointMin'],
                      thirdMax: weatherData
                          .timelines['daily']![0].values['dewPointMax'],
                      thirdAvg: weatherData
                          .timelines['daily']![0].values['dewPointAvg'],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FeatureTemp(
                      firstTitle: "Cloud Cover",
                      firstSubTitle: "The cloud cover average is 98.12%.",
                      firstMin: weatherData
                          .timelines['daily']![0].values['cloudCoverMin'],
                      firstMax: weatherData
                          .timelines['daily']![0].values['cloudCoverMax'],
                      firstAvg: weatherData
                          .timelines['daily']![0].values['cloudCoverAvg'],
                      secondTitle: "Precipitation",
                      secondSubTitle: "The precipitation probability average is 28.3%.",
                      secondMin: weatherData.timelines['daily']![0]
                          .values['precipitationProbabilityMin'],
                      secondMax: weatherData.timelines['daily']![0]
                          .values['precipitationProbabilityMax'],
                      secondAvg: weatherData.timelines['daily']![0]
                          .values['precipitationProbabilityAvg'],
                      thirdTitle: "Evapotranspiration",
                      thirdSubTitle: "Water moves from land and plants to air.",
                      thirdMin: weatherData.timelines['daily']![0]
                          .values['evapotranspirationMin'],
                      thirdMax: weatherData.timelines['daily']![0]
                          .values['evapotranspirationMax'],
                      thirdAvg: weatherData.timelines['daily']![0]
                          .values['evapotranspirationAvg'],
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
