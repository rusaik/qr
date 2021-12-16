import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr/pages/generate_code.dart';
import 'package:qr/pages/scan_code.dart';
import 'package:qr/widgets/my_btn.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime? _currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          handleWillPop(context);
          return false;
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text('QR APP'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                MyBtn(
                    btnName: 'Scan QR Code',
                    onPressed: () {
                      goToPage(GenerateCode());
                    }),
                MyBtn(
                    btnName: 'Generate QR Code',
                    onPressed: () {
                      goToPage(ScanCode());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleWillPop(BuildContext context) async {
    const _exitMsg = SnackBar(
        duration: Duration(seconds: 1000),
        content: Text(
          'Press again to exit',
          style: TextStyle(color: Colors.red),
        ));

    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        _exitMsg,
      );
      return Future.value(false);
    }
    SystemNavigator.pop(animated: true);
  }

  goToPage(Widget page) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: const Duration(milliseconds: 500),
            child: page));
  }
}
