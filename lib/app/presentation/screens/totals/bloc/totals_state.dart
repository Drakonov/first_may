part of 'totals_bloc.dart';

@freezed
class TotalsState extends BaseBlocState with _$TotalsState {
  factory TotalsState({
    BlocAction? action,
    @Default({}) Map<String, List<Sell>> sellsByDays,
    @Default({}) Map<String, Map<int, List<Sell>>> sellsByDaysAndWorkshops,
  }) = _StartState;
}