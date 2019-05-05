import 'package:flutter/material.dart';
import '../config/config.dart';
import '../member/member.dart';


class MePage extends StatefulWidget {
  MePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MePageState createState() => _MePageState();

}

class _MePageState extends State<MePage> {
  // 背景颜色
  var _itemBkColor;

  @override
  void initState(){
    super.initState();
    _itemBkColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
        centerTitle:true,
        elevation:0.0,
        backgroundColor: Color.fromARGB(255, 246, 246, 246),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit,color: Colors.blue,),
            onPressed: (){},
          ),
        ],
      ),
      body:Container(
        color: Color.fromARGB(255, 246, 246, 246),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            // 间隔
            Container(
              height: 5,
            ),
            // 头部用户信息
            GestureDetector(
              onTap: (){
                print('ontap');
              },
              onTapDown: (details){
                setState(() {
                  _itemBkColor = Color.fromARGB(255, 218, 216, 219);
                });
              },
              onTapUp: (details){
                setState(() {
                  _itemBkColor = Colors.white;
                });
              },
              child: Container(
                color: _itemBkColor,
                height: 80,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    // 头像
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: ClipOval(
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: Image(
                            image: NetworkImage('${Config.apiHost}images?hash=${Member.member["head"]}'),
                            fit:BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // 用户信息
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 12,
                        ),
                        Text(Member.member['nick'],textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 16),),
                        Container(height: 2,),
                        Text(Member.member['email'],style: TextStyle(color: Color.fromARGB(255, 143, 143, 147),fontSize: 14),),
                        Container(height: 1,),
                        Text(Member.member['phone'],style: TextStyle(color: Color.fromARGB(255, 143, 143, 147),fontSize: 14),),
                      ],
                    ),
                    // 间隔
                    Expanded(
                      child: Container(
                        width: double.infinity,
                      ),
                    ),
                    // 小箭头
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.chevron_right),
                      ),
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
