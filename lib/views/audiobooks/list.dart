import "dart:convert";

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kitebi/constants.dart';
import 'package:kitebi/global_theme.dart';
import 'package:kitebi/models/audiobook.dart';
import 'package:kitebi/views/audiobooks/list_model.dart';

class AudioBookList extends StatefulWidget {
  const AudioBookList({Key? key}) : super(key: key);

  @override
  State<AudioBookList> createState() => _AudioBookListState();
}

class _AudioBookListState extends State<AudioBookList> {
  final List<Audiobook> _audiobooks = [];

  late Future<bool> fetchedData;

  Future<bool> fetchData() async {
    http.Response response =

        await http.get(Uri.parse(Constants.serverUrl + "audiobook/all"));

    List<dynamic> audiobooksFromServer =
        json.decode(response.body)["audiobooks"];
    for (var i = 0; i < audiobooksFromServer.length; i++) {
      _audiobooks.add(Audiobook(
          audiobooksFromServer[i]["_id"],
          audiobooksFromServer[i]["title"],
          audiobooksFromServer[i]["author"],
          DateTime.parse(audiobooksFromServer[i]["releaseDate"]),
          audiobooksFromServer[i]["coverId"],
          audiobooksFromServer[i]["audioId"]
      ));
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
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Image.asset("assets/banner.png")),
        SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Chip(
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(side: BorderSide(color: Colors.black12)),
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
                  shape: StadiumBorder(side: BorderSide(color: Colors.black12)),
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
                  shape: StadiumBorder(side: BorderSide(color: Colors.black12)),
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
                  shape: StadiumBorder(side: BorderSide(color: Colors.black12)),
                  label: Text(
                    'Top grossing',
                    style: TextStyle(color: customDark, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          child: FutureBuilder(
              future: fetchedData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: _audiobooks.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: AudiobookListModel(
                            _audiobooks[index].id,
                            _audiobooks[index].title,
                            _audiobooks[index].author,
                            _audiobooks[index].releaseDate,
                            _audiobooks[index].coverId,
                            _audiobooks[index].audioId),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300, mainAxisExtent: 260),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}
