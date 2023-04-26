import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/expenseItem.dart';
import '../provider/expenseProvider.dart';

class AddExpenseItemWidget extends StatefulWidget {
  const AddExpenseItemWidget({super.key});

  @override
  State<AddExpenseItemWidget> createState() => _AddExpenseItemWidgetState();
}

class _AddExpenseItemWidgetState extends State<AddExpenseItemWidget> {
  late final TextEditingController _titleController;
  late final TextEditingController _amountController;
  DateTime? _date = null;

  @override
  void initState() {
    _titleController = TextEditingController();
    _amountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime(2100))
        .then((value) {
      setState(() {
        _date = value;
      });
    });
  }

  void addItem() {
    final titleText = _titleController.text;
    final double amount = _amountController.text.isEmpty
        ? 0
        : double.parse(_amountController.text);
    final DateTime? date = _date;

    if (titleText.isNotEmpty && amount != 0 && date != null) {
      final newItem = ExpenseItem(title: titleText, amount: amount, date: date);
      context.read<ExpenseProvider>().add(newItem);

      Navigator.of(context).pop();
    } else {
      alert();
    }
  }

  void alert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("All fields must be filled!",
                  textAlign: TextAlign.center),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child: Center(child: Text("Back"))),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              maxLines: 1,
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              maxLines: 1,
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              ],
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _date == null
                        ? "No Date Chosen"
                        : "Picked date: " +
                            DateFormat.yMd().format(_date!).toString(),
                    style: TextStyle(
                        color: Color(0xFF828282),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand'),
                  ),
                ),
                TextButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addItem();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
