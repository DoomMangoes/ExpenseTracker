import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/expenseProvider.dart';
import '../models/expenseItem.dart';

class ExpenseItemWidget extends StatelessWidget {
  final ExpenseItem expenseItem;
  const ExpenseItemWidget({super.key, required this.expenseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
      ),
      height: 70,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(right: 1),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  "₱" + expenseItem.amount.toString(),
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                expenseItem.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                DateFormat.yMMMMd().format(expenseItem.date),
                style: TextStyle(
                  color: Color(0xFF828282),
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  context.read<ExpenseProvider>().remove(expenseItem);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
