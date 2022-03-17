import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitebi/Views/Books/list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.book, color: Colors.black,),
                      SizedBox(width: 8),
                      Text(
                        'Books',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.headphones),
                      SizedBox(width: 8),
                      Text('Audiobooks'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star),
                      SizedBox(width: 8),
                      Text('Favorites'),
                    ],
                  ),
                ),
              ],
              isScrollable: true,
            ),
            actions: [
              ElevatedButton(onPressed: () {}, child: const Icon(Icons.book))
            ],
          ),
          body: const TabBarView(
            children: [BooksList(), BooksList(), BooksList()],
          ),
        ),
      ),
    );
  }
}
