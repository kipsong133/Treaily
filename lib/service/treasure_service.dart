import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Treasure {
  final String reward;
  final String answer;
  final List<String> choices;
  final String uid;
  final String userName;

  Treasure({
    required this.reward,
    required this.answer,
    required this.choices,
    required this.uid,
    required this.userName,
});
}


class TreasureService extends ChangeNotifier  {
  final treasureCollection = FirebaseFirestore.instance.collection('treasures');

  read(String uid) async {

  }

  void create(Treasure treasure, String uid) async {
    await treasureCollection.add({
      'uid': uid,
      'answer': treasure.answer,
      'choices': treasure.choices,
      'reward': treasure.reward,
      'userName': treasure.userName,
    });
    notifyListeners();
  }

  void update(String docId,Treasure treasure) async {

  }

  void delete(String docId) async {

  }
}