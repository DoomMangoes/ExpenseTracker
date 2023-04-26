import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseBarWidget extends StatelessWidget {
  final int dayOffset;

  const ExpenseBarWidget({super.key, required this.dayOffset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FittedBox(
              child: Text(
                "₱1750.99",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
              height: 70,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70 * .5,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ],
              )),
          Text(
            DateFormat.E()
                .format(DateTime.now().subtract(new Duration(days: dayOffset))),
          )
        ],
      ),
    );
  }
}
