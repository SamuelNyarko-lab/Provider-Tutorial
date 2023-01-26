// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print('Building 1');
    return ChangeNotifierProvider(
        create: (context) => Data(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Consumer<Data>(
                builder: (context, value, child) {
                  return Text(
                    value.name,
                  );
                },
              ),
            ),
            body: SecondSceen(),
          );
        });
  }
}

class SecondSceen extends StatelessWidget {
  const SecondSceen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building 2');
    return Container(
      child: ThirdScreen(),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building 3');
    return Container(
      child: FourthScreen(),
    );
  }
}

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building 4');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   Provider.of<Data>(context).name,
            // ), //Can also be written as context.watch<Data>()

            //Rewriting to this to set rebuilding of specific widget with data change
            Consumer<Data>(
              builder: (context, value, child) {
                return Text(
                  value.name,
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                Provider.of<Data>(context, listen: false).changeName(
                    'Data Changed from button press'); //It has the listen to be false since the widget is not part of the current tree.Can also be written as context.read<Data>()
              },
              child: Text(
                'Change Data',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Data with ChangeNotifier {
  String name = 'Samuel';

  changeName(String name) {
    this.name = name;
    notifyListeners();
  }
}
