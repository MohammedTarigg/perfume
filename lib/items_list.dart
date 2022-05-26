import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:he_store/all_perf.dart';
import 'package:he_store/item_details.dart';

class Items_list extends StatelessWidget {
  Map map;
  Items_list(this.map);

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'قائمة العطور',
              style: TextStyle(color: Colors.purple, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: map == null ? 0 : map.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        map[index]['title'],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                        'Size : ${map[index]['size']} ml\nPric : ${map[index]['price']} \$',
                        style: TextStyle(fontSize: 15)),
                    isThreeLine: true,
                    leading: SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Image.asset(map[index]['image']),
                    ),
                    trailing: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.purple),
                        ),
                        child: Text('شراء',style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuyPage(map, index)),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
