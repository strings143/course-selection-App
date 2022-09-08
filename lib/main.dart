import 'package:flutter/material.dart';
import './login.dart';
import 'personal.dart';
import 'board.dart';
import 'course.dart';
import 'splash_page.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SplashPage(),
  ));

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        //primaryColor: Colors.yellow,
        //fontFamily: 'Georgia',
        /* textTheme: TextTheme(
          bodyText1: TextStyle(color:  Colors.blueGrey[600], fontSize: 18,fontStyle: FontStyle.italic),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.orange,
          displayColor: Colors.blue,
        ),*/
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),


    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title,this.icon);
}

class _MyHomePageState extends State<MyHomePage> {
  late int tappedIndex;
  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  var draweritem =[
    DrawerItem('通知',Icons.message),
    DrawerItem('個人資料',Icons.account_circle),
    DrawerItem('設定',Icons.settings),
    DrawerItem(
        '登出',Icons.logout,

    ),
  ];


  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFFEF5350),Color(0xFFC6FF00)],
  ).createShader(
    Rect.fromLTWH(65.0, 20.0, 400.0, 800.0),
  );


  final _widgetOptions = [CoursePage(),BoardPage(),PersonalPage()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.menu, color: Colors.green[200], size:35.0),
        actions:
        <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 5.0),
            child:Text('大葉大學', style: TextStyle(foreground: Paint()..shader = linearGradient, fontSize: 25,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0,right: 20.0),
            child:Text('DYU', style: TextStyle( foreground: Paint()..shader = linearGradient, fontSize: 28,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
          ),
        ],
      ),

      drawer:  Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(color: Color(0xFF78909C),),
              child:DrawerHeader(
                child: Column(
                  children:const <Widget>[
                    Text(
                      '陳肥智',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                /*decoration: BoxDecoration(
                color: Color(0xFF78909C),

                 /*image: DecorationImage(
                  image: AssetImage('assets/images/menu_bg.png'),
                  fit: BoxFit.cover,
                ),*/
              ),*/
              ),
            ),
            Expanded (
              child:ListView.builder(
                  padding: EdgeInsets.all(5.0),
                  itemCount: draweritem.length,
                  itemBuilder: (context, index) {
                    return Card(
                        color: tappedIndex == index ? Color.fromRGBO( 179, 234, 179, 0.4) : Color.fromRGBO( 167, 172, 160, 0.3),
                        child: ListTile(
                          onTap:(){
                            setState((){
                              tappedIndex=index;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) => new first()),);
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                          title: Text(draweritem[index].title,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),),
                          leading:  Icon(draweritem[index].icon,color: Colors.grey, size: 24.0), // icon-2
                        ));
                  }

              ),
            ),
          ],

        ),
      ),



      body:
      Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow:const [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 15),
          ],
        ),

        child:ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),

          child:BottomNavigationBar(
            backgroundColor: const Color.fromARGB(40, 191, 191, 191),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_add),
                label: '選課',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.speaker_notes_outlined),
                label: '布告欄',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: '個人檔案',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.tealAccent,
            //mouseCursor: MouseCursor.defer,
            onTap: _onItemTapped,
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
