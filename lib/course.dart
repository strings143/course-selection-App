
import 'main.dart';
import 'package:flutter/material.dart';
import 'mysql.dart';
import 'dart:convert';
import 'package:mysql1/mysql1.dart';

class CoursePage extends StatefulWidget {
  State<CoursePage> createState() => _CourseState();
}

class Course{
  String id;
  String title;
  String introduction;
  String teacher;
  Course(this.id,this.title,this.introduction,this.teacher);
}

List<Course> course=[];
class _CourseState extends State<CoursePage>{
  //載入原有課表
  Future SearchDatabase() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '163.23.24.56',
      port: 3306,
      user: 'test2',
      password: 'test2',
      db: 'dyu',
    ));
    var results = await conn.query('select * from schedule');
    for (var row in results) {
      var results1 = await conn.query('select * from course WHERE c_id=? ',[row[1]]);
      for (var row1 in results1) {
        setState(() {
        course.add(Course(row1[0], row1[1], row1[2], row1[3]));
        });
      }
    }
    await conn.close();
  }
  //新增課程
  void GetCourse(String id)async{
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '163.23.24.56',
      port: 3306,
      user: 'test2',
      password: 'test2',
      db: 'dyu',
    ));
    var results = await conn.query('select * from course WHERE c_id=? ',[id]);
    for (var row in results) {
      print('id: ${row[0]}, title: ${row[1]}, introduction: ${row[2]},teacher:${row[3]}');
      setState(() {
        course.add(Course(row[0], row[1], row[2], row[3]));
      });
    }
    await conn.close();
  }
  void initState()
  {
    course=[];
    SearchDatabase();
    print("test...");
  }

  final Number = TextEditingController();
  void _clearTextField() {
    Number.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Row(
              children: <Widget>[
              SizedBox(height: 120),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                 child: SizedBox(
                width: 300,
                child:TextField(
                controller: Number,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  labelText: "Course Serial",
                  hintText: "輸入課程序號",
                  hintStyle:TextStyle(color:  Colors.lightGreen[50], fontSize: 18,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold) ,
                  labelStyle: TextStyle(color: Colors.lightGreen[50], fontSize: 18,fontWeight: FontWeight.bold),
                  //border: OutlineInputBorder(),
                  filled: true, fillColor: Colors.blueGrey.withOpacity(0.3),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Color(0xFFCFDBD8).withOpacity(0.4), width: 3.0)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide:BorderSide(color:Color(0xFFCFDBD8))),
                  prefixIcon: Icon(Icons.search,color: Colors.blueGrey[300] ),
                  suffixIcon: Number.text.isEmpty ? null : IconButton(icon: Icon(Icons.clear,color: Colors.blueGrey[300]), onPressed: _clearTextField,),
                  // errorText: '請勿超過 11 位!', errorStyle: TextStyle(color: Colors.pink),
                  ),
                 ),
                ),
              ),

              ElevatedButton(
                style:ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20),primary: Colors.teal[200]),
                onPressed: ()  {
                   GetCourse(Number.text);
                   AddCourse(Number.text);
                },
                child:  Container(
                  height: 45,
                  width: 40,
                  alignment: Alignment.center,
                  child:Icon(Icons.add,color: Colors.green[50],size: 38.0,),
                ),
              ),
              ],
             ),
               Expanded (
                  child: ListView.builder (
                    shrinkWrap: true,
                    itemCount: course.length,
                    itemBuilder: (context,int index) {
                      return Dismissible(
                        key:  ValueKey<Course>(course[index]),
                        onDismissed: (DismissDirection direction) {
                          DelDatabase(course[index].id);
                          setState(() {
                            course.removeAt(index);
                          });

                        },
                        child:
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          color:  Color.fromRGBO( 160, 168, 148, 0.2),
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              title:Text(
                                  '${course[index].title}',
                                  style:TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 19.0,
                                  color:Colors.teal[100],
                                ),
                              ),
                              trailing:Text(
                                  '${course[index].id}',
                                  style:TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0,
                                  color:Colors.blueGrey[100],
                                ),
                              ),
                              subtitle:Text(
                                  '${course[index].introduction}',
                                  style:TextStyle(
                                    fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color:Colors.grey[50],
                                ),
                              ),
                              leading:Text(
                                  '${course[index].teacher}',
                                  style:TextStyle(
                                    fontWeight: FontWeight.w600,
                                  fontSize: 15.0,
                                  color:Colors.grey[200],
                                ),
                              ),
                          ),
                          ),
                        background:Container(
                          color:Colors.red,
                          child: Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:const <Widget>[
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Delete",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                      );
                    },
                  ),



              ),
            ],

          ),


    );
  }
}
