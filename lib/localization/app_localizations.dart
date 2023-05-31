import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy/jiffy.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  Locale locale;
  static const String defaultLocale = 'ru';

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static LocalizationsDelegate<AppLocalizations> getDelegate(List<Locale> supportedLocales) =>
      _AppLocalizationsDelegate(supportedLocales);

  static String getFormattedString(String string, List<String> inserts) {
    String newString = string;
    for (var insert in inserts) {
      newString = newString.replaceFirst('{\$}', insert);
    }
    return newString;
  }

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString;
    try {
      jsonString = await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    } catch (e) {
      jsonString = await rootBundle.loadString('assets/i18n/$defaultLocale.json');
    }
    final Map<String, dynamic> jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((String key, value) {
      return MapEntry(
        key,
        value.toString(),
      );
    });

    await Jiffy.setLocale(locale.languageCode);

    return true;
  }

  String get appointments => _localizedStrings['appointments'] ?? '';

  String get today => _localizedStrings['today'] ?? '';

  String get tomorrow => _localizedStrings['tomorrow'] ?? '';

  String get yesterday => _localizedStrings['yesterday'] ?? '';

  String get all => _localizedStrings['all'] ?? '';

  String get confirmed => _localizedStrings['confirmed'] ?? '';

  String get notConfirmed => _localizedStrings['notConfirmed'] ?? '';

  String get client => _localizedStrings['client'] ?? '';

  String get time => _localizedStrings['time'] ?? '';

  String get come => _localizedStrings['come'] ?? '';

  String get nothingFoundPlaceholderTitle => _localizedStrings['nothingFoundPlaceholderTitle'] ?? '';

  String get nothingFoundPlaceholderDescription => _localizedStrings['nothingFoundPlaceholderDescription'] ?? '';

  String get disconnectPlaceholderTitle => _localizedStrings['disconnectPlaceholderTitle'] ?? '';

  String get disconnectPlaceholderDescription => _localizedStrings['disconnectPlaceholderDescription'] ?? '';

  String get somethingBrokePlaceholderTitle => _localizedStrings['somethingBrokePlaceholderTitle'] ?? '';

  String get somethingBrokePlaceholderDescription => _localizedStrings['somethingBrokePlaceholderDescription'] ?? '';

  String get sendError => _localizedStrings['sendError'] ?? '';

  String get appName => _localizedStrings['appName'] ?? '';

  String get version => _localizedStrings['version'] ?? '';

  String get createMeet => _localizedStrings['createMeet'] ?? '';

  String get settings => _localizedStrings['settings'] ?? '';

  String get support => _localizedStrings['support'] ?? '';

  String get signOut => _localizedStrings['signOut'] ?? '';

  String get handbook => _localizedStrings['dictionaries'] ?? '';

  String get camera => _localizedStrings['camera'] ?? '';

  String get logs => _localizedStrings['logs'] ?? '';

  String get noNetworkConnection => _localizedStrings['noNetworkConnection'] ?? '';

  String get somethingWrong => _localizedStrings['somethingWrong'] ?? '';

  String get enterPhoneNumber => _localizedStrings['enterPhoneNumber'] ?? '';

  String get enterPhoneNumberDescription => _localizedStrings['enterPhoneNumberDescription'] ?? '';

  String get unableToLogin => _localizedStrings['unableToLogin'] ?? '';

  String get writeToSupport => _localizedStrings['writeToSupport'] ?? '';

  String get continueString => _localizedStrings['continueString'] ?? '';

  String get enterCode => _localizedStrings['enterCode'] ?? '';

  String get sendCodeViaSms => _localizedStrings['sendCodeViaSms'] ?? '';

  String get sendCodeViaEmail => _localizedStrings['sendCodeViaEmail'] ?? '';

  String get memoryUsing => _localizedStrings['memoryUsing'] ?? '';

  String get enterLearningMode => _localizedStrings['enterLearningMode'] ?? '';

  String get exitLearningMode => _localizedStrings['exitLearningMode'] ?? '';

  String get learningMode => _localizedStrings['learningMode'] ?? '';

  String get photoCompression => _localizedStrings['photoCompression'] ?? '';

  String get transitionToTheNextFrame => _localizedStrings['transitionToTheNextFrame'] ?? '';

  String get photoAnglesGeneral => _localizedStrings['photoAnglesGeneral'] ?? '';

  String get runningCameraInDamage => _localizedStrings['runningCameraInDamage'] ?? '';

  String get focusOnTap => _localizedStrings['focusOnTap'] ?? '';

  String get storeFiles => _localizedStrings['storeFiles'] ?? '';

  String get storeLogs => _localizedStrings['storeLogs'] ?? '';

  String get phoneStorage => _localizedStrings['phoneStorage'] ?? '';

  String get logsHistory => _localizedStrings['logsHistory'] ?? '';

  String get whileHereEmpty => _localizedStrings['whileHereEmpty'] ?? '';

  String get photoAndVideo => _localizedStrings['photoAndVideo'] ?? '';

  String get gb => _localizedStrings['gb'] ?? '';

  String get mb => _localizedStrings['mb'] ?? '';

  String get kb => _localizedStrings['kb'] ?? '';

  String get clearStorage => _localizedStrings['clearStorage'] ?? '';

  String get clearLogs => _localizedStrings['clearLogs'] ?? '';

  String get oneDay => _localizedStrings['oneDay'] ?? '';

  String get threeDays => _localizedStrings['threeDays'] ?? '';

  String get oneWeek => _localizedStrings['oneWeek'] ?? '';

  String get oneMonth => _localizedStrings['oneMonth'] ?? '';

  String get always => _localizedStrings['always'] ?? '';

  String get lastUpdate => _localizedStrings['lastUpdate'] ?? '';

  String get updateHandbook => _localizedStrings['updateHandbook'] ?? '';

  String get updatingHandbook => _localizedStrings['updatingHandbook'] ?? '';

  String get download => _localizedStrings['download'] ?? '';

  String get cancel => _localizedStrings['cancel'] ?? '';

  String get inString => _localizedStrings['inString'] ?? '';

  String get panorama => _localizedStrings['panorama'] ?? '';

  String get externalPanorama => _localizedStrings['externalPanorama'] ?? '';

  String get innerPanorama => _localizedStrings['innerPanorama'] ?? '';

  String get uploadNewVideo => _localizedStrings['uploadNewVideo'] ?? '';

  String get takeNew360Photo => _localizedStrings['takeNew360Photo'] ?? '';

  String get instructionsForThe360Camera => _localizedStrings['instructionsForThe360Camera'] ?? '';

  String get cameraNotConnected => _localizedStrings['cameraNotConnected'] ?? '';

  String get cameraConnected => _localizedStrings['cameraConnected'] ?? '';

  String get connectToThetaWifi => _localizedStrings['connectToThetaWifi'] ?? '';

  String get save => _localizedStrings['save'] ?? '';

  String get recordVideo => _localizedStrings['recordVideo'] ?? '';

  String get selectFromGallery => _localizedStrings['selectFromGallery'] ?? '';

  String get clearlyUnderstood => _localizedStrings['clearlyUnderstood'] ?? '';

  String get file => _localizedStrings['file'] ?? '';

  String get operatingProcedureForPhoto => _localizedStrings['operatingProcedureForPhoto'] ?? '';

  String get textInstruction1 => _localizedStrings['textInstruction1'] ?? '';

  String get textInstruction2 => _localizedStrings['textInstruction2'] ?? '';

  String get textInstruction3 => _localizedStrings['textInstruction3'] ?? '';

  String get textInstruction4 => _localizedStrings['textInstruction4'] ?? '';

  String get textInstruction5 => _localizedStrings['textInstruction5'] ?? '';

  String get textInstruction6 => _localizedStrings['textInstruction6'] ?? '';

  String get textInstruction7 => _localizedStrings['textInstruction7'] ?? '';

  String get textInstruction8 => _localizedStrings['textInstruction8'] ?? '';

  String resendCodeBySmsAfter(String duration) => getFormattedString(
        _localizedStrings['resendCodeBySmsAfter'] ?? '',
        [duration],
      );

  String callAuthDescription(String phone) => getFormattedString(
        _localizedStrings['callAuthDescription'] ?? '',
        [phone],
      );

  String get emailAuthDescription => _localizedStrings['emailAuthDescription'] ?? '';

  String smsAuthDescription(String phone) => getFormattedString(
        _localizedStrings['smsAuthDescription'] ?? '',
        [phone],
      );

  String get search => _localizedStrings['search'] ?? '';

  String foundAppointments(String amount) => getFormattedString(
        _localizedStrings['foundAppointments'] ?? '',
        [amount],
      );

  String get searchHistory => _localizedStrings['searchHistory'] ?? '';

  String get empty => _localizedStrings['empty'] ?? '';

  String get vehicle => _localizedStrings['vehicle'] ?? '';

  String get generalInformation => _localizedStrings['generalInformation'] ?? '';

  String get equipment => _localizedStrings['equipment'] ?? '';

  String get legalCheck => _localizedStrings['legalCheck'] ?? '';

  String get panoramas => _localizedStrings['panoramas'] ?? '';

  String get video => _localizedStrings['video'] ?? '';

  String get mainPhotos => _localizedStrings['mainPhotos'] ?? '';

  String get damage => _localizedStrings['damage'] ?? '';

  String get dataSaved => _localizedStrings['dataSaved'] ?? '';

  String get noData => _localizedStrings['noData'] ?? '';

  String dataFilledOn(String progress) => getFormattedString(
        _localizedStrings['dataFilledOn'] ?? '',
        [progress],
      );

  String get inspectionData => _localizedStrings['inspectionData'] ?? '';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate(this.supportedLocales);

  final List<Locale> supportedLocales;

  @override
  bool isSupported(Locale locale) {
    return supportedLocales.firstWhereOrNull((Locale supportedLocale) => locale.languageCode == locale.languageCode) !=
        null;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
