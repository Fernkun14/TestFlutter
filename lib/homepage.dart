import 'package:flutter/material.dart';
import 'package:flutter_application_test/tabs/first_tabs.dart';
import 'package:flutter_application_test/tabs/second_tabs.dart';
import 'package:flutter_application_test/tabs/third_tabs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('T e s t'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.list_alt,
                    color: Colors.deepPurple,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.info,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            
            Expanded(
              child: TabBarView(children: [
                FirstTab(),
                SecondTab(),
                ThirdTab(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
