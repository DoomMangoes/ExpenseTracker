import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/expenseItem.dart';
import '../provider/expenseProvider.dart';
import 'expenseBarWidget.dart';

class ExpenseChartWidget extends StatelessWidget {
  const ExpenseChartWidget({super.key});

  double getTotalDailyExpenses(
      UnmodifiableListView<ExpenseItem> items, int dayOffset) {
    double sum = 0;

    List<ExpenseItem> dayItems = items
        .where((item) =>
            DateFormat.yMd().format(item.date).toString() ==
            DateFormat.yMd()
                .format(DateTime.now().subtract(Duration(days: dayOffset)))
                .toString())
        .toList();

    if (dayItems.isNotEmpty) {
      for (int i = 0; i < dayItems.length; i++) {
        sum += dayItems[i].amount;
      }
    }

    return sum;
  }

  double getTotalWeeklyExpenses(UnmodifiableListView<ExpenseItem> items) {
    double sum = 0;

    for (int c = 0; c < 7; c++) {
      sum += getTotalDailyExpenses(items, c);
    }

    return sum;
  }

  double getBarValue(double dailyTotal, double weeklyTotal) {
    return weeklyTotal != 0 ? dailyTotal / weeklyTotal : 0;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    final UnmodifiableListView<ExpenseItem> expenseItems = provider.items;

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
                double dailyTotal = getTotalDailyExpenses(expenseItems, index);
                double weeklyTotal = getTotalWeeklyExpenses(expenseItems);
                return ExpenseBarWidget(
                  dayOffset: index,
                  barValue: getBarValue(dailyTotal, weeklyTotal),
                  dayTotalAmount: (dailyTotal),
                );
              }),
        ),
      ),
    );
  }
}
