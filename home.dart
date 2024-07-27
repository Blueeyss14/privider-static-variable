import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test_bool/pages/page1.dart';
import 'package:provider_test_bool/provider/bool_check_provider.dart';
import 'package:provider_test_bool/provider/int_check_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static int total = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _currentToggle = Provider.of<BoolCheckProvider>(context);
    final _currentToggleIndex = Provider.of<IntCheckProvider>(context);

    HomePage.total = 0;
    for (int i = 0; i < _currentToggleIndex.value.length; i++) {
      if (_currentToggle.checkToggle[i]) {
        HomePage.total += _currentToggleIndex.value[i] + 10;
      }
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Bool Provider"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < _currentToggle.checkToggle.length; i++)
            Center(
              child: Column(
                children: [
                  CupertinoSwitch(
                    value: _currentToggle.checkToggle[i],
                    onChanged: (value) {
                      setState(() {
                        _currentToggle.checkToggle[i] = value;
                      });
                    },
                  ),
                  if (_currentToggle.checkToggle[i])
                    Text("${_currentToggleIndex.value[i]} + 10")
                ],
              ),
            ),
          Text("${HomePage.total}")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyPage(),
              ));
        },
      ),
    );
  }
}
