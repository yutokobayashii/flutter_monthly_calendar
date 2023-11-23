
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'WeekDaysRow.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({
    super.key,
    required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (_ , child) {
          return Column(
            children: [
              SizedBox(
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.chevron_left),
                    Text("1月 2024",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.sp
                    ),),
                    const Icon(Icons.chevron_right)
                  ],
                ),
              ),
              const WeekDaysRow(),
              Container(
                color: color,
                child: Table(
                  border: TableBorder.all(),
                  children: List.generate(6, (rowIndex) { // 縦6行
                    return TableRow(
                      children: List.generate(7, (colIndex) { // 横7列
                        
                        return Container(
                          height: 90.h, // セルの高さ
                          alignment: Alignment.center,
                          child: const Text('データ'), // ここに日付やその他のデータを表示
                        );
                      }),
                    );
                  }),
                ),
              ),
            ],
          );
        }
    );
  }
}