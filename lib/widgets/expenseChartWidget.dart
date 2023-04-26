import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expenseItem.dart';
import '../provider/expenseProvider.dart';
import 'expenseBarWidget.dart';

class ExpenseChartWidget extends StatelessWidget {
  const ExpenseChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseItems = context.select<ExpenseProvider, List<ExpenseItem>>(
      (provider) => provider.items,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * .90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: ListView.separated(
              shrinkWrap: true,
              reverse: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(1),
              separatorBuilder: (context, index) => Container(width: 1),
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return ExpenseBarWidget(
                  dayOffset: index,
                );
              }),
        ),
      ),
    );
  }
}
