

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Provider/DayDataProvider.dart';

void calculateDaysAndWeekdays(int year, int month,WidgetRef ref) {
  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

  DateTime currentDay = firstDayOfMonth;
  debugPrint('currentDay$currentDay');



  //statenotifierの勉強
  //月の始まり(1日)が何曜日かを取得
  debugPrint('曜日${getWeekdayName(currentDay.weekday)}');
  while (currentDay.isBefore(lastDayOfMonth) || currentDay.isAtSameMomentAs(lastDayOfMonth)) {
    String weekday = getWeekdayName(currentDay.weekday);

    if (weekday == "月") {
     ref.read(DayData.mondayList).add(currentDay.day.toString());
    }
    else if (weekday == "火") {
      ref.read(DayData.tuesdayList).add(currentDay.day.toString());
    }
    else if (weekday == "水") {
      ref.read(DayData.wednesdayList).add(currentDay.day.toString());
    }
    else if (weekday == "木") {
      ref.read(DayData.thursdayList).add(currentDay.day.toString());
    }
    else if (weekday == "金") {
      ref.read(DayData.fridayList).add(currentDay.day.toString());
    }
    else if (weekday == "土") {
      ref.read(DayData.saturdayList).add(currentDay.day.toString());
    }
    else if (weekday == "日") {
      ref.read(DayData.sundayList).add(currentDay.day.toString());
    }
    else {
      throw Exception("this is not categorized anywhere");
    }

    currentDay = currentDay.add(const Duration(days: 1));
  }
    debugPrint("monday${ref.read(DayData.mondayList)}");
    debugPrint("tuesday${ref.read(DayData.tuesdayList)}");
    debugPrint("wednesday${ref.read(DayData.wednesdayList)}");
    debugPrint("thursday${ref.read(DayData.thursdayList)}");
    debugPrint("friday${ref.read(DayData.fridayList)}");
    debugPrint("saturday${ref.read(DayData.saturdayList)}");
    debugPrint("sunday${ref.read(DayData.sundayList)}");


}

String getWeekdayName(int weekday) {
  List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];
  return weekdays[weekday - 1]; // Dartでは曜日は1から始まります
}


