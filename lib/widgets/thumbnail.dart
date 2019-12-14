import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    @required this.file,
  });

  final File file;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.27 * 1.5,
            width: MediaQuery.of(context).size.width * 0.27,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x28000000),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: PdfDocumentLoader(
              filePath: file.path,
              pageNumber: 1,
            ),
          ),
        ),
        Container(
          child: Text(path.basenameWithoutExtension(file.path)),
          width: MediaQuery.of(context).size.width * 0.27,
        ),
      ],
    );
  }
}
