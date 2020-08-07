import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './pages/Button/button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  int content;
  bool navigation = false;
  bool dataEntry = false;
  bool dataDisplay = false;
  bool feedback = false;
  bool combination = false;
  bool gesture = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  dataEntry = !dataEntry;
                });
              },
              children: [
                ExpansionPanel(
                    headerBuilder: (_, __) {
                      return Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                        child: Text('数据录入 Data Entry'),
                      );
                    },
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return PageButton();
                            }));
                          },
                          child: ListTile(
                            title: Text(
                              'Button 按钮',
                              style: TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                            trailing: Container(
                              child: Icon(Icons.chevron_right),
                            ),
                          ),
                        )
                      ],
                    ),
                    isExpanded: dataEntry)
              ],
            )
          ],
        ));
  }
}
