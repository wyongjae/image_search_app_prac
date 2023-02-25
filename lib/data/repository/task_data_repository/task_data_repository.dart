import 'package:image_search_app_prac/data/data/task_data/task_json_data.dart';
import 'package:image_search_app_prac/model/task_data.dart';

class TaskDataRepository {
  TaskJsonData jsonData;

  TaskDataRepository(this.jsonData);

  Future<List<TaskData>> getDatas() async {
    await Future.delayed(const Duration(seconds: 1));
    return jsonData.loadTaskJsonData();
  }
}
