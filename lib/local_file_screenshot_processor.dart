library local_file_screenshot_processor;

import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  DateTime now = new DateTime.now();
  return File('$path/screenshots_${now.millisecondsSinceEpoch}.png');
}

Future<File> _writeImageData(Uint8List imageData) async {
  final file = await _localFile;

  return file.writeAsBytes(imageData);
}

/// A drop-in replacement for the default fileio upload screenshot processor.
Future<String> localFileScreenshotProcessor(ss) {
  return _writeImageData(ss.bytes).then((file) {
    return file.absolute.path;
  });
}
