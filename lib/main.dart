import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/cart/cart_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(), // Provide CartBloc here
      child: MaterialApp(
        title: 'Food Delivery App',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
