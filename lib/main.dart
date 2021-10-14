import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

//class my app
class Myapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Start(),
    );
  }
}

//scaffold widghet
class Start extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Average Calculator',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ))),
      body: Avg(),
    );
  }
}

class Avg extends StatefulWidget {
  State<StatefulWidget> createState() {
    return AvgState();
  }
}

class AvgState extends State<Avg> {
  TextEditingController num_1 = new TextEditingController();
  TextEditingController num_2 = new TextEditingController();
  TextEditingController res = new TextEditingController();
  //operation fun

  void oper() {
    if (num_1.text.trim().isNotEmpty && num_2.text.trim().isNotEmpty) {
      final firstValue = double.parse(num_1.text);
      final secondValue = double.parse(num_2.text);
      res.text = ((firstValue + secondValue) / 2).toString();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //main container
      body: Container(
        color: Colors.yellow[700],
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //first text filed
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: ("Enter the first number "),
                  labelStyle: (TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
                  prefixIcon: Icon(
                    Icons.looks_one,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black45,
                        width: 3,
                      )),
                ),
                keyboardType: TextInputType.number,
                controller: num_1,
                onChanged: (value) {
                  oper();
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: ("Enter the second number "),
                  labelStyle: (TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
                  prefixIcon: Icon(
                    Icons.looks_two,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black45,
                        width: 3,
                      )),
                ),
                keyboardType: TextInputType.number,
                controller: num_2,
                onChanged: (value) {
                  oper();
                },
              ),
            ),
          ],
        ),
      ),
      //button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              //the box
              return AlertDialog(
                content: Text(
                  res.text,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                backgroundColor: Colors.black,
              );
            },
          );
          // to make the textfield empty
          setState(() {
            num_2.text = '';
            num_1.text = '';
          });
        },
        child: Icon(Icons.calculate),
        backgroundColor: Colors.black,
      ),
    );
  }
}
