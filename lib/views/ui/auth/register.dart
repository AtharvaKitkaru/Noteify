import 'package:flutter/material.dart';
import 'package:noteify/views/utils/auth_button.dart';
import 'package:noteify/views/utils/input_field.dart';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SingleChildScrollView(
          // padding: EdgeInsets.all(0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'NOTEIFY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 320.0,
                  child: Image.network(
                      'https://cdni.iconscout.com/illustration/premium/thumb/free-registration-desk-1886554-1598085.png'),
                ),
                Container(
                  constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                  padding: EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(children: <Widget>[
                    InputField(
                        placeholder: 'Enter your email', isPassword: false),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                        placeholder: 'Enter your password', isPassword: true),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                        placeholder: 'Re-enter your password',
                        isPassword: true),
                  ]),
                ),
                AuthButton(value: 'Register', location: '/'),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )),
                      RaisedButton(
                          onPressed: null,
                          child: Container(
                            child: Image.network(
                                'https://icons-for-free.com/iconfiles/png/512/g+google+google+2015+new+google+icon-1320190551260288871.png'),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                          ))
                    ],
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
