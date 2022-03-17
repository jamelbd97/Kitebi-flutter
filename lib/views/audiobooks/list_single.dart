import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitebi/constants.dart';
import 'package:kitebi/global_theme.dart';

class SingleAudiobookItem extends StatefulWidget {
  final String _id;
  final String _title;
  final String _artist;
  final String _cover;
  final String _audio;

  const SingleAudiobookItem(
      this._id, this._title, this._artist, this._cover, this._audio);

  @override
  _SingleAudiobookItemState createState() => _SingleAudiobookItemState();
}

class _SingleAudiobookItemState extends State<SingleAudiobookItem> {
  IconData _playButtonIcon = Icons.play_circle;
  bool _isPlaying = false;
  AudioPlayer player = AudioPlayer();

  Future play() async {
    int result =
        await player.play(Constants.audiobookCoversUrl + widget._audio);

    if (result != 1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Player error")));
    }
  }

  togglePlay() {
    if (_isPlaying) {
      // PAUSE
      _playButtonIcon = Icons.play_circle;
      player.pause();
    } else {
      // PLAY
      play();
      _playButtonIcon = Icons.pause_circle;
    }

    _isPlaying = !_isPlaying;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      height: 250,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        Constants.audiobookCoversUrl + widget._cover),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Chip(
                          label: Text("New",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                          shape: StadiumBorder(
                              side: BorderSide(color: customPurple2)),
                          backgroundColor: customPurple4,
                          padding: EdgeInsets.all(0),
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
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              togglePlay();
                            });
                          },
                          child: Icon(_playButtonIcon,
                              color: Colors.white, size: 70),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget._title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        widget._artist,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      )
                    ],
                  ),
                  const Text(
                    "3 Min",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: customDark,
                        fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
