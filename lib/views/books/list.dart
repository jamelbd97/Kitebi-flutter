import "dart:convert";

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kitebi/constants.dart';
import 'package:kitebi/global_theme.dart';
import 'package:kitebi/models/book.dart';

import 'list_model.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final List<Book> _books = [];

  late Future<bool> fetchedData;

  Future<bool> fetchData() async {
    http.Response response =
    await http.get(Uri.parse(Constants.serverUrl + "book/all"));

    List<dynamic> booksFromServer = json.decode(response.body)["books"];

    for (var i = 0; i < booksFromServer.length; i++) {
      _books.add(Book(
          booksFromServer[i]["_id"],
          booksFromServer[i]["title"],
          booksFromServer[i]["author"],
          DateTime.parse(booksFromServer[i]["releaseDate"]),
          booksFromServer[i]["coverId"],
          booksFromServer[i]["pdfId"]));
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
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.black12)),
                        label: Text(
                          'Genres',
                          style: TextStyle(color: customDark, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.black12)),
                        label: Text(
                          'Top selling',
                          style: TextStyle(color: customDark, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.black12)),
                        label: Text(
                          'New releases',
                          style: TextStyle(color: customDark, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.black12)),
                        label: Text(
                          'Top grossing',
                          style: TextStyle(color: customDark, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Recommended for you",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: customDark),
                          ),
                          Text("Based on your reading history",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: customDark))
                        ],
                      ),
                      const Icon(Icons.arrow_forward, color: customPurple4)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 350,
                child: FutureBuilder(
                    future: fetchedData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            padding: const EdgeInsets.all(5),
                            scrollDirection: Axis.horizontal,
                            itemCount: _books.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                alignment: Alignment.center,
                                child: BookListModel(
                                    _books[index].id,
                                    _books[index].title,
                                    _books[index].author,
                                    _books[index].releaseDate,
                                    _books[index].coverId,
                                    _books[index].pdfId),
                              );
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "New Releases",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: customDark),
                          )
                        ],
                      ),
                      const Icon(Icons.arrow_forward, color: customPurple4)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 350,
                child: FutureBuilder(
                    future: fetchedData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var _booksInverted = _books.reversed.toList();
                        return ListView.builder(
                            padding: const EdgeInsets.all(5),
                            scrollDirection: Axis.horizontal,
                            itemCount: _booksInverted.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                alignment: Alignment.center,
                                child: BookListModel(
                                    _booksInverted[index].id,
                                    _booksInverted[index].title,
                                    _booksInverted[index].author,
                                    _booksInverted[index].releaseDate,
                                    _booksInverted[index].coverId,
                                    _booksInverted[index].pdfId),
                              );
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
