import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:he_store/all_perf.dart';
import 'package:he_store/cart.dart';
import 'package:he_store/items_list.dart';
import 'package:he_store/login.dart';

class CategoriesPage extends StatelessWidget {
  String email;
  CategoriesPage(this.email);

  @override
  Widget build(BuildContext context) {
    Map map = {
      'men': {
        0: {
          'image': 'assets/3.jpeg',
          'title': 'Dior',
          'price': 30,
          'size': 100
        },
        1: {
          'image': 'assets/2.jpeg',
          'title': 'Versacci',
          'price': 25,
          'size': 120
        }
      },
      'women': {
        0: {
          'image': 'assets/1.jpeg',
          'title': 'Black Opium',
          'price': 32,
          'size': 80
        },
        1: {
          'image': 'assets/4.jpeg',
          'title': 'Million',
          'price': 28,
          'size': 100
        }
      },
      'arabic': {
        0: {
          'image': 'assets/5.jpeg',
          'title': 'Good Girl',
          'price': 50,
          'size': 90
        },
        1: {
          'image': 'assets/6.jpeg',
          'title': 'Jadore',
          'price': 45,
          'size': 150
        }
      }
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.purple),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'تسوق حسب الفئة',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView
                .count(mainAxisSpacing: 30, crossAxisCount: 2, children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Items_list(map['men'])),
                  );
                },
                child: Card(
                    child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        child: Image.asset('assets/m1.jpg')),
                    Text('عطور رجالية',
                        style: TextStyle(color: Colors.purple, fontSize: 25))
                  ],
                )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Items_list(map['women'])),
                  );
                },
                child: Card(
                    child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      child: Image.asset('assets/m2.png'),
                    ),
                    Text('عطور نسائية',
                        style: TextStyle(color: Colors.purple, fontSize: 25))
                  ],
                )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Items_list(map['arabic'])),
                  );
                },
                child: Card(
                    child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      child: Image.asset('assets/m3.png'),
                    ),
                    Text('عطور عربية',
                        style: TextStyle(color: Colors.purple, fontSize: 25))
                  ],
                )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllPerf(map)));
                },
                child: Card(
                    child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      child: Image.asset('assets/m4.webp'),
                    ),
                    Text(' جميع العطور',
                        style: TextStyle(color: Colors.purple, fontSize: 25))
                  ],
                )),
              ),
            ]),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Center(
                    child: Text(
                  email,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ))),
            ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.purple,
              ),
              title: const Text(
                'سلة المشتريات',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            ListTile(
                title:
                    const Text('تسجيل الخروج ', style: TextStyle(fontSize: 20)),
                leading: Icon(
                  Icons.account_box,
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
