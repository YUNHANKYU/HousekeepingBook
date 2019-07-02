import 'package:flutter/material.dart';
//import 'expense_input.dart';
import 'expense_category.dart';

class Expense extends StatefulWidget {
  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  bool _inputlsValid = true;
  TextEditingController _texteditcontroller = new TextEditingController();
  String money = '';

  void _submission(num) {
    print('onSubmitted');
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Column(
        children: <Widget>[
         _expenseInput(context), // Input widget
         ExpenseCategory(), // Category class
        ],
      ),
      Container(
        padding: EdgeInsets.only(top:100, right:50, left:50),
        color: Colors.cyan,
        child: Column(
          children:[
            Text(
              "Hi",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ]
        )
      ),
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
            bottom: new TabBar(
              tabs: _kTabs,
              ),
            ),

          body: SafeArea(
            child: Center(
                //padding: EdgeInsets.symmetric(horizontal: 50.0),
                //color: Colors.limeAccent,
                child: Column(
                  children:<Widget>[
                    Flexible(
                        child: Center(
                          child: TabBarView(
                            children:_kTabPages,
                          ),
                        )
                    )
                  ],
                )
            ),
          ),
        )
    );
  }

  Widget _expenseInput(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              right:MediaQuery.of(context).size.width*0.15,
              top:MediaQuery.of(context).size.height*0.075
          ),
          //decoration: BoxDecoration(color: Colors.blue[500]),
          color: Colors.deepOrangeAccent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.14,
          child: Text('KRW',
            style: TextStyle(fontSize: 30, color: Colors.white),
            textDirection: TextDirection.rtl,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right:60, left:60, bottom: 50),
          color: Colors.deepOrangeAccent,
          child: TextField(
            controller: _texteditcontroller,
            textDirection: TextDirection.rtl,
            style:TextStyle(fontSize:30, color:Colors.white, letterSpacing:2),
            onEditingComplete: (){
              money = _texteditcontroller.text;
              print('onEditingComplete');
              print(_texteditcontroller.text);
            },
            onSubmitted: _submission,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                //labelText: 'KRW',
                //contentPadding: EdgeInsets.only(left:130),
                //labelStyle: TextStyle(fontSize: 23, color: Colors.white,),
                icon: Icon(
                    Icons.attach_money, size: 40, color: Colors.white),
                errorText: _inputlsValid ? null : 'Pleas enter an integer!',
                focusedBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Colors.limeAccent)),
                helperText: 'Enter the Expenses',
                suffix: IconButton(
                    icon:Icon(Icons.close, color: Colors.white),
                    onPressed:(){
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _texteditcontroller.clear();
                    })
            ),
          ),
        ),
      ],
    );
  }
}
