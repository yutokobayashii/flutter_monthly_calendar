library sample_package;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
        return Container(





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
        );
      }
    );
  }
}