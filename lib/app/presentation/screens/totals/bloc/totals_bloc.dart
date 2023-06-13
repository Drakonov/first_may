import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:first_may/model/sells.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:first_may/app/navigation/app_router.dart';
import 'package:first_may/core/bloc/base_bloc_state.dart';
import 'package:first_may/core/bloc/bloc_action.dart';
import 'package:jiffy/jiffy.dart';

part 'totals_bloc.freezed.dart';

part 'totals_event.dart';

part 'totals_state.dart';

class TotalsBloc extends Bloc<TotalsEvent, TotalsState> {
  TotalsBloc(
    this._appRouter,
    this.sells,
  ) : super(TotalsState()) {
    on<_Init>(_init);
    add(const TotalsEvent.init());
  }

  final AppRouter _appRouter;
  final List<Sell> sells;

  FutureOr<void> _init(
    _Init event,
    Emitter<TotalsState> emit,
  ) async {
    emit(state.copyWith());
    Map<String, List<Sell>> map = {};
    Map<String, Map<int, List<Sell>>> mapFiltered = {};
    for (var item in sells.reversed) {
      if (map.keys.contains(Jiffy.parseFromDateTime(item.dateSell).yMd)) {
        map.update(
          Jiffy.parseFromDateTime(item.dateSell).yMd,
          (value) {
            value.add(item);
            return value;
          },
        );
      } else {
        map[Jiffy.parseFromDateTime(item.dateSell).yMd] = [item];
      }
    }
    print(map);
    for (var key in map.keys) {
      for (var item in map[key]!) {
        if (mapFiltered.keys.contains(Jiffy.parseFromDateTime(item.dateSell).yMd) &&
            mapFiltered[key]!.keys.contains(item.person.idWorkshop)) {
          mapFiltered[key]![item.person.idWorkshop]!.add(item);
        } else if (mapFiltered.keys.contains(Jiffy.parseFromDateTime(item.dateSell).yMd) == true &&
            mapFiltered[key]!.keys.contains(item.person.idWorkshop) == false) {
          mapFiltered.update(key, (value) {
            value[item.person.idWorkshop] = [item];
            return value;
          });
        } else if (mapFiltered.keys.contains(Jiffy.parseFromDateTime(item.dateSell).yMd) == false) {
          Map<int, List<Sell>> innerMap = {};
          innerMap[item.person.idWorkshop] = [item];
          mapFiltered[key] = innerMap;
          print('mapFiltered[key]');
          print(mapFiltered[key]);
        }
      }
    }
    print('mapFiltered');
    print(mapFiltered);
    for (var key in mapFiltered.keys) {
      print(mapFiltered[key]);
    }
    emit(state.copyWith(sellsByDays: map, sellsByDaysAndWorkshops: mapFiltered));
    //todo add action
    //_appRouter.replace(const AuthorizationScreen());
  }
}
