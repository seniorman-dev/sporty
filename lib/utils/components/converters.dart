import 'dart:core';
import 'package:intl/intl.dart';




String formatDate(DateTime date) {
  // Create a DateFormat instance with the desired format
  //final DateFormat formatter = DateFormat('d MMMM, yyyy');
  final DateFormat formatter = DateFormat.yMMMd();
  // Use the formatter to format the DateTime object
  return formatter.format(date);
}


//for the web
DateTime parseDateTime({required String dateString, required String timeString}) {
  // Parse date string
  DateTime date = DateFormat("yyyy-MM-dd").parse(dateString);

  // Parse time string
  DateFormat timeFormat = DateFormat("h:mm a");
  DateTime time = timeFormat.parse(timeString);

  // Combine date and time
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

DateTime convertNodeJSServerTimestampToDateObject({
  required String serverTimestampStr
  }) {
  try {
    DateTime dateTime = DateTime.parse(serverTimestampStr);
    return dateTime;
  } 
  catch (e) {
    throw Exception("error: $e");
  }
}




String calculateDurationBetweenDates(String startDateStr, String endDateStr) {
  // Define the date format
  DateFormat dateFormat = DateFormat.yMMMd();

  // Parse the date strings into DateTime objects
  DateTime startDate = dateFormat.parse(startDateStr);
  DateTime endDate = dateFormat.parse(endDateStr);

  // Calculate the difference in days
  Duration difference = endDate.difference(startDate);
  int days = difference.inDays;

  // Calculate weeks and months
  int weeks = days ~/ 7;
  int months = (days / 30).floor(); // approximate months by dividing days by 30

  // Determine the result string
  if (days < 7) {
    return '$days day${days == 1 ? '' : 's'}';
  } else if (weeks < 4) {
    return '$weeks week${weeks == 1 ? '' : 's'}';
  } else {
    return '$months month${months == 1 ? '' : 's'}';
  }
}



String extractTimeIn12HourFormat(String timestamp) {
  // Parse the timestamp string into a DateTime object
  DateTime dateTime = DateTime.parse(timestamp);

  // Format the DateTime object to a 12-hour format string
  String formattedTime = DateFormat('hh:mm a').format(dateTime);

  return formattedTime;
}



//converts a date string of time "2022:03:21:TZ" to '13 January, 2023'
String transformDateString(String dateString) {
  // Parse the original date string to a DateTime object
  DateTime dateTime = DateTime.parse(dateString);
  
  // Define the desired output format
  DateFormat outputFormat = DateFormat.yMMMd(); //DateFormat('dd MMM, yyyy');
  
  // Format the DateTime object to the desired output format
  String formattedDate = outputFormat.format(dateTime);
  
  return formattedDate;
}



// Function 1: Convert string to DateTime
DateTime convertStringToDateTime(String dateString) {
  try {

     //DateFormat dateFormat = DateFormat('d MMMM, yyyy');
     DateFormat outputFormat = DateFormat.yMMMd();
     DateTime dateTime = outputFormat.parse(dateString);

     print(dateTime); // Output: 2023-01-13 00:00:00.000
    
     return dateTime;
  } catch (e) {
    // Handle parsing errors, e.g., invalid format
    print('Error converting string to DateTime: $e');
    throw Exception("$e");
  }
}

// Function 2: Display today's date as a DateTime object
DateTime getTodayDateTime() {
  return DateTime.now();
}

// Function 3: Check how close a DateTime is to today's date
String checkDateProximity(DateTime otherDate) {
  DateTime today = getTodayDateTime();
  Duration difference = today.difference(otherDate).abs();
  
  if (difference.inDays == 0) {
    return 'The date is today!';
  } else {
    String proximity = (today.isBefore(otherDate)) ? 'future' : 'past';
    String unit = (difference.inDays == 1) ? 'day' : 'days';
    
    return 'The date is ${difference.inDays} $unit in the $proximity.';
  }
}

// Function 4: Check how far a DateTime is from today's date
String checkDateDistance(DateTime otherDate) {
  DateTime today = getTodayDateTime();
  Duration difference = today.difference(otherDate).abs();
  
  if (difference.inDays == 0) {
    return 'The date is today!';
  } else {
    String proximity = (today.isBefore(otherDate)) ? 'future' : 'past';
    String unit = (difference.inDays == 1) ? 'day' : 'days';
    
    return 'The date is ${difference.inDays} $unit ${proximity == 'future' ? 'ahead of' : 'ago from'} today.';
  }
}

// Function to check if a date is in the past
bool isDateInPast(DateTime date) {
  DateTime today = getTodayDateTime();
  return date.isBefore(today);
}

// Function to check if a date is in the future
bool isDateInFuture(DateTime date) {
  DateTime today = getTodayDateTime();
  return date.isAfter(today);
}

String convertUTCTimestampToDate(int timestamp) {
  // Convert timestamp to DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);

  // Define month names
  List<String> months = [
    "January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"
  ];

  // Extract components
  int year = dateTime.year;
  String month = months[dateTime.month - 1]; // Month index starts from 1
  int day = dateTime.day;

  // Construct date string
  String dateString = "$month $day, $year";

  return dateString;
}

String convertServerTimeToDate(int timestamp) {
  // Convert the timestamp to a DateTime object
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Format the DateTime object to the desired format
  //String formattedDate = DateFormat.yMMMd().format(dateTime);
  // Format the DateTime to a readable string
  String formattedDate = DateFormat.yMMMd().format(dateTime); //DateFormat('dd MMM, yyyy').format(dateTime);

  return formattedDate;
}

//use well
String convertDateStringToDate(String dateString) {
  // Parse the date string
  List<String> dateComponents = dateString.split('-');
  int year = int.parse(dateComponents[0]);
  int month = int.parse(dateComponents[1]);
  int day = int.parse(dateComponents[2]);

  // Convert to DateTime
  DateTime dateTime = DateTime(year, month, day);

  // Define month names
  List<String> months = [
    "January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"
  ];

  // Extract components
  String monthName = months[dateTime.month - 1]; // Month index starts from 1

  // Construct date string
  String formattedDate = "$monthName ${dateTime.day}, ${dateTime.year}";

  return formattedDate;
}

String convertStringServerTimeToDate(String timestamp){

  // Convert the timestamp to a DateTime object
  DateTime dateTime = DateTime.parse(timestamp);

  // Use the toString method
  String formattedDate = dateTime.toString();
  //String finalResult = formattedDate.substring(0, 10);

  print(formattedDate); // Output: 2023-01-27 20:48:47.960
  return formattedDate;
}

/*String convertServerTimeToDate(int timestamp) {
  // Convert the timestamp to a DateTime object
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Use the toString method
  String formattedDate = dateTime.toString();
  String finalResult = formattedDate.substring(0, 10);

  print(finalResult); // Output: 2023-01-27 20:48:47.960
  return finalResult;
}*/


String convertServerTimeToTime(int timestamp) {
  // Convert the timestamp to a DateTime object
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Use the intl package to format the time
  String formattedTime = DateFormat('HH:mm a').format(dateTime);

  print(formattedTime); // Output: 20:48:47
  return formattedTime;
}
