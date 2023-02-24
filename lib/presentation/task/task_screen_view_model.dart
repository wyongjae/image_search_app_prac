import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/task_data_repository/task_data_repository.dart';
import 'package:image_search_app_prac/model/task_data.dart';

class TaskScreenViewModel extends ChangeNotifier {
  TaskDataRepository repository;

  TaskScreenViewModel(this.repository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<TaskData> _taskData = [];

  List<TaskData> get taskData => UnmodifiableListView(_taskData);

  Future<void> fetch() async {
    _isLoading = true;
    notifyListeners();

    _taskData = await repository.getDatas();
    _isLoading = false;
    notifyListeners();
  }
}
