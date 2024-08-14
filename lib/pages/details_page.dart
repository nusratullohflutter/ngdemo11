import 'package:flutter/material.dart';
import 'package:ngdemo11/model/member_model.dart';
import 'package:ngdemo11/service/hive_service.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerName = TextEditingController();

  _addMemberToDB() {
    String idString = controllerId.text.trim().toString();
    String username = controllerName.text.trim().toString();
    int id = int.parse(idString);
    Member member = Member(id, username);

    HiveService.saveMember(member);

    _backToFinish();
  }

  _backToFinish() {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Add Member"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controllerId,
              decoration: const InputDecoration(hintText: "Input member id"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerName,
              decoration: const InputDecoration(hintText: "Input member name"),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                _addMemberToDB();
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
