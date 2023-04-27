import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Simple Nutrition'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildFoodTile('Chicken breast', 165),
                _buildFoodTile('Broccoli', 55),
                _buildFoodTile('Sweet potato', 103),
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
