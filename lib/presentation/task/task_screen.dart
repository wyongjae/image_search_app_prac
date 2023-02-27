import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/task/task_screen_view_model.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TaskScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Page'),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.fetch();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: viewModel.taskData.length,
              itemBuilder: (BuildContext context, int index) {
                final taskData = viewModel.taskData[index];

                return Card(
                  child: ListTile(
                    title: Text(taskData.title),
                  ),
                );
              },
            ),
    );
  }
}
