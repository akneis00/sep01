import 'package:flutter/material.dart';

class Select_MemPage extends StatelessWidget {
  Select_MemPage({Key? key}) : super(key: key);
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10,),
      SizedBox(
        width: MediaQuery.of(context).size.width*0.5,
        child: TextField(
          controller: myController,
          decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Search Name'),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: SizedBox(width: double.infinity,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('이름'),
                ),
                DataColumn(
                  label: Text('위치'),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('얼굴 부동산')),
                    DataCell(Text('서대문구 연세로4길 27')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('좋은사람 부동산')),
                    DataCell(Text('서대문구 연세로4길 27')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('대박 부동산')),
                    DataCell(Text('서대문구 연세로4길 27')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('바람 부동산')),
                    DataCell(Text('서대문구 연세로4길 27')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('대신 부동산')),
                    DataCell(Text('서대문구 연세로4길 27')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('이편한 부동산')),
                    DataCell(Text('서대문구 연세로4길 27')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('럭키 부동산')),
                    DataCell(Text('서대문구 연세로4길 27')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('대명 부동산')),
                    DataCell(Text('서대문구 연세로4길 27')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      ButtonToAdd(),
    ]);
  }

  ButtonToAdd() {
    return Column(
      children: [
        OutlinedButton(onPressed: (){}, child: Text("Selected"),),
        SizedBox(height: 10,),
      ],
    );
  }
}
