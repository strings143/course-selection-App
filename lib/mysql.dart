import 'package:mysql1/mysql1.dart';
import 'package:untitled8/mysql.dart';
import 'login.dart';
import 'main.dart';
import 'course.dart';





//刪除個人課程
Future DelDatabase(String index) async {
  print("Connecting to mysql server...");
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: '163.23.24.56',
    port: 3306,
    user: 'test2',
    password: 'test2',
    db: 'dyu',
  ));
  var results = await conn.query('delete from schedule where c_id=?',[index]);
  print("delete Ok....");
  await conn.close();
}

//新增個人課程
Future AddCourse(String id) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: '163.23.24.56',
    port: 3306,
    user: 'test2',
    password: 'test2',
    db: 'dyu',
  ));
  var result = await conn.query('insert into schedule (m_id, c_id) values (?, ?)', ['1',  id]);
}

//登入判斷有無帳號
Future<bool> SearchAccount(String acct ,String pwd) async {
  print("Connecting to mysql server...");
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: '163.23.24.56',
    port: 3306,
    user: 'test2',
    password: 'test2',
    db: 'dyu',
  ));
  var results = await conn.query('select * from member where account= ? and password= ? ',[acct,pwd]);
  var check;
  for (var row in results) {
    print('id: ${row[0]}');
    check='id: ${row[0]}';
  }
  print("connect ok !!");
  if(check != null) {
    return Future.value(true);
    }
  else{
    return Future.value(false);
    }
  await conn.close();
}
