import 'package:flutter/cupertino.dart';

class ID extends ChangeNotifier {
  String id;

  ID({
    this.id = '0',
  });

  String get getId {
    return id;
  }

  void setId(String newId) {
    id = newId;
    notifyListeners();
  }
}
