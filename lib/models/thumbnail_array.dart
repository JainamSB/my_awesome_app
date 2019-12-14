import 'dart:io';

import 'package:my_awesome_app/widgets/thumbnail.dart';
import 'package:my_awesome_app/models/file_paths.dart';

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
