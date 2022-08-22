import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

import 'main1.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FlutterOverboardPage(),
    );
  }
}
/*
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showTutorial(context));

    void _showTutorial(BuildContext context) async {
      final pref = await SharedPreferences.getInstance();

      if (pref.getBool('isAlreadyFirstLaunch') != true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FlutterOverboardPage(),
            fullscreenDialog: true,
          ),
        );
        pref.setBool('isAlreadyFirstLaunch', true);
      }
    }
  }
}

*/

class FlutterOverboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterOverboardPage'),
      ),
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          // when user select SKIP
          Navigator.pop(context);
        },
        finishCallback: () {
          // when user select NEXT
          Navigator.pop(context);


          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SecondPage();
              },
            ),
          );
        }
      ),
    );
  }

  final pages = [
    PageModel(
        color: const Color(0xFF95cedd),
        imageAssetPath: 'assets/0.png',
        title: '文字を表示できます',
        body: '細かい説明をbodyに指定して書くことが出来ます',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/1.png',
        title: '左右のスワイプ',
        body: 'NEXTを押さなくても左右にスワイプすることで画面の切替が出来ます',
        doAnimateImage: true),
    PageModel.withChild(
        child: Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Text(
              "さあ、始めましょう",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            )),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
  ];
}
