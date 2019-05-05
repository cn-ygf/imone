import 'package:flutter/material.dart';
import 'contactsitem.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('联系人',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
        centerTitle:true,
        elevation:0.0,
        backgroundColor: Color.fromARGB(255, 246, 246, 246),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add,color: Colors.blue,),
            onPressed: (){},
          ),
        ],
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 246, 246, 246),
        child: Column(
          children: <Widget>[
            // 搜索框
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              height: 36,
              color: Color.fromARGB(255, 232, 232, 232),
              child: TextField(
                textAlign:TextAlign.start,
                autofocus:false,
                maxLines:1,
                style: TextStyle(color: Colors.black,fontSize: 14),
                cursorColor:Color.fromARGB(255, 142, 142, 146),
                decoration: InputDecoration(
                  icon: Icon(Icons.search,color: Color.fromARGB(255, 142, 142, 146),),
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 5, 10),
                  hintText:'搜索联系人',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 142, 142, 146),fontSize: 14),
                  border: InputBorder.none,
                  
                )
              ),
            ),
            Container(
              color: Color.fromARGB(255, 246, 246, 246),
              height: 10,
              width: double.infinity,
            ),
            // 分割线
            Container(
              color: Color.fromARGB(255, 232, 232, 232),
              height: 1,
              width: double.infinity,
            ),
            // 消息列表
            Expanded(
              child: Container(
                width: double.infinity,
                height: 500,
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    ContactsItem(
                      hash:'0b5472d59d995f88ee2b4bc61ac1b668',
                      nick:'小鱼人',
                      current: '工作中',
                    ),
                    ContactsItem(
                      hash:'3d76949acf359fabeadb4f1a4d6af68f',
                      nick:'小乌龟',
                      current: '休假中',
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
