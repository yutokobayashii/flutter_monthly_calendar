library sample_package;

import 'package:flutter/material.dart';
import 'package:my_package/pages/CalendarGrid.dart';

import 'ViewModel/CalculateDaysAndWeekdays.dart';



class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    calculateDaysAndWeekdays(2023,11);
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: PageView(
        children: const [
          CalendarGrid(color: Colors.green,),
          CalendarGrid(color: Colors.redAccent,),
          CalendarGrid(color: Colors.lightGreenAccent,),
        ],
      )
    );
  }
}





