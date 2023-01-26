import 'package:flutter/material.dart';
import 'package:tuto_app/features/joke/presentation/pages/categories_page.dart';
import 'package:tuto_app/injection_container/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const CategoriesPage(),
    );
  }
}
