import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const _homeIndex = 0;
const _vacationIndex = 1;
const _accountIndex = 2;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
    BottomNavigationBarItem(
        icon: Icon(Icons.airplanemode_active), title: Text("Vacation")),
    BottomNavigationBarItem(
        icon: Icon(Icons.supervisor_account), title: Text("Account"))
  ];

  int _counter = 0;
  int _selectedIndex = 0;
  bool _switchValue = false;

  @override
  build(BuildContext context) => DefaultTabController(
        length: navItems.length,
        child: Scaffold(
          appBar: AppBar(
            title: Row(children: [
              Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: navItems[_selectedIndex].icon as Icon),
              Text(
                  (navItems[_selectedIndex].title as Text).data + " $_counter"),
            ]),
            centerTitle: true,
          ),
          body: _selectedTab(),
          bottomNavigationBar: BottomNavigationBar(
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              items: navItems),
          floatingActionButton: FloatingActionButton(
            onPressed: _neverSatisfied,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      );

  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _decrementCounter() => setState(() {
        _counter++;
      });

  _toggleSwitch(bool value) => setState(() {
        _switchValue = value;
      });

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _neverSatisfied() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Increment'),
              onPressed: () {
                _incrementCounter();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Decrement'),
              onPressed: () {
                _decrementCounter();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Increment 2'),
              onPressed: () {
                _incrementCounter();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _selectedTab() {
    if (_selectedIndex == _homeIndex) {
      return _homeTab();
    }
    return _vacationTab();
  }

  _homeTab() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoSwitch(
              value: _switchValue,
              onChanged: _toggleSwitch,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      );

  _vacationTab() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: _switchValue,
              onChanged: _toggleSwitch,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      );
}
