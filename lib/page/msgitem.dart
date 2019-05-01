import 'package:flutter/material.dart';

class MsgItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        children: <Widget>[
          // 头像
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ClipOval(
              child: SizedBox(
                width: 45,
                height: 45,
                child: Image(
                  image: AssetImage('images/head.gif'),
                  fit:BoxFit.cover,
                ),
              ),
            ),
          ),
          // 昵称消息和时间
          Expanded(
            child: Column(
              children: <Widget>[
                Container(height: 10,),
                // 昵称 和时间
                Row(
                  children: <Widget>[
                    Text('小鱼人',style: TextStyle(color: Colors.black,fontSize: 16),),
                    Expanded(child: Container(width: double.infinity,),),
                    Text('昨天'),
                    Container(width: 20,),
                  ],
                ),
                // 消息
                Container(
                  width: double.infinity,
                  child: Text('[图片]明天去吃这个吗！',style: TextStyle(color: Color.fromARGB(255, 135, 139, 151)),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
