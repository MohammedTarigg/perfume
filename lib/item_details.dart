import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:he_store/firebase_options.dart';
import 'package:he_store/itemsmodel.dart';
import 'package:toast/toast.dart';

class BuyPage extends StatefulWidget {
  Map map;
  int index;
  BuyPage(this.map, this.index);

  @override
  State<BuyPage> createState() => _BuyPageState(map, index);
}

class _BuyPageState extends State<BuyPage> {
  Map map;
  int index;
  _BuyPageState(this.map, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: (Icon(Icons.arrow_back)),
          color: Colors.purple,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(map[index]['image']),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Brand : ',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                  Text(map[index]['title'], style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Size : ',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                  Text((map[index]['size']).toString(),
                      style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Price : ',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                  Text((map[index]['price']).toString(),
                      style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.height / 4,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                  child:
                      Text('إضافة الى السلة', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    posttofirebase(map[index]['title'], map[index]['price'],
                        map[index]['size'], map[index]['image']);
                        showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text('أضافة'),
              content: new Text('تمت إضافة المنتج إلى سلة المشتريات'),
              actions: <Widget>[
                new ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                    child: new Text(
                      'إغلاق',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

posttofirebase(title, price, size, image) async {
  var database = FirebaseFirestore.instance;
  var ITEMMODEL =
      ItemModel(title: title, price: price, size: size, image: image);
  ITEMMODEL.title = title;
  ITEMMODEL.price = price;
  ITEMMODEL.size = size;
  ITEMMODEL.image = image;
  await database.collection('cart').doc(title).set(ITEMMODEL.toMap());

  print('item added :)');
}
