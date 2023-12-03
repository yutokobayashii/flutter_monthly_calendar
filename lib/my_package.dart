library sample_package;

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_package/pages/CalendarGrid.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'ViewModel/CalculateDaysAndWeekdays.dart';


class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return   const ProviderScope(
        child: CalendarViews());
  }
}




class CalendarViews extends HookConsumerWidget {
  const CalendarViews({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    useEffect(() {
      calculateDaysAndWeekdays(2023,11,ref);
      return () {
        // オプションでクリーンアップロジックを提供
        print("This will run when the widget is disposed.");
      };
    }, const []);
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





