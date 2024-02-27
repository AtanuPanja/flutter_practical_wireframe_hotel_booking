import 'package:hive_flutter/hive_flutter.dart';

class AppDatabase {
  List usersList = [];

  // referencing the hive box
  final myBox = Hive.box('myBox');

  void loadUsers() {
    usersList = myBox.get('usersList');
    usersList.removeWhere((element) => element['phone'].isEmpty);
    updateDatabase();
  }

  void updateDatabase() {
    myBox.put('usersList', usersList);
  }
}