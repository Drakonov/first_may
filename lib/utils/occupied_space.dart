import 'package:flutter/cupertino.dart';
import 'package:first_may/core/utils/context_extensions.dart';

class BitesConverter {
  final int _bytes;

  BitesConverter(this._bytes);

  static String getFormattedSpace(BuildContext context, int bytes) {
    double valueStorage = 0.0;
    String postString = context.localizations.kb;
    if (bytes > 1000 * 1000 * 500) {
      valueStorage = bytes / 1024 / 1024 / 1024;
      postString = context.localizations.gb;
    } else if (bytes > 1000 * 500) {
      valueStorage = bytes / 1024 / 1024;
      postString = context.localizations.mb;
    } else if (bytes > 500) {
      valueStorage = bytes / 1024;
    } else if (bytes > 100) {
      valueStorage = bytes / 1024;
    } else if (bytes > 1) {
      valueStorage = 0.1;
    }
    return '${valueStorage.toStringAsFixed(1)} $postString';
  }

  String getOccupiedSpace() {
    double valueStorage = 0.0;
    if (_bytes > 1000 * 1000 * 500) {
      valueStorage = _bytes / 1024 / 1024 / 1024;
    } else if (_bytes > 1000 * 500) {
      valueStorage = _bytes / 1024 / 1024;
    } else if (_bytes > 500) {
      valueStorage = _bytes / 1024;
    } else if (_bytes > 100) {
      valueStorage = _bytes / 1024;
    } else if (_bytes > 1) {
      valueStorage = 0.1;
    }
    return valueStorage.toStringAsFixed(1);
  }

  String getMeasuredInformationLevel(BuildContext context) {
    String postString = context.localizations.kb;
    if (_bytes > 1000 * 1000 * 500) {
      postString = context.localizations.gb;
    } else if (_bytes > 1000 * 500) {
      postString = context.localizations.mb;
    }
    return postString;
  }
}
