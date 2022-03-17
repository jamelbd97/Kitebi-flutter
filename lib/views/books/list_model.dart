import 'package:flutter/material.dart';
import 'package:kitebi/constants.dart';
import 'package:kitebi/global_theme.dart';
import 'package:kitebi/views/books/reader.dart';

class BookListModel extends StatelessWidget {
  final String _id;
  final String _title;
  final String _author;
  final DateTime _releaseDate;
  final String _coverId;
  final String _pdfId;

  const BookListModel(this._id, this._title, this._author, this._releaseDate,
      this._coverId, this._pdfId);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 175,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constants.bookDataUrl + _coverId),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0),
                  ],
                )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Chip(
                            padding: EdgeInsets.all(0),
                            backgroundColor: customPurple4,
                            label: Text("Top 10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                            shape: StadiumBorder(
                                side: BorderSide(color: customPurple2)),
                          ),
                        ),
                        IconButton(
                            alignment: Alignment.topRight,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      _author,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookReader(_id, _title, _author,
                              _releaseDate, _coverId, _pdfId)));
                },
                child: const Text("View"),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(7),
                    minimumSize: const Size(40, 30)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
