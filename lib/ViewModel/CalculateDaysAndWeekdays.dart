

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Provider/DayDataProvider.dart';

void calculateDaysAndWeekdays(int year, int month,WidgetRef ref) {
  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

  DateTime currentDay = firstDayOfMonth;
  while (currentDay.isBefore(lastDayOfMonth) || currentDay.isAtSameMomentAs(lastDayOfMonth)) {
    String weekday = getWeekdayName(currentDay.weekday);

    if (weekday == "月") {
     ref.watch(DayData.mondayList).add(currentDay.day.toString());
    }
    else if (weekday == "火") {
      ref.watch(DayData.tuesdayList).add(currentDay.day.toString());
    }
    else if (weekday == "水") {
      ref.watch(DayData.wednesdayList).add(currentDay.day.toString());
    }
    else if (weekday == "木") {
      ref.watch(DayData.thursdayList).add(currentDay.day.toString());
    }
    else if (weekday == "金") {
      ref.watch(DayData.fridayList).add(currentDay.day.toString());
    }
    else if (weekday == "土") {
      ref.watch(DayData.saturdayList).add(currentDay.day.toString());
    }
    else if (weekday == "日") {
      ref.watch(DayData.sundayList).add(currentDay.day.toString());
    }
    else {
      throw Exception("this is not categorized anywhere");
    }

    currentDay = currentDay.add(const Duration(days: 1));
  }
  if (kDebugMode) {
    debugPrint("monday${DayData.mondayList}");
    debugPrint("tuesday${DayData.tuesdayList}");
    debugPrint("wednesday${DayData.wednesdayList}");
    debugPrint("thursday${DayData.thursdayList}");
    debugPrint("friday${DayData.fridayList}");
    debugPrint("saturday${DayData.saturdayList}");
    debugPrint("sunday${DayData.sundayList}");
  }

}

String getWeekdayName(int weekday) {
  List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];
  return weekdays[weekday - 1]; // Dartでは曜日は1から始まります
}


