import 'dart:convert';
//import 'dart:html';
import 'package:storage_path/storage_path.dart';

//function that gives all the paths as a list
Future<String> getJsonDta() async {
  return StoragePath.filePath;
}

//0.files[0].path
//[0]['files'][0]['path']

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
