import 'package:flutter/material.dart';

class AudiobookDetails extends StatefulWidget {
  final String _id;
  final String _title;
  final String _artist;
  final String _cover;
  final String _audio;

  const AudiobookDetails(
      this._id, this._title, this._artist, this._cover, this._audio);

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
          Text("Artist : " + widget._artist),
          Text("Cover : " + widget._cover),
          Text("Audio : " + widget._audio),
        ],
      ),
    );
  }
}
