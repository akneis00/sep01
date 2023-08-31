import 'package:c_proto/Classes/ReportClass.dart';
import 'package:flutter/material.dart';
import 'Repository/ReportRepository.dart';


class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          ElevatedButton(
            child:Text("button"),
            onPressed:()async {                //이런식으로 쓰면 된다~~ 시간없어서 예시로만 보여줌.
              await ReportRepository.save(Report(report: 'report', rating: '4.5', date: '20260401'));   // save는 퓨처이기 때문에 나중에 진짜 쓰려면 await붙이는것도 신경써야 함.
              ReportRepository.get();
              ReportRepository.delete();
              ReportRepository.getList();
            },
          ),
        ],
      )
    );
  }
}