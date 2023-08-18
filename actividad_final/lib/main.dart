import 'package:actividad_final/pages/add_employ_page.dart';
import 'package:actividad_final/pages/edit_employ_page.dart';
import 'package:actividad_final/pages/pay_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:actividad_final/pages/add_pay_page.dart';
import 'package:actividad_final/pages/edit_pay_page.dart';
import 'package:actividad_final/pages/employ_page.dart';
import 'package:actividad_final/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const NavigationBar(),
        '/add': (context) => const AddPaysPage(),
        '/edit': (context) => const EditPaysPage(),
        '/employ': (context) => const Employ(),
        '/addEmploy': (context) => const AddEmploysPage(),
        '/editEmploy': (context) => const EditEmploysPage(),
        '/pay': (context) => const Pay(),
      },
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Home(),
    Employ(),
    Pay(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'PAYS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'EMPLEADOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake_rounded),
            label: 'MENÚ',
          ),
        ],
      ),
    );
  }
}
