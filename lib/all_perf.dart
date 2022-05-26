import 'package:flutter/material.dart';
import 'item_details.dart';

class AllPerf extends StatelessWidget {
  Map map;
  AllPerf(this.map);

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
        child: ListView(
          children: [
            Center(
              child: const Text(
                'قائمة العطور',
                style: TextStyle(color: Colors.purple, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: map.length - 1,
              itemBuilder: (BuildContext context, int index) {
                var value = map.values;

                return ListView(
                    shrinkWrap: true,
                    children: value.map((entry) {
                      var w = ListTile(
                        isThreeLine: true,
                        title: Text(entry[index]['title'].toString()),
                        subtitle: Text(
                            'Size : ${entry[index]['size']}\nPrice : ${entry[index]['price']}'),
                        leading: SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 5,
                            child: Image.asset(entry[index]['image'])),
                        trailing: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.purple),
                            ),
                            child: Text('شراء'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BuyPage(entry, index)),
                              );
                            }),
                      );

                      return w;
                    }).toList());
              },
            )
          ],
        ),
      ),
    );
  }
}
