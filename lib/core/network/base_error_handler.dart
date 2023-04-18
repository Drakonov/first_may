import 'package:first_may/core/domain/api_failure.dart';
import 'package:first_may/localization/app_localizations.dart';

class BaseErrorHandler {
  static String handleError(ApiFailure failure, AppLocalizations localization) {
    String handledError = '';
    if (failure is RequestFailure) {
      handledError = failure.message ?? '';
    } else if (failure is NetworkConnectionFailure) {
      handledError = localization.noNetworkConnection;
    } else {
      handledError = localization.somethingWrong;
    }
    return handledError;
  }
}
