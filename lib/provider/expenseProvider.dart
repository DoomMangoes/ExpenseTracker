import 'package:flutter/material.dart';
import '../models/expenseItem.dart';
import 'dart:collection';

class ExpenseProvider extends ChangeNotifier {
  final List<ExpenseItem> _items = [];

  //Read only view
  UnmodifiableListView<ExpenseItem> get items => UnmodifiableListView(_items);

  void add(ExpenseItem expenseItem) {
    _items.add(expenseItem);
    notifyListeners();
  }

  void remove(ExpenseItem expenseItem) {
    _items.remove(expenseItem);
    notifyListeners();
  }
}
