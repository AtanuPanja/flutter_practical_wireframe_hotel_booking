import 'package:hive_flutter/hive_flutter.dart';

class AppDatabase {
  List usersList = [];

  // referencing the hive box
  final myBox = Hive.box('myBox');

  void loadUsers() {
    usersList = myBox.get('usersList');
  }

  void updateDatabase() {
    myBox.put('usersList', usersList);
  }
}