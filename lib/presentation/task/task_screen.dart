import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/data/task_data/task_json_data.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Page'),
      ),
      body: FutureBuilder(
        future: TaskJsonData().loadTaskJsonData(),
        builder: (BuildContext context, snapshot) {
          final taskDatas = snapshot.data ?? [];

          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: taskDatas.length,
              itemBuilder: (BuildContext context, int index) {
                final taskData = taskDatas[index];

                return Card(
                  child: ListTile(
                    title: Text(taskData.title),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
