import 'package:flutter/material.dart';

class Expanse extends StatefulWidget {
  @override
  _ExpanseState createState() => _ExpanseState();
}

class _ExpanseState extends State<Expanse> {
  bool _inputlsValid = true;
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(
          child: TextField(
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
              labelText: 'Input Your Expense',
              errorText: _inputlsValid ? null : 'Pleas enter an integer!',
              border: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(10.0)),
                //borderSide:  BorderSide(width: 0.5, style: BorderStyle.solid)
                gapPadding: 20.0
              )

            )
          )


      ),
      Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.teal)),
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon (Icons.attach_money), text: 'price',

      ),
      Tab(icon: Icon(Icons.get_app), text: 'request'),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('지출 입력')
          ),
          backgroundColor: Colors.deepOrangeAccent,
          bottom: TabBar(
            tabs:_kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      )
    );
  }
}

//return Scaffold(
//appBar: AppBar(
//title: Center(
//child: Text("지출 내용 등록"),
//)
//),
//body: Container(
//
//
//),
//);