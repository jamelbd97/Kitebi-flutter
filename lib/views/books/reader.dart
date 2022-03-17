import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kitebi/constants.dart';
import 'package:kitebi/global_theme.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookReader extends StatefulWidget {
  final String _id;
  final String _title;
  final String _author;
  final DateTime _releaseDate;
  final String _coverId;
  final String _pdfId;

  const BookReader(this._id, this._title, this._author, this._releaseDate,
      this._coverId, this._pdfId);

  @override
  _BookReaderState createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  File? _file;
  var _fileIsReady = false;
  var _progressValue = 0.0;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  Future<void> _saveFileFromNetwork(String url) async {
    // Get the image name
    final imageName = basename(url);
    // Get the document directory path
    final appDir = await getApplicationDocumentsDirectory();

    // This is the saved image path
    // You can use it to display the saved image later
    final localPath = join(appDir.path, imageName);

    if (File(localPath).existsSync()) {
      print("The file exists  ..");

      setState(() {
        _fileIsReady = true;
        _file = File(localPath);
      });
    } else {
      print("downloading");

      var httpClient = http.Client();
      var request = http.Request('GET', Uri.parse(url));
      var response = httpClient.send(request);

      List<List<int>> chunks = [];
      int downloaded = 0;

      response.asStream().listen((http.StreamedResponse r) {
        r.stream.listen((List<int> chunk) {
          // progress bar update
          setState(() {
            _progressValue = downloaded / r.contentLength!;
          });

          chunks.add(chunk);
          downloaded += chunk.length;
        }, onDone: () async {
          // Display percentage of completion
          debugPrint('downloadPercentage: ${downloaded / r.contentLength!}');

          // Save the file
          File file = File(localPath);
          final Uint8List bytes = Uint8List(r.contentLength!);
          int offset = 0;
          for (List<int> chunk in chunks) {
            bytes.setRange(offset, offset + chunk.length, chunk);
            offset += chunk.length;
          }
          await file.writeAsBytes(bytes);

          setState(() {
            _fileIsReady = true;
            _file = file;
          });

          print("download complete");
          return;
        });
      });
    }
  }

  Future<void> _deleteSavedFile(String url) async {
    // Get the image name
    final imageName = basename(url);
    // Get the document directory path
    final appDir = await getApplicationDocumentsDirectory();

    // This is the saved image path
    // You can use it to display the saved image later
    final localPath = join(appDir.path, imageName);

    if (File(localPath).existsSync()) {
      print("The file exists deleting ..");

      File(localPath).delete();
    }
  }

  @override
  void initState() {
    super.initState();
    _saveFileFromNetwork(Constants.bookDataUrl + widget._pdfId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title, style: const TextStyle(fontSize: 25)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: customDark,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: customDark,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _deleteSavedFile(
                  "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf");
            },
          ),
        ],
      ),
      body: FutureBuilder(builder: (context, snapshot) {
        if (_fileIsReady && _file != null) {
          return SfPdfViewer.file(_file!,
              key: _pdfViewerKey, pageLayoutMode: PdfPageLayoutMode.single);
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
                child: Column(
                  children: const [
                    Text("Downloading book"),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Because this is your first time opening this book, it needs to be downloaded",
                        style: TextStyle(fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: LinearProgressIndicator(
                  value: _progressValue,
                  color: customPurple4,
                  backgroundColor: customPurple1,
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
