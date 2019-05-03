import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Api{
  static String _server = 'http://192.168.0.104:9000/api/v1/';
  // 登录接口
  static String login(){
    // 获取vfcode
    String url = _server + 'vfcode';
    http.get(url).then((response){
      print('fuck');
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        if(data['status'] == 'ok'){
          print(data['vfcode']);
          print(data['vfsession']);
        }
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