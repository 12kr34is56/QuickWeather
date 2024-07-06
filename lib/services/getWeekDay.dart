import 'package:intl/intl.dart';

String getDayOfWeek(String? dateString) {
  try {
    // Parse the input date string
    DateTime date = DateTime.parse(dateString!);

    // Format the date to get the day of the week
    String dayOfWeek = DateFormat.EEEE().format(date); // EEEE for full weekday name

    return dayOfWeek; // Returns the day of the week (e.g., "Tuesday")
  } catch (e) {
    print("Error parsing date: $e");
    return ""; // Return empty string or handle error as needed
  }
}


String formatDate(String timestamp) {
  if (timestamp.isEmpty) return 'N/A';
  DateTime dateTime = DateTime.parse(timestamp);
  String formattedDate = DateFormat('MMMM dd, yyyy').format(dateTime.toLocal());
  return formattedDate;
}
String formatTime(String timestamp) {
  if (timestamp.isEmpty) return 'N/A';
  DateTime dateTime = DateTime.parse(timestamp);

  String formattedTime = DateFormat('hh:mm a').format(dateTime.toLocal());
  return formattedTime;
}

String getGreeting(String time) {
  if (time.isEmpty) return 'Hello';
  DateTime dateTime = DateTime.parse(time);
  int hour = dateTime.hour;

  if (hour < 12) {
    return 'Good Morning';
  }  else {
    return 'Good Evening';
  }
}
String getCityAndCountry(String location) {
  List<String> parts = location.split(', '); // Split the string by ', '
  if (parts.length >= 2) {
    String city = parts[0]; // First part is the city
    String country = parts[parts.length - 1]; // Last part is the country
    return '$city, $country';
  }
  return location; // If the format is not as expected, return the original string
}