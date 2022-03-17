import 'package:flutter/material.dart';
import 'package:kitebi/constants.dart';
import 'package:kitebi/views/books/reader.dart';

class SingleBookItem extends StatelessWidget {
  final String _id;
  final String _title;
  final String _artist;
  final String _cover;

  const SingleBookItem(this._id, this._title, this._artist, this._cover);

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
            child: Image.network(Constants.bookCoversUrl + _cover,
                width: 175, height: 250, fit: BoxFit.cover),
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
                      _artist,
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
                          builder: (context) =>
                              const BookDetails("", "", "", "")));
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
