import 'package:flutter/material.dart';
import '../config/config.dart';

class ContactsItem extends StatelessWidget {

  const ContactsItem({this.hash,this.nick,this.current})
    : assert(hash != null),
      assert(nick != null);
  // 头像hash
  final String hash;
  // 昵称
  final String nick;
  // 状态
  final String current;

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
                  image: NetworkImage('${Config.apiHost}images?hash=${this.hash}'),
                  fit:BoxFit.cover,
                ),
              ),
            ),
          ),
          // 昵称消息和状态
          Expanded(
            child: Column(
              children: <Widget>[
                Container(height: 10,),
                // 昵称
                Row(
                  children: <Widget>[
                    Text(this.nick,style: TextStyle(color: Colors.black,fontSize: 16),),
                    Expanded(child: Container(width: double.infinity,),),
                  ],
                ),
                // 状态
                Container(
                  width: double.infinity,
                  child: Text(this.current,style: TextStyle(color: Color.fromARGB(255, 135, 139, 151)),),
                ),
                // 间隔
                Container(
                  height: 5,
                ),
                //分割线
                Container(
                  height: 1,
                  color: Color.fromARGB(255, 250, 250, 250),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
