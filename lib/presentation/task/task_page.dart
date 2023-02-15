import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/task_data/task_json_data.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Page'),
      ),
      body: FutureBuilder(
        future: TaskJsonData().loadTaskJsonData(),
        builder: (BuildContext context, snapshot) {
          final taskData = snapshot.data;

          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: [
                Card(
                  child: ListTile(
                    title: Text(taskData!.title),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}