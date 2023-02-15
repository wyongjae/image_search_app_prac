import 'dart:convert';

import 'package:image_search_app_prac/data/task_data/task_data.dart';

class TaskJsonData {
  Future<TaskData> loadTaskJsonData() async {
    await Future.delayed(const Duration(seconds: 3));
    final jsonResponse = await jsonDecode(mockJson);
    TaskData taskData = TaskData.fromJson(jsonResponse);
    return taskData;
  }
}

const mockJson = '''{
  "userId": 1,
  "id": 1,
  "title":
      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body":
      "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
}''';
