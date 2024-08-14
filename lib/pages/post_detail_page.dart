import 'package:flutter/material.dart';
import 'package:ngdemo11/model/member_model.dart';
import 'package:ngdemo11/model/post_model.dart';
import 'package:ngdemo11/service/hive_service.dart';
import 'package:ngdemo11/service/sql_service.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerBody = TextEditingController();

  _addMemberToDB() {
    String title = controllerTitle.text.trim().toString();
    String body = controllerBody.text.trim().toString();
    Post post = Post(title: title, body: body);

    SqlService.createPost(post);

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
        title: const Text("Add Post"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controllerTitle,
              decoration: const InputDecoration(hintText: "Input post title"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerBody,
              decoration: const InputDecoration(hintText: "Input post body"),
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
