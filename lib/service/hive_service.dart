import 'package:hive/hive.dart';
import 'package:ngdemo11/model/member_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static var box = Hive.box("my_nosql");

  static Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter(MemberAdapter());
    await Hive.openBox("my_nosql");
  }

  static storeMember(Member member) {
    box.put("member", member);
  }

  static Member loadMember() {
    var member = box.get("member");
    return member;
  }

  static removeMember() {
    box.delete("member");
  }

  // Save object without key

  static saveMember(Member member) {
    box.add(member);
  }

  static updateMember(int index, Member member) {
    box.putAt(index, member);
  }

  static List<Member> getAllMembers() {
    List<Member> members = [];
    for (int i = 0; i < box.length; i++) {
      var member = box.getAt(i);
      members.add(member);
    }
    return members;
  }
}
