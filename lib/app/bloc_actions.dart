import 'package:first_may/core/bloc/bloc_action.dart';

class ShowLearningModeModal extends BlocAction {
  ShowLearningModeModal({
    required this.learningModeEnabled,
  });

  final bool learningModeEnabled;
}
