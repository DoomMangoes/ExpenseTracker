import 'package:expensetracker/provider/expenseProvider.dart';
import 'package:expensetracker/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        ),
        // A widget which will be started on application startup
        home: const HomePage(),
      ),
    );
  }
}
