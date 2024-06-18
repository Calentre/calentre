///Returns hour, minute and meridiem from an argument e.g '12 AM'
List getHourAndMeridiem(String time) {
  List<String> parts = time.split(' '); // Split the time string
  if (parts.length == 2) {
    String meridiem = parts[1].toUpperCase(); // Get the meridiem part
    if (meridiem == 'AM' || meridiem == 'PM') {
      List<String> timeParts = parts[0].split(':'); // Split hour and minute
      if (timeParts.length == 2) {
        int hour = int.tryParse(timeParts[0]) ?? 0; // Parse hour
        int minute = int.tryParse(timeParts[1]) ?? 0; // Parse minute
        if (hour >= 1 && hour <= 12 && minute >= 0 && minute <= 59) {
          return [
            hour,
            minute,
            meridiem
          ]; // Return formatted hour, minute, and meridiem
        }
      }
    }
  }
  return []; // Return an empty list if the format doesn't match
}
