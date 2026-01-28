import 'package:flutter/widgets.dart';

class ListMapProvider extends ChangeNotifier{
  List<Map<String, dynamic>> mList = [];

  void addData(Map<String, dynamic> data){
    mList.add(data);
    notifyListeners();
  }

  List<Map<String, dynamic>> getData(){
    return mList;
  }
}