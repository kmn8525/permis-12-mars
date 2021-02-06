
import 'package:flutter/material.dart';

class genBill extends StatefulWidget {
  @override
  _genBillState createState() => _genBillState();
}

class _genBillState extends State<genBill> {
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        body: new Container(),
        floatingActionButton: new FloatingActionButton(
            onPressed: () {  },
            child:new Icon(Icons.add)
        )
    ) ;


  }

}

class dynamicWidget extends StatelessWidget {
  TextEditingController Product = new TextEditingController();
  TextEditingController Price = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
//      margin: new EdgeInsets.all(8.0),
      child:ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: new TextFormField(
                  controller: Product,
                  decoration: const InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                width: 100,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: new TextFormField(
                  controller: Price,
                  decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}
