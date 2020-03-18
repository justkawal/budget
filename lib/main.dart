import 'package:budget/container.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xFFF0EFF4),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map map = Map<IconData, Color>.from({
    Icons.library_books: Color(0xFFCECDD2),
    Icons.folder_open: Colors.black,
    Icons.sync: Color(0xFFCECDD2),
    Icons.show_chart: Color(0xFFCECDD2)
  });

  Widget rowDesign(String text1, String text2) {
    return customContainer(
      height: 50,
      radius: 25,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 11.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Text(
                text1,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFCFCED3),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 1,
                color: Color(0xFFCFCED3),
                margin: EdgeInsets.symmetric(horizontal: 12),
              ),
              Text(
                text2,
                style: TextStyle(fontSize: 23, color: Color(0xFFCFCED3)),
              ),
            ]),
            Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Color(0xFFCFCED3),
            ),
          ],
        ),
      ),
    );
  }

  Widget card({@required String text1, String text2, int stripColor}) {
    return Expanded(
      child: customContainer(
        height: 120,
        padding: EdgeInsets.fromLTRB(19, 17, 0.8, 10),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        text1,
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  stripColor != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: 35,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Color(stripColor),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)),
                              ),
                            )
                          ],
                        )
                      : Row(),
                ],
              ),
              Text(text2 == null ? "" : text2, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        radius: 17,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Budget",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              rowDesign("Wallets", "150 400\$"),
              SizedBox(height: 33),
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          card(
                              text1: "Credit Card",
                              text2: "100 000\$",
                              stripColor: 0xFFF6CBE6),
                          SizedBox(width: 30),
                          card(
                            text1: "Bank Deposit",
                            text2: "50 000\$",
                          ),
                        ],
                      ),
                      SizedBox(height: 33),
                      Row(
                        children: <Widget>[
                          card(
                              text1: "Cash Money",
                              text2: "400\$",
                              stripColor: 0xFFF8EB7B),
                          SizedBox(width: 30),
                          Expanded(child: Container()),
                        ],
                      ),
                      SizedBox(height: 33),
                      rowDesign("Savings", "200 000\$"),
                      SizedBox(height: 33),
                      Row(
                        children: <Widget>[
                          card(
                              text1: "House",
                              text2: "100 000\$",
                              stripColor: 0xFFAEF2DB),
                          SizedBox(width: 30),
                          card(
                            text1: "Travel",
                            text2: "100 000\$",
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: map.keys
                              .toList()
                              .asMap()
                              .entries
                              .map((MapEntry map1) {
                            return customContainer(
                              width: 66,
                              height: 66,
                              radius: 15,
                              child: Center(
                                child: Icon(map1.value,
                                    color: map[map1.value], size: 30),
                              ),
                            );
                          }).toList()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
