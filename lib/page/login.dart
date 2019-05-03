import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'app.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '../common/md5.dart';

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
  // 是否禁用按钮
  bool _isButtonDisabled;
  // 服务器地址
  String _server = 'http://192.168.0.104:9000/api/v1/';
  // 表彰验证
  final _formKey = GlobalKey<FormState>();
  // 保存用户名和密码
  String _email, _password;

  @override
  void initState(){
    super.initState();
    _isButtonDisabled = false;

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
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: <Widget>[
                  Text('欢迎使用万聊',textAlign: TextAlign.start, style: TextStyle(fontSize: 22.0, color: Colors.white),),
                  Padding(padding:EdgeInsets.fromLTRB(0, 20, 0, 0),),
                  TextFormField(
                    textAlign:TextAlign.start,
                    autofocus:false,
                    maxLines:1,
                    maxLength:360,
                    style: TextStyle(color: Colors.white),
                    cursorColor:Color.fromARGB(100, 255, 255, 255),
                    validator: (value){
                      var emailReg = RegExp(
                          r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
                      if (!emailReg.hasMatch(value)) {
                        return '请输入正确的邮箱账号';
                      }
                    },
                    onSaved: (value) => _email = value,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText:'请输入邮箱账号',
                      enabledBorder: UnderlineInputBorder(borderSide :BorderSide(color: Color.fromARGB(100, 255, 255, 255))),
                      focusedBorder: UnderlineInputBorder(borderSide :BorderSide(color: Color.fromARGB(100, 255, 255, 255))),
                      hintStyle: TextStyle(color: Color.fromARGB(100, 255, 255, 255)),
                    )
                  ),
                  TextFormField(
                    textAlign:TextAlign.start,
                    autofocus:false,
                    maxLines:1,
                    maxLength:360,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    validator:(value){
                      if (value.length < 6){
                        return '请输入密码';
                      }
                    },
                    onSaved: (value) => _password = value,
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
                    onPressed: _isButtonDisabled? null : (){
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        setState(() {
                          _isButtonDisabled = true;
                        });
                        login();
                      }
                      
                      return;
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
            ),
            
            
            
          ],
        ),
      ),
    );
  }

  // 登录请求
  void login(){
    // 获取vfcode
    String url = _server + 'vfcode';
    http.get(url).then((response){
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        if(data['status'] == 'ok'){
          print(data['vfcode']);
          print(data['vfsession']);
          // 获取sessionkey
          // 计算密码hash
          String md5Pass = Md5(_password);
          String pass = Md5('${md5Pass}imone2019${data['vfcode']}');
          url = _server + 'login';
          http.post(url,
          headers: {
            'Content-Type':'application/json'
          },
          body: jsonEncode({
            'vfcode':data['vfcode'],
            'vfsession':data['vfsession'],
            'email':_email,
            'password':pass,
          })).then((rep){
            var data = jsonDecode(rep.body);
            print('debug:${rep.body}');
            if(data['status'] == 'ok'){
              if(data['code'] == 10000){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context){
                    return AppPage();
                  }),
                  (route)=>route == null
                );
                return;
              }else{
                Fluttertoast.showToast(
                  msg:"登录失败！账号或密码错误",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1
                );
              }
            }
            setState(() {
              _isButtonDisabled = false;
            });
          }).catchError((err){
            print('debug:$err');
            Fluttertoast.showToast(
              msg:"连接服务器失败，请检查网络！1",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1
            );
            setState(() {
              _isButtonDisabled = false;
            });
          });

          setState(() {
            _isButtonDisabled = false;
          });
          return;
        }
      }
      Fluttertoast.showToast(
        msg:"接服务器错误，请联系管理员！",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
      );
      setState(() {
        _isButtonDisabled = false;
      });
    }).catchError((err){
      print('debug:$err');
      Fluttertoast.showToast(
        msg:"连接服务器失败，请检查网络！2",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
      );
      setState(() {
        _isButtonDisabled = false;
      });
    });
  }
}
