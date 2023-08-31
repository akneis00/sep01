import 'package:c_proto/Classes/ReportClass.dart';
import 'package:c_proto/Classes/UserClass_later.dart';
import 'package:c_proto/Constants/Design/color_schemes.g.dart';
import 'package:c_proto/Repository/ReportRepository.dart';
import 'package:c_proto/Repository/UserRepository.dart';
import 'package:c_proto/Screens/Pages/main/ProfilePage.dart';
import 'package:c_proto/Screens/widgets/Select_MemPage.dart';
import 'package:c_proto/Screens/widgets/Select_PrjPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReportPage extends StatefulWidget {
  ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final user = FirebaseAuth.instance.currentUser;
  static FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference product = FirebaseFirestore.instance.collection('Report');
  final myController = TextEditingController();

  DocumentReference<Map<String, dynamic>> docRef = db.collection("user").doc("gTvK9ha5S4SYJH2qYhsDpS629hh1");



  Future<String> _userData() async {
    final userData = await FirebaseFirestore.instance
        .collection('user')
        .doc('gTvK9ha5S4SYJH2qYhsDpS629hh1')
        .get();
    return userData.data()!['userName'];
  }

  List<Report> reportInstanceList = [
    Report(
        report:
            "항공모함 한 대만 있으면 그 어떤 바다도 안방처럼 편안히 돌아 다닐 수 있습니다. 하지만 대형 태풍이 닥친다면 사정이 달라집니다. 아무리 항공모함이라해도 안전을 보장 할 수 없기 때문입니다.\n주식 역시 마찬가지 입니다. 대한민국 경제에 대형 폭풍이 몰아치면 그 어떤 회사의 주식도 안전을 보장 할 수가 없습니다. 따라서 우리는 경제신문을 읽고, 각종 경제지표를 체크하며 다가 올 대형 폭풍은 없는지 공부를 해야합니다",
        rating: '3.5',
        date: "20220422"),
    Report(
        report:
            "반도체와 디스플레이의 핵심 공정 중 하나인 식각 공정은 필요한 부분만 남기고 불필요한 부분은 깎아내는 것으로 높은 정밀도를 요구하는 고난도 기술 중에 하나다. 볼트크리에이션은 식각 공정의 수율과 정밀도를 높이는 새로운 기술로 디스플레이와 방산 부품을 개발·생산하고 있다. 신개념 건식 식각 공정과 장비를 개발하는 이들의 이야기를 소개한다. 이외에도 MZ세대를 위해 적은 금액으로도 해외 주식 투자가 가능한 신",
        rating: '4.0',
        date: "20220122"),
    Report(
        report:
            "하산의 입산의 역순입니다. 쉽게 말해서 각종 경제지표를 정점 했는데 대한민국 경제에 먹구름이 다가 온다면, 그리고 봉도표, 이동평균선 등을 분석했는데 가격이 너무 올랐다면, 이제 주식을 팔아치우고 그동안 번 돈으로 각종 지름신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 생활을 즐기시면 됩니다.",
        rating: '5.0',
        date: "20220622"),
    Report(
        report:
            "지난 10일에 있던 박람회가 무사히 잘 끝났다. 황과장도 왔었으면 좋았을 텐데 아쉽다. 마감일도 잘 지켰고 우리쪽 구역에 있는 사람들도 많이 왔었다. 주변 사람들이 생각하던 것이 딱딱 맞아 떨어지니 기분이 좋다. 다음번에는 좀 더 멋진 기획을 가지신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 신을 영접하며 고 와야겠다.",
        rating: '1.5',
        date: "20220222"),
    Report(
        report:
            "동산들 이야기를 들어보니 주변 택지개발 소문이 자자하며 주변 조합 내부 분위기도 잘 듣고 있는 중이다. 주변 시공사들도 최근 시황이 심심치 않음을 알았는지 잘 찾아오지 않으며, 물건에 대한 문의 또한 많지 않다. 이렇게 가다간 정말 급매밖에 안나올텐데 그 좋은 물건들조차 거래가 전혀 없어서 큰일이다. 앞으로 물가는 더욱 오른다고 하고 금리도 같이 계속 오른다고는 하는데 정말고 경기 침체가 아닌지 너무나 우려된다.강남 최고라고는 하는데 우리 집은 입지가 매우 좋아 걱정은 덜 된다.자주 찾아오고 필요한 정보 있으면 바로바로",
        rating: '3.5',
        date: "20220122")
  ];

  @override
  Widget build(BuildContext context) {
    List<Container> containerList = makeContainerList();

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 90,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("용산 정비창",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              IconButton(
                  onPressed: () {
                    showMyPrjBottomSheet();
                  },
                  icon: const Icon(
                    Icons.expand_more,
                    size: 40,
                  )),
            ],
          ),
          actions: [
            Text(UserRepository.get(documentId: "gTvK9ha5S4SYJH2qYhsDpS629hh1").toString()),
            // Text("4팀\n${FirebaseAuth.instance.currentUser!.uid}"),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                icon: const Icon(Icons.person))
          ]),
      body: Column(
        children: [
          const Divider(),
          Container(
              padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightColorScheme.onPrimary),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "신금성 부동산",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            showMyMemberBottomSeet();
                          },
                          icon: const Icon(Icons.expand_more)),
                      const Spacer(
                        flex: 4,
                      ),
                      const Text("협회정회원, 68-27,  010-2268-8842",
                          style: TextStyle(fontSize: 15)),
                      // Spacer(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "성향",
                        style: TextStyle(),
                      ),
                      starWidget(),
                    ],
                  ),
                ],
              )),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  // padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: TextField(
                    controller: myController,
                    maxLines: 10,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: "Report Here",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: lightColorScheme.outline),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: product.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return Padding(
                              padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Column(
                                    children: [
                                      Text(documentSnapshot['report']),
                                      Text(documentSnapshot['rating']),
                                    ],
                                  ),
                                ),
                                // child: ListTile(
                                //   title: Text(documentSnapshot['rating']),
                                //   subtitle: Text(documentSnapshot['report']),
                                //
                                // ),
                              ),
                            );
                          });
                    } else if (streamSnapshot.hasError) {
                      return Text("Error: ${streamSnapshot.error}");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                ...containerList,
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: buttonToSend(),
    );
  }

  Widget starWidget() {
    return RatingBar.builder(
      initialRating: 2.5,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 20,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget buttonToSend() {
    return FloatingActionButton.extended(
      backgroundColor: lightColorScheme.secondary,
      onPressed: () async {
        await ReportRepository.create(
            Report(report: myController.text, rating: '4.5', date: '20260401'));
        // showMyDialog(); // 사용은 안하지만 예제로 남겨두는 중
        // showMyYesBottomSheet(); 파이어베이스 구현 전에 걍 '전송되엇슴다' 띄우기용도 위젯.
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text("SEND",
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'SpokaHan',
              fontWeight: FontWeight.w700,
              color: lightColorScheme.onSecondary)),
    );
  }

  void showMyYesBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            child: Row(
              children: [
                const Text("전송되었습니다"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("ok")),
              ],
            ),
          );
        });
  }

  void showMyPrjBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5),
              child: Select_PrjPage());
        });
  }

  void showMyMemberBottomSeet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5),
              child: Select_MemPage());
        });
  }

  //이 다이어로그는 사용은 안하지만 예제로 남겨두는 중. 정리되면 삭제.
  void showMyDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("전송"),
            content: const Text("전송하시겠습니까?"),
            actions: [
              TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("전송되었습니다"),
                      duration: const Duration(milliseconds: 1000),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ));
                    Navigator.of(context).pop();
                  },
                  child: const Text("예")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("아니오")),
            ],
          );
        });
  }

  List<Container> makeContainerList() {
    List<Container> list = [];
    for (Report reprep in reportInstanceList) {
      list.add(
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // border: Border.all(),
              color: Colors.grey.shade200),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                  style: TextStyle(
                      fontSize: 18, color: lightColorScheme.onPrimaryContainer),
                  reprep.report),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 10,
                  ),
                  Icon(color: Colors.grey.shade500, Icons.star),
                  const Spacer(),
                  Text(
                      style:
                          TextStyle(height: 1.5, color: Colors.grey.shade500),
                      reprep.rating.toString()),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                          style: TextStyle(
                              height: 1.5, color: Colors.grey.shade500),
                          reprep.date),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return list;
  }
}
