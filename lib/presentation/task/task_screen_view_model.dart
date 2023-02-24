import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/task_data_repository/task_data_repository.dart';
import 'package:image_search_app_prac/model/task_data.dart';

class TaskScreenViewModel extends ChangeNotifier {
  TaskDataRepository repository;

  TaskScreenViewModel(this.repository);

  bool isLoading = false;

  List<TaskData> taskData = [];

  Future<void> fetch() async {
    isLoading = true;
    notifyListeners();

    taskData = await repository.getDatas();
    isLoading = false;
    notifyListeners();
  }
}
