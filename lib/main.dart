import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Nutrition',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _totalCalories = 0;

  void _updateTotalCalories(int calories) {
    setState(() {
      _totalCalories += calories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text('Simple Nutrition'),
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildFoodTile('Chicken breast', 165),
                  _buildFoodTile('Broccoli', 55),
                  _buildFoodTile('Sweet potato', 103),
                  _buildFoodTile('Avocado', 230),
                  _buildFoodTile('chapati', 70),
                  _buildFoodTile('rice(130g)', 130)
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total calories',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '$_totalCalories',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildFoodTile(String name, int calories) {
    return ListTile(
      title: Text(name),
      subtitle: Text('$calories calories'),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          _updateTotalCalories(calories);
        },
      ),
    );
  }
}
