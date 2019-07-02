import 'package:flutter/material.dart';

class ExpenseInput extends StatefulWidget {
  @override
  _ExpenseInputState createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  bool _inputlsValid = true;
  TextEditingController _texteditcontroller = new TextEditingController();
  String money = '';

  void _submission(num) {
    print('onSubmitted');
    //_texteditcontroller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:70, right:50, left:50, bottom: 50),
      color: Colors.deepOrangeAccent,
      child: TextField(
        controller: _texteditcontroller,
        style:TextStyle(fontSize: 15, color: Colors.white),
        onEditingComplete: (){
          money = _texteditcontroller.text;
          print('onEdittingComplete');
          print(_texteditcontroller.text);
        },
        onSubmitted: _submission,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Bumm Expense',
            labelStyle: TextStyle(fontSize: 23, color: Colors.white),
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
    );
  }
}
