import 'package:flutter/material.dart';
import './main.dart';
import 'mysql.dart';
import 'dart:convert';
// ignore_for_file: prefer_const_constructors

class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:const LoginScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
class LoginScreen extends StatefulWidget {
const LoginScreen({Key? key, required this.title}) : super(key: key);
final String title;
@override
State<LoginScreen> createState() => _LoginState();
}



class _LoginState extends State<LoginScreen>{
  bool result=false;
  final password = TextEditingController();
   final account = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellow,Colors.white70,Colors.lightGreen, Colors.teal]
          )
      ),
        child:Center(
        child:Column(
          children:<Widget>[
            //SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child:Container(
                width: 200,
                height: 200,
                child: Image.asset('assets/dyu.jpg'),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: 350,
              child:TextField(
                //style: TextStyle(fontSize: 22.0, color: Color(0xFF00BFA5)),
                autofocus: true,
                controller: account,
                decoration: InputDecoration(
                    labelText: "User name",
                    hintText: "輸入學號",
                    hintStyle:TextStyle(color:  Colors.blueGrey[600], fontSize: 18,fontStyle: FontStyle.italic) ,
                    labelStyle: TextStyle(color: Colors.blueGrey[600], fontSize: 18,fontWeight: FontWeight.bold),
                    filled: true, fillColor: Colors.blueGrey.withOpacity(0.3),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Color(0xFF80CBC4).withOpacity(0.4), width: 3.0)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide:BorderSide(color:Color(0xFF80CBC4))),
                    prefixIcon: Icon(Icons.person,color: Colors.blueGrey[600] )
                ),
              ),
              ),
            ),
            SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            width: 350,
           child:TextField(
             controller: password,
              decoration: InputDecoration(
              labelText: "Password",
              hintText: "輸入密碼",
                  hintStyle:TextStyle(color:  Colors.blueGrey[600], fontSize: 18,fontStyle: FontStyle.italic) ,
                  labelStyle: TextStyle(color: Colors.blueGrey[600], fontSize: 18,fontWeight: FontWeight.bold),
              //border: OutlineInputBorder(),
                  filled: true, fillColor: Colors.blueGrey.withOpacity(0.3),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Color(0xFF80CBC4).withOpacity(0.4), width: 3.0)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide:BorderSide(color:Color(0xFF80CBC4))),
              prefixIcon: Icon(Icons.lock,color: Colors.blueGrey[600] ),
               // errorText: '請勿超過 11 位!', errorStyle: TextStyle(color: Colors.pink),
        ),

      ),
          ),
    ),
            SizedBox(height: 25),
            ElevatedButton(
              style:ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20),primary: Colors.teal[600]),
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => new MyApp()),);

                SearchAccount(account.text,password.text).then((value){
                  if(value==true){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new MyApp()),);
                    }
                  else{
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                              children:[
                                Icon(Icons.report,color: Colors.red[300],size: 38.0,),
                                Text(
                                    ' Error',
                                    style:TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28.0,
                                    color:Colors.red[400],
                                  ),
                                ),
                              ]
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children:<Widget>[
                                Text(
                                  'Invalid username or password',
                                  style:TextStyle(
                                  fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color:Colors.blueGrey[300],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                  '確認',
                                   style:TextStyle(
                                       fontWeight: FontWeight.w600,
                                       letterSpacing: 5.0,
                                       fontSize: 15.0,
                                       color:Colors.teal[50],
                                   ),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.teal[300],
                                onSurface: Colors.grey,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });

                },
              child:  Container(
                height: 40,
                width: 200,
                alignment: Alignment.center,
                child: Text("Login"),
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 15),
              ),
              onPressed: () {
               print(password.text);
               print(account.text);
              },
              child: const Text('Forgot Password?'),
            ),


          ],
        ),
      ),
    );
  }
}



/*
void getHttp(var user,var pwd) async {
  Dio dio =  Dio();
  FormData form = FormData.fromMap({'account': user, 'password': pwd});
  try {
    var response = await dio.post('http://163.23.24.56/dyu/login.php',
      data: form,
      /*options: Options(
        headers: {
          "Access-Control-Allow-Origin":  "*",
          "Access-Control-Allow-Headers": "*",
          "Access-Control-Allow-Methods": "*",
          "Access-Control-Allow-Credentials": true,
        },
      ),*/
    );
    print(response);
  } catch (e) {
    print(e);
  }
}
*/



