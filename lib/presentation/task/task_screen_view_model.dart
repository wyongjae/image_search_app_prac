import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/task_data_repository/task_data_repository.dart';
import 'package:image_search_app_prac/domain/model/task_data.dart';

class TaskScreenViewModel with ChangeNotifier {
  TaskDataRepository repository;

  TaskScreenViewModel(this.repository);

  final bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<TaskData> _taskData = [];

  List<TaskData> get taskData => UnmodifiableListView(_taskData);

  bool loading({bool? isLoading}) {
    return isLoading ??= this.isLoading;
  }

  Future<void> fetch() async {
    loading(isLoading: true);
    notifyListeners();

    _taskData = await repository.getDatas();
    loading(isLoading: false);
    notifyListeners();
  }
}
