import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'app.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  // 动画控制器
  AnimationController aniCtrl;
  // 曲线动画
  CurvedAnimation curved;

  @override
  void initState(){
    super.initState();
    aniCtrl = new AnimationController(
      vsync: this, duration: const Duration(seconds: 2));
    curved = new CurvedAnimation(parent: aniCtrl, curve: Curves.linear);
    curved.addStatusListener((status){
      if(status == AnimationStatus.completed){
        aniCtrl.repeat();
      }else if(status == AnimationStatus.dismissed){
        aniCtrl.forward();
      }
    });
    aniCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
        // 宽带为整个屏幕宽度
        width: double.infinity,
        // 背景图片
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        // 内容
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children:[
            // logo与顶部间的间隔
            Container(height: 80,),
            // logo图片
            RotationTransition(
              turns:curved,
              child: Image(
                image: AssetImage("images/logo.png"),
                fit: BoxFit.contain,
                width: 128,
                height: 128,
              ),
            ),
            Container(height: 20,),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Text('欢迎使用万聊',textAlign: TextAlign.start, style: TextStyle(fontSize: 22.0, color: Colors.white),),
                Padding(padding:EdgeInsets.fromLTRB(0, 20, 0, 0),),
                TextField(
                  textAlign:TextAlign.start,
                  autofocus:false,
                  maxLines:1,
                  maxLength:360,
                  style: TextStyle(color: Colors.white),
                  cursorColor:Color.fromARGB(100, 255, 255, 255),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:'请输入邮箱账号',
                    enabledBorder: UnderlineInputBorder(borderSide :BorderSide(color: Color.fromARGB(100, 255, 255, 255))),
                    focusedBorder: UnderlineInputBorder(borderSide :BorderSide(color: Color.fromARGB(100, 255, 255, 255))),
                    hintStyle: TextStyle(color: Color.fromARGB(100, 255, 255, 255)),
                  )
                ),
                TextField(
                  textAlign:TextAlign.start,
                  autofocus:false,
                  maxLines:1,
                  maxLength:360,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:'请输入密码',
                    enabledBorder: UnderlineInputBorder(borderSide :BorderSide(color: Color.fromARGB(100, 255, 255, 255))),
                    focusedBorder: UnderlineInputBorder(borderSide :BorderSide(color: Color.fromARGB(100, 255, 255, 255))),
                    hintStyle: TextStyle(color: Color.fromARGB(100, 255, 255, 255)),
                  )
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  color:Colors.blue,
                  textColor:Colors.white,
                  child: Text('登录'),
                  disabledColor: Color.fromARGB(100, 255, 255, 255),
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){
                        return AppPage();
                      }),
                      (route)=>route == null
                    );
                    return;
                    Socket.connect('www.baidu.com', 80).then((socket) async{
                      socket.transform(utf8.decoder).listen(debugPrint);
                      socket.write('GET / HTTP/1.1\r\n Host: www.baidu.com\r\nAccept: text/html\r\n\r\n');
                    });
                  },
                ),
              ],
            ),
            
            
          ],
        ),
      ),
    );
  }
}
