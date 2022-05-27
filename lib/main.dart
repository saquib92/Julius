import 'package:flutter/material.dart';
import 'package:kabadonline/provider/data_provider.dart';
import 'package:kabadonline/view/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider.value(
        value: DataProvider(),
        child: MaterialApp(
          home: const HomePage(),
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
        ),
      ),
    );
