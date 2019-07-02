import 'package:flutter/material.dart';
import 'expense_input.dart';

class ExpenseCategory extends StatefulWidget {
  @override
  _ExpenseCategoryState createState() => _ExpenseCategoryState();
}

class _ExpenseCategoryState extends State<ExpenseCategory> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 20.0,
      height:50,
      child: FlatButton(
        color: Colors.deepOrange,
        splashColor: null,//Colors.deepOrangeAccent,
        onPressed: () {},
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right:20),
              child: Icon(
                Icons.check_box,
                size: 30,
                color: Colors.white,
              ),
            ),
            Container(
              child: Text(
                  '지출명 입력',
                  style: TextStyle(fontSize: 20, color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}