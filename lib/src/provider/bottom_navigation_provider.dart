import 'package:flutter/widgets.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;

  int get currentPage => _index;

  updatePage(int index){
    _index = index;
    // 업데이트 알림
    notifyListeners();
  }

}