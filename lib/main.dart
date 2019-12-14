import 'package:flutter/material.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'dart:io';
import 'widgets/thumbnail.dart';
import 'models/thumbnail_array.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_path/storage_path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;
import 'dart:convert';
import 'models/file_paths.dart';
import 'package:loading/loading.dart';

List<String> pathsFromJson(var jsonData) {
  List<String> filePaths = [];
  var x = jsonDecode(jsonData);

  int noOfFolders = x.length;

  for (int i = 0; i < noOfFolders; i++) {
    int noOfFiles = x[i]['files'].length;
    for (int j = 0; j < noOfFiles; j++) {
      String finalPath = x[i]['files'][j]['path'];
      if (finalPath.endsWith('.pdf')) {
        filePaths.add(finalPath);
        //print(finalPath);
      }
    }
  }
  return filePaths;
}

List<Thumbnail> getAllthumbnails(List<String> paths) {
  List<Thumbnail> thumbnails = [];

  //print(paths);
  for (String path in paths) {
    thumbnails.add(Thumbnail(
      file: File(path),
    ));
  }
  //print(thumbnails);
  return thumbnails;
}

void main() => runApp(MyApp());

List<Thumbnail> allThumbnails;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String listKey = "thumbnailPaths";

  PdfDocumentLoader pdLoad1;

  @override
  void initState() {
    //print(getAllPaths());
    super.initState();
    StoragePath.filePath.then((jsonData) {
      List<String> allPaths = pathsFromJson(jsonData);
      setState(() {
        allThumbnails = getAllthumbnails(allPaths);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Reader'),
        centerTitle: true,
        leading: Icon(Icons.search),
        backgroundColor: Colors.blue,
      ),
      body: WhatToDisplay(),

      //floating action button
    );
  }
}

class WhatToDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (allThumbnails == null)
        ? Loading(
            indicator: BallPulseIndicator(), size: 100.0, color: Colors.pink)
        : Wrap(
            children: allThumbnails,
          );
  }
}
