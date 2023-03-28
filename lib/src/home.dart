import 'package:flutter/material.dart';
import 'package:movieapp_provider/src/provider/bottom_navigation_provider.dart';
import 'package:movieapp_provider/src/provider/count_provider.dart';
import 'package:movieapp_provider/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';

import 'count_home_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationProvider _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    CountProvider _countProvider = Provider.of<CountProvider>(
      context,
      listen: false,
    );

    Widget _navigationBody() {
      switch(_bottomNavigationProvider.currentPage) {
        case 0:
          return CountHomeWidget();
          break;
        case 1:
          return MovieListWidget();
          break;
      }
      return Container();
    }

    Widget _bottomNavigationBarWidget() {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Moive'),
        ],
        currentIndex: _bottomNavigationProvider.currentPage,
        selectedItemColor: Colors.red,
        onTap: (index) {
          // provider navigation state;
          _bottomNavigationProvider.updatePage(index);
        },
      );
    }

    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
