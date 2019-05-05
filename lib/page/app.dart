import 'package:flutter/material.dart';
import 'msg.dart';
import 'contacts.dart';
import 'cloud.dart';
import 'me.dart';
import '../api/api.dart';


class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key){
    // 初始化网络请求
    Api.getMemberInfo(null);
  }

  final String title;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with SingleTickerProviderStateMixin  {
  // 当前选中的页
  int _tabIndex = 0;
  // 保存主页面
  var _pageList;
  // 我的页面
  MePage _mePage;

  

  @override
  void initState(){
    super.initState();
  }

  // 初始化数据
  void initData(){
    _mePage = MePage();
    _pageList = [
      MsgPage(),
      ContactsPage(),
      CloudPage(),
      _mePage,
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body:_pageList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('消息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('联系人'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            title: Text('动态'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('我的'),
          ),
        ],
        type:BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        iconSize: 24.0,
        onTap: (index){
          if(index == _tabIndex && index == 3){
            Api.getMemberInfo(_mePage);
            return;
          }
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
