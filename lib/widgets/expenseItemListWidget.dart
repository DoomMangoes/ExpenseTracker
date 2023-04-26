import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/expenseProvider.dart';
import '../models/expenseItem.dart';
import 'expenseItemWidget.dart';

class ExpenseItemListWidget extends StatelessWidget {
  const ExpenseItemListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final expenseItems = context.select<ExpenseProvider, List<ExpenseItem>>(
      (provider) => provider.items,
    );

    return expenseItems.isEmpty
        ? Column(
            children: [
              const Text(
                "No transactions added yet!",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 200,
                child: const Image(
                  image: AssetImage("assets/images/waiting.png"),
                ),
              ),
            ],
          )
        : ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: expenseItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpenseItemWidget(
                expenseItem: expenseItems[index],
              );
            });
  }
}
