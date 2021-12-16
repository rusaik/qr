import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _exitMsg = const SnackBar(
      duration: Duration(seconds: 1000),
      content: Text(
        'Press again to exit',
        style: TextStyle(color: Colors.red),
      ));
  DateTime? _currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
      ),
    );
  }

  handleWillPop(BuildContext context) async {
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
}
