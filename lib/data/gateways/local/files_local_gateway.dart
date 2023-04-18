import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class FilesLocalGateway {
  Future<String> get _photos360DirectoryPath async => '${(await getApplicationDocumentsDirectory()).path}/360photos';

  Future<String?> save360Photo(Uint8List bytes, int appointmentId) async {
    String? path;
    try {
      Directory directory = Directory('${await _photos360DirectoryPath}/$appointmentId');
      if (!(await directory.exists())) {
        directory.create(recursive: true);
      }
      path = '${directory.path}/${DateTime.now().toIso8601String()}';
      File photoFile = File(path);
      await photoFile.writeAsBytes(bytes);
    } catch (_) {}

    return path;
  }
}
