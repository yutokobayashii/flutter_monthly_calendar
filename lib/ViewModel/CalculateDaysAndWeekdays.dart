

void calculateDaysAndWeekdays(int year, int month) {
  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

  DateTime currentDay = firstDayOfMonth;
  while (currentDay.isBefore(lastDayOfMonth) || currentDay.isAtSameMomentAs(lastDayOfMonth)) {
    String weekday = getWeekdayName(currentDay.weekday);
    print("${currentDay.day}$weekday");
    currentDay = currentDay.add(const Duration(days: 1));
  }
}

String getWeekdayName(int weekday) {
  List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];
  return weekdays[weekday - 1]; // Dartでは曜日は1から始まります
}


