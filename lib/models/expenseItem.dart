import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ExpenseItem {
  String title;
  double amount;
  DateTime date;
  final String formattedDate;
  final String uuid;

  ExpenseItem({required this.title, required this.amount, required this.date})
      : uuid = const Uuid().v4(),
        formattedDate = DateFormat.yMMMMd().format(date);

  @override
  bool operator ==(covariant ExpenseItem other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;
}
