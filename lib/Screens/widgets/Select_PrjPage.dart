import 'package:flutter/material.dart';

class Select_PrjPage extends StatelessWidget {
  Select_PrjPage({Key? key}) : super(key: key);
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Search Project'),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: SizedBox(width: double.infinity,
            child: Column(
              children: [
                SizedBox(child: Text("신촌")),
                SizedBox(child: Text("연신내")),
                SizedBox(child: Text("강일")),
                SizedBox(child: Text("위례")),
                SizedBox(child: Text("범계")),
                SizedBox(child: Text("강서")),
                SizedBox(child: Text("관악")),
                SizedBox(child: Text("광진")),
                SizedBox(child: Text("구로")),
                SizedBox(child: Text("우면산")),
                SizedBox(child: Text("반월")),
                SizedBox(child: Text("계류")),
                SizedBox(child: Text("범계")),
                SizedBox(child: Text("신촌")),
                SizedBox(child: Text("연신내")),
                SizedBox(child: Text("강일")),
                SizedBox(child: Text("위례")),
                SizedBox(child: Text("범계")),
                SizedBox(child: Text("강서")),
                SizedBox(child: Text("관악")),
                SizedBox(child: Text("광진")),
                SizedBox(child: Text("구로")),
                SizedBox(child: Text("우면산")),
                SizedBox(child: Text("반월")),
                SizedBox(child: Text("계류")),
                SizedBox(child: Text("범계")),
              ],
            ),
          ),
        ),
      ),
      ButtonToAdd(),
      SizedBox(height: 10),
    ]);
  }

  ButtonToAdd() {
    return OutlinedButton(
      onPressed: () {},
      child: Text("Selected"),
    );
  }
}
