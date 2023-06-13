import 'package:auto_route/auto_route.dart';
import 'package:first_may/app/presentation/screens/totals/bloc/totals_bloc.dart';
import 'package:first_may/app/presentation/widgets/others/screen_wrapper.dart';
import 'package:first_may/core/ui/widgets/base_bloc_listener.dart';
import 'package:first_may/di/app_locator.dart';
import 'package:first_may/model/sells.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TotalsScreen extends StatelessWidget implements AutoRouteWrapper {
  const TotalsScreen({super.key, required this.sells});

  final List<Sell> sells;

  @override
  Widget wrappedRoute(context) => BlocProvider(
        create: (context) => TotalsBloc(
          Locator.injection(),
          sells,
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) => BaseBlocListener<TotalsBloc, TotalsState>(
        child: ScreenWrapper(
          appBar: AppBar(),
          child: Container(
            color: Colors.blueGrey.withOpacity(0.3),
            child: BlocBuilder<TotalsBloc, TotalsState>(
              buildWhen: (previous, current) => previous.sellsByDays != current.sellsByDays,
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.sellsByDays.keys.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = state.sellsByDays.keys.elementAt(index);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.amber.withOpacity(0.6),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${state.sellsByDays.keys.elementAt(index)} --- ${getTodaySummary(state.sellsByDays[state.sellsByDays.keys.elementAt(index)]!)}P',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Wrap(
                          children: [
                            const SizedBox(height: 20),
                            for (var item in state.sellsByDaysAndWorkshops[key]!.keys)
                              buildCard(state.sellsByDaysAndWorkshops[key]![item]!),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      );

  Widget buildCard(List<Sell> sells) {
    double sum = 0.0;
    int count = 0;
    late Sell sell;
    for (var item in sells) {
      sell = item;
      sum += item.sum;
      count += 1;
    }
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            ' ${sell.person.idWorkshop.toString()} ',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Кол-во продаж: $count',
            style: const TextStyle(fontSize: 12),
          ),
          Text('${sum.toStringAsFixed(2)} P', style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    ));
  }

  String getTodaySummary(List<Sell> sells) {
    double sum = 0.0;
    for (var item in sells) {
      sum += item.sum;
    }
    return sum.toStringAsFixed(2);
  }
}
