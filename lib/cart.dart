import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:he_store/itemsmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var database = FirebaseFirestore.instance.collection('cart').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => ItemModel.fromMap(doc.data())).toList());
  var total = 0;

  var delivery = 15;

  int totalamount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.purple,
              ))),
      body: ListView(
        children: [
          Center(
            child: Text(
              'قائمة المشتريات',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          StreamBuilder<List<ItemModel>>(
              stream: database,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.active) {
                  //print(snapshot.data!);
                  return ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: snapshot.data!.map(builditem).toList());
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
          StreamBuilder<List<ItemModel>>(
              stream: database,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.active) {
                  snapshot.data!
                      .toList()
                      .forEach((item) => total = total + item.price);
                  print(snapshot.data!);
                  totalamount = delivery + total;
                  return Card(
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Payment summary',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text(
                                'Subtotal',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Text(
                              '${total.toString()} \$',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text(
                                'Delivery fee',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Text(
                              '${delivery.toString()} \$',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                          Divider(),
                          Row(children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text(
                                'Total amount',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${totalamount.toString()} \$',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Divider(
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  );
                  /*ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: snapshot.data!.map(builditem).toList());*/

                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }

  Widget builditem(ItemModel item) => Card(
        child: ListTile(
          leading: Image.asset(
            item.image,
            width: 100,
          ),
          title: Text(item.title),
          subtitle:
              Text('Size : ${item.size}\nPrice : ${item.price.toString()} \$'),
          trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('حذف'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("cart")
                    .doc(item.title)
                    .delete();
              }),
        ),
      );
}

/*import 'package:flutter/material.dart';
import 'package:he_store/itemsmodel.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: StreamBuilder<List<ItemModel>>(
        stream: null,
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.active){
          return ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              Row(
                children: snapshot.data!.map(builditem).toList());
              )
            ],
          );}
        }
      ),
    );
    
  }
  Widget builditem(ItemModel item) =>Card(
                child: Column(
                  children: [
                    Image.asset('assets/1.jpeg'),
                    Text('data'),
                    Text('data')
                  ],
                ),
              )
}
*/