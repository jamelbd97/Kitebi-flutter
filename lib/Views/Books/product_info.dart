import 'package:flutter/material.dart';
import 'package:kitebi/Entities/book.dart';
import 'package:kitebi/constants.dart';

class BookDetails extends StatelessWidget {
  final String _id;
  final String _title;
  final String _artist;
  final String _cover;

  const BookDetails(this._id, this._title, this._artist, this._cover);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return BookDetails(_id, _title, _artist, _cover);
          }));
        },
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(Constants.bookCoversUrl + _cover),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(_title),
                        Text(_artist)
                      ],
                    ),
                    ElevatedButton(onPressed:() => {

                    }, child: const Text("View"))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
