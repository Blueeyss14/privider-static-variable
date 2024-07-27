import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test_bool/home/home.dart';
import 'package:provider_test_bool/provider/bool_check_provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleActived = Provider.of<BoolCheckProvider>(context);
    bool noData = toggleActived.checkToggle.every((element) => !element);
    final total = HomePage.total;
    return Scaffold(
      appBar: AppBar(),
      body: noData
          ? const Center(child: Text("No Data"))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      for (int i = 0; i < toggleActived.checkToggle.length; i++)
                        if (toggleActived.checkToggle[i])
                          Text("Cupertino ${i + 1} is active"),
                    ],
                  ),
                  Text("$total")
                ],
              ),
            ),
    );
  }
}
