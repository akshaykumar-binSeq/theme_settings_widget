import 'package:flutter/material.dart';
import 'package:theme_settings_widget/view/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'Primary color',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 30),
            Text(
              'Secondary color',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(height: 30),
             Text(
              'Tertiary color',
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
