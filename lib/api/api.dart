import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import '../config/config.dart';
import '../member/member.dart';

class Api{
  // 获取用户信息
  static void getMemberInfo(){
    String url = '${Config.apiHost}member/info?sessionkey=${Config.sessionKey}';
    http.get(url).then((reponse){
    var data = jsonDecode(reponse.body);
    print('debug:${reponse.body}');
    if(data['status'] == 'ok'){
      if(data['code'] == 10000){
        Member.member = data['member'];
      }else{
        Fluttertoast.showToast(
          msg:"身份认证过期，请重新登录",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 2
        );
        // TODO 返回登录页面
      }
    }else{
      print(url);
    }
    }).catchError((err){
      print('debug:$err');
      Fluttertoast.showToast(
        msg:"连接服务器失败，请检查网络！",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
      );
    });
  }
}