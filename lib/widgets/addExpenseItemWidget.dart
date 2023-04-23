import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddExpenseItemWidget extends StatefulWidget {
  const AddExpenseItemWidget({super.key});

  @override
  State<AddExpenseItemWidget> createState() => _AddExpenseItemWidgetState();
}

class _AddExpenseItemWidgetState extends State<AddExpenseItemWidget> {
  late final TextEditingController _titleController;
  late final TextEditingController _amountController;

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
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
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
                Text(
                  "Picked date:",
                  style: TextStyle(
                      color: Color(0xFF828282),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand'),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
