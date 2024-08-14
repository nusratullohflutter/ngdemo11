import 'package:ngdemo11/service/hive_service.dart';
import 'package:ngdemo11/service/sql_service.dart';

class RootService {
  static Future<void> init() async {
    await HiveService.init();
    await SqlService.init();
  }
}
