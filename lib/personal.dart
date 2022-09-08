import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(20.0),
            width: 500.0,
            child:
            Column(
                children: [
            Stack(
                alignment:Alignment.center ,
                children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top:120.0),
                color: Colors.white54,
                height: 500.0,
                width: 350.0,
              ),
              Container(
                margin: const EdgeInsets.only(bottom:420.0),
                height: 140.0,
                width: 140.0,
                child:Container(
                  margin: EdgeInsets.all(12.0),
                  height: 30.0,
                  padding: const EdgeInsets.all(3.0),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/people.jpg'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

                  Column(
                    children: <Widget>[
                      SizedBox(height: 130),
                      Text(
                        '姓名 : 陳肥智         ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 10),
                      Text(
                        '科系 : 資訊工程系 ',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 24,
                            fontWeight: FontWeight.bold

                        ),),
                      SizedBox(height: 10),
                      Text(
                        '學號 : V87878787',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),),
                        BarcodeWidget(
                          margin: const EdgeInsets.only(top:50.0),
                          barcode: Barcode.code128(),
                          data: 'V87878787',
                          width: 190,
                          height: 90,
                          color: Colors.blueGrey,
                            style:TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                        ),
                    ],
                  ),

                  Container(
                    margin:EdgeInsets.only(bottom:355.0,left: 100.0),
                    child:Icon(
                      Icons.edit,
                      color: Colors.blueGrey[900],
                      size:38.0,
                    ),
                  ),
            ]),





                ]
            ),

          decoration: new BoxDecoration(
            color: Color.fromRGBO(224, 255, 224, 0.5),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),

              boxShadow: [
                BoxShadow(
                    color:Color.fromRGBO(60, 119, 119, 0.7) ,
                    offset: Offset(1.0, 10.0), //阴影x轴偏移量
                    blurRadius: 5, //阴影模糊程度
                    spreadRadius: 0 //阴影扩散程度
                )
              ],
          ),
        )

    );
  }
}