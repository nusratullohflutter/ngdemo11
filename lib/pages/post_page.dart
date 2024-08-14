import 'package:flutter/material.dart';
import 'package:ngdemo11/model/member_model.dart';
import 'package:ngdemo11/model/post_model.dart';
import 'package:ngdemo11/pages/details_page.dart';
import 'package:ngdemo11/pages/post_detail_page.dart';
import 'package:ngdemo11/service/hive_service.dart';
import 'package:ngdemo11/service/sql_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = [];
  String name = "no name";

  _loadPosts() async {
    var postList = await SqlService.fetchPosts();
    setState(() {
      posts = postList;
    });
    print(posts.length);
  }

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  _callDetailsPage() async {
    var result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const PostDetailPage();
    }));

    if (result) {
      _loadPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("SQL"),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _itemOfMember(posts[index]);
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

  Widget _itemOfMember(Post post) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 5),
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            post.title!,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            post.body!,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
