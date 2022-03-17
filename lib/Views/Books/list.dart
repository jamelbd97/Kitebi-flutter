import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kitebi/Entities/book.dart';
import 'package:kitebi/constants.dart';
import "dart:convert";

import 'product_info.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final List<Book> _books = [];

  late Future<bool> fetchedData;

  Future<bool> fetchData() async {
    http.Response response =
        await http.get(Uri.parse(Constants.serverUrl + "book/all"));

    List<dynamic> booksFromServer = json.decode(response.body)["books"];
    for (var i = 0; i < booksFromServer.length; i++) {
      _books.add(Book(booksFromServer[i]["_id"], booksFromServer[i]["title"],
          booksFromServer[i]["artist"], booksFromServer[i]["coverId"]));
    }

    return true;
  }

  @override
  void initState() {
    fetchedData = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchedData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Factures"),
              ),
              body: ListView.builder(
                itemCount: _books.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      BookDetails(_books[index].id, _books[index].title,
                          _books[index].artist, _books[index].coverId),
                    ],
                  );
                },
              ),
              floatingActionButton: FloatingActionButton.extended(
                label: const Text(
                  "+",
                  textScaleFactor: 1.5,
                ),
                onPressed: () async {},
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
