import 'package:flutter/material.dart';
import 'package:sider/side_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            SideDrawer(
              headerWidget: SizedBox(),
              backgroundColor: const Color.fromARGB(255, 181, 214, 240),
            ),
            Expanded(
              child: Center(
                child: ValueListenableBuilder<int>(
                  valueListenable: SideDrawer.activeTabNotifier,
                  builder: (context, activeTab, child) {
                    return Text(
                      'Selected Tab: $activeTab',
                      style: TextStyle(fontSize: 24),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
