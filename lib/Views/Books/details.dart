import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookDetails extends StatefulWidget {
  final String _id;
  final String _title;
  final String _artist;
  final String _cover;

  const BookDetails(this._id, this._title, this._artist, this._cover);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book"),
      ),
      body: Column(
        children: [
          Text("_id : " + widget._id),
          Text("Title : " + widget._title),
          Text("Artist : " + widget._artist),
          Text("Cover : " + widget._cover)
        ],
      ),
    );
  }
}
