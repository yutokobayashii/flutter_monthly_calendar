// 曜日を表示するウィジェット
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekDaysRow extends StatelessWidget {
  const WeekDaysRow({super.key});

  @override
  Widget build(BuildContext context) {
    final weekDays = ['日', '月', '火', '水', '木', '金', '土'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: weekDays.map((day) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
              day,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp
              )),
        ),
      )).toList(),
    );
  }
}