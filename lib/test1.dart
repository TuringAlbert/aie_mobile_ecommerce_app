import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class MyClass {
  String myVariable = "Initial Value";

  void _changeMyVariable(String newValue) {
    myVariable = newValue;
    print("myVariable : $myVariable");
  }
}

class _FirstPageState extends State<FirstPage> {

  MyClass myClass = MyClass();

//   void noneFuntion (){}

  void callSetState(){
//     setState(noneFuntion);

    setState((){
      // action       
    });// ui update in setState()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('My Variable: ${myClass.myVariable}'),
            ElevatedButton(
              child: Text('Go to Second Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                        changeMyVariable: myClass._changeMyVariable,
                        callFirstPageSetState: callSetState
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final Function changeMyVariable;
  final Function callFirstPageSetState;

  SecondPage({required this.changeMyVariable, required this.callFirstPageSetState}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change My Variable'),
          onPressed: () {
            changeMyVariable("New Value");
            callFirstPageSetState();
//             setState(() {
//               // ui update of first page
//             });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
