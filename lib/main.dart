import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Expanded(child: Container()),
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: screenSize.width / 2,
                  height: screenSize.width / 2,
                  child: const Placeholder(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: SizedBox(
                        width: screenSize.width / 4,
                        child: Text(
                          '** ℃',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: SizedBox(
                        width: screenSize.width / 4,
                        child: Text(
                          '** ℃',
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ]),
          Expanded(
              child: Column(children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenSize.width / 4,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Close'),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 4,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Reload'),
                  ),
                ),
              ],
            ),
          ]))
        ])));
  }
}
