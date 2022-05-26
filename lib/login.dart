import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:he_store/categories.dart';
import 'package:he_store/register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _LoginformKey = GlobalKey<FormState>();
  _onPressed(context) async {
    print(emailController.text);
    print(passwordController.text);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoriesPage(emailController.text.trim())),
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Failed'),
                content: Text('Incorrect email or password.'),
                actions: <Widget>[
                  new ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.purple),
                      child: new Text(
                        'Close',
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'نفحة',
            style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Form(
              key: _LoginformKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Email Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.height / 3,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple),
                      ),
                      child: Text('Login'),
                      onPressed: () {
                        if (_LoginformKey.currentState!.validate()) {
                          _onPressed(context);
                        }
                      },
                    ),
                  ),
                ],
              )),
              SizedBox(height: 15,),
          Text('OR',style: TextStyle(fontSize: 20),),
          SizedBox(height: 13,),
          GestureDetector(
            child: Text('Register',style: TextStyle(fontSize: 20,color: Colors.purple),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
