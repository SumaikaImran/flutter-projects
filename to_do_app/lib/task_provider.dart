import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskNotifier extends Notifier<List<String>> {
  @override
  List<String> build() => [];

  void addTask(String task) {
    state = [...state, task];
  }

  void deleteTask(int index) {
    final newList = [...state]..removeAt(index);
    state = newList;
  }
}

final taskProvider = NotifierProvider<TaskNotifier, List<String>>(
  () => TaskNotifier(),
);
