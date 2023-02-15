import 'dart:convert';

import 'package:image_search_app_prac/data/task_data/task_data.dart';

class TaskJsonData {
  TaskData loadTaskJsonData() {
    Map<String, dynamic> jsonResponse = jsonDecode('''
        {
      "userId": 1,
      "id": 1,
      "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      }'''
    );
    TaskData taskData = TaskData.fromJson(jsonResponse);
    return taskData;
  }
}
