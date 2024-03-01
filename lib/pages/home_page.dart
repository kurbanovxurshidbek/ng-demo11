import 'package:flutter/material.dart';
import 'package:ngdemo11/model/member_model.dart';
import 'package:ngdemo11/service/hive_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "No name";

  loadMember() async {
    var member = HiveService.loadMember();
    setState(() {
      name = member.id.toString();
    });
  }

  loadMembers() async {
    List<Member> members = HiveService.getAllMembers();
    setState(() {
      name = members.first.username;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Member member1 = Member(1002, "Foziljon");
    Member member2 = Member(1003, "Bahrom");
    //HiveService.storeMember(member);
    //loadMember();
    HiveService.saveMember(member1);
    HiveService.saveMember(member2);

    loadMembers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("NoSQL"),
      ),
      body: Center(
        child: Text(name,style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
