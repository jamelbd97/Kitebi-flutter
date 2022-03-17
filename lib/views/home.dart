import 'package:flutter/material.dart';
import 'package:kitebi/global_theme.dart';
import 'package:kitebi/views/audiobooks/list.dart';
import 'package:kitebi/views/books/list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: customPurple4,
            tabs: [
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.book),
                    SizedBox(width: 8),
                    Text('Books'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.headphones),
                    SizedBox(width: 8),
                    Text('AudioBooks'),
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
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: const TabBarView(
          children: [
            BookList(),
            AudioBookList(),
            Center(child: Text("Coming soon"))
          ],
        ),
      ),
    );
  }
}
