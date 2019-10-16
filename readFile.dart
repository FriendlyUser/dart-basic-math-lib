import 'dart:io';
import 'dart:convert';
import 'dart:async';

main() {
  final file = new File('ReadMe.Md');
  Stream<List<int>> inputStream = file.openRead();

  inputStream
    .transform(utf8.decoder)       // Decode bytes to UTF-8.
    .transform(new LineSplitter()) // Convert stream to individual lines.
    .listen((String line) {        // Process results.
        print('$line: ${line.length} bytes');
      },
      onDone: () { print('File is now closed.'); },
      onError: (e) { print(e.toString()); });
}