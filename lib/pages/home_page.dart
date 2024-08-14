import 'package:flutter/material.dart';
import 'package:ngdemo11/model/member_model.dart';
import 'package:ngdemo11/pages/details_page.dart';
import 'package:ngdemo11/service/hive_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Member> members = [];
  String name = "no name";

  _loadMember() {
    var member = HiveService.loadMember();
    setState(() {
      name = member.username;
    });
  }

  _loadMembers() {
    var memberList = HiveService.getAllMembers();
    setState(() {
      members = memberList;
    });
    print(members.length);
  }

  @override
  void initState() {
    super.initState();
    Member member1 = Member(1000, "Xurshidbek");
    Member member2 = Member(1001, "Shoira");
    Member member3 = Member(1002, "Jurat");
    //HiveService.storeMember(member);
    //_loadMember();

    //HiveService.saveMember(member1);
    HiveService.saveMember(member3);

    _loadMembers();
  }

  _callDetailsPage() async {
    var result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const DetailsPage();
    }));

    if (result) {
      _loadMembers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("NoSQL"),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return _itemOfMember(members[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _callDetailsPage();
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _itemOfMember(Member member) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 5),
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            member.username,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            member.id.toString(),
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
