import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Dropdown Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Dropdown Example'),
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isDropdownOpen = !_isDropdownOpen;
                });
              },
              child: Text('Setting'),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _isDropdownOpen ? 150 : 0,
              width: 200,
              child: _isDropdownOpen
                  ? ListView(
                      children: <Widget>[
                        _buildDropdownItem('My Account'),
                        _buildDropdownItem('Switch to Dark Moda'),
                        _buildDropdownItem('Logout'),
                      ],
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          _isDropdownOpen = false;
        });
        // Perform action based on selected option
        print('Selected: $text');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}
