import 'package:flutter/material.dart';

class AudiobookDetails extends StatefulWidget {
  final String _id;
  final String _title;
  final String _author;
  final DateTime _releaseDate;
  final String _coverId;
  final String _audioId;

  const AudiobookDetails(this._id, this._title, this._author, this._releaseDate,
      this._coverId, this._audioId);

  @override
  State<AudiobookDetails> createState() => _AudiobookDetailsState();
}

class _AudiobookDetailsState extends State<AudiobookDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audiobook"),
      ),
      body: Column(
        children: [
          Text("_id : " + widget._id),
          Text("Title : " + widget._title),
          Text("Author : " + widget._author),
          Text("ReleaseDate : " + widget._releaseDate.toString()),
          Text("Cover : " + widget._coverId),
          Text("Audio : " + widget._audioId),
        ],
      ),
    );
  }
}
