

import 'package:flutter/foundation.dart';

import '../Provider/DayDataProvider.dart';

void calculateDaysAndWeekdays(int year, int month) {
  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
  final dayData = DayData();

  DateTime currentDay = firstDayOfMonth;
  while (currentDay.isBefore(lastDayOfMonth) || currentDay.isAtSameMomentAs(lastDayOfMonth)) {
    String weekday = getWeekdayName(currentDay.weekday);

    if (weekday == "月") {
     ref.watch(DayData.mondayList).add(currentDay.day.toString());
    }
    else if (weekday == "火") {
      dayData.tuesdayList.add(currentDay.day.toString());
    }
    else if (weekday == "水") {
      dayData.wednesdayList.add(currentDay.day.toString());
    }
    else if (weekday == "木") {
      dayData.thursdayList.add(currentDay.day.toString());
    }
    else if (weekday == "金") {
      dayData.fridayList.add(currentDay.day.toString());
    }
    else if (weekday == "土") {
      dayData.saturdayList.add(currentDay.day.toString());
    }
    else if (weekday == "日") {
      dayData.sundayList.add(currentDay.day.toString());
    }
    else {
      throw Exception("this is not categorized anywhere");
    }

    currentDay = currentDay.add(const Duration(days: 1));
  }
  if (kDebugMode) {
    print("monday${dayData.mondayList}");
    print("tuesday${dayData.tuesdayList}");
    print("wednesday${dayData.wednesdayList}");
    print("thursday${dayData.thursdayList}");
    print("friday${dayData.fridayList}");
    print("saturday${dayData.saturdayList}");
    print("sunday${dayData.sundayList}");
  }

}

String getWeekdayName(int weekday) {
  List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];
  return weekdays[weekday - 1]; // Dartでは曜日は1から始まります
}


