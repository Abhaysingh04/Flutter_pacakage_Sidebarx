import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Music Recommendation app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SidebarXController _sidebarController; // Declare a sidebar controller

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _sidebarController = SidebarXController(selectedIndex: 0); // Provide selectedIndex
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Replace body with SidebarX widget
      body: SidebarX( // Remove const as controller cannot be used in const constructor
        controller: _sidebarController, // Provide the controller
        items: const [ // SidebarX items
          SidebarXItem(icon: Icons.home, label: 'Home'), // Changed label to string
          SidebarXItem(icon: Icons.search, label: 'Search'), // Changed label to string
          SidebarXItem(icon: Icons.settings, label: 'Settings'), // Changed label to string
          SidebarXItem(icon: Icons.dark_mode, label: 'Dark Mode'), // Changed label to string
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
