library sample_package;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_package/pages/CalendarGrid.dart';

import 'ViewModel/CalculateDaysAndWeekdays.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ProviderScope(
        child: CalendarViews());
  }
}




class CalendarViews extends ConsumerWidget {
  const CalendarViews({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    calculateDaysAndWeekdays(2023,11,ref);
    return ProviderScope(
      child: Scaffold(
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
      ),
    );
  }
}





