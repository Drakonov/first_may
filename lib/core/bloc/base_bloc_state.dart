import 'bloc_action.dart';

abstract class BaseBlocState {
  const BaseBlocState();

  BlocAction? get action;
}
