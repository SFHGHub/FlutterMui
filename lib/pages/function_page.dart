import 'package:flutter/material.dart';

import '../detailes/function_detail_page.dart';

class FunctionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('功能实例')),
      body: ListView(
        children: <Widget>[
//          ListTile(
//            title: Text('push with data(数据父传子)'),
//            trailing: Icon(Icons.arrow_forward_ios),
//            onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (BuildContext context) => MuiPushWithData()));
//            },
//          ),
//          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('bezier(贝塞尔曲线)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiBezier()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ExpansionTile(
            title: Text('bottom navigation(底部导航栏)'),
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                title: Text('normal(普通底部导航栏)'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MuiBottomNav()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: Text('add(带➕底部导航栏)'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MuiBottomAddNav()));
                },
              ),
            ],
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('clipFilter(高斯模糊)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiClipFilter()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('drag(拖拽)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiDraggable()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('splash(闪屏动画)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiSplash()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ExpansionTile(
            title: Text('navigation animation(路由动画)'),
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                title: Text('fade(渐隐渐现)'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MuiFadeAnimation()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: Text('scale(缩放)'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MuiScaleAnimation()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: Text('rotation(旋转)'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MuiRotationAnimation()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: Text('rotation and scale(旋转缩放)'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MuiRotationAndScaleAnimation()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: Text('slide(左右滑动)'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MuiSlideAnimation()));
                },
              ),
            ],
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('swiper(轮播)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiSwiper()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('refresh / load more(下拉刷新 / 上拉加载更多)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiRefresh()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('spinkit(加载指示器)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiSpinkit()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ExpansionTile(
            title: Text('intro slider(创建介绍屏幕)'),
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                title: Text('样式一'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MuiIntroSliderFirst()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: Text('样式二'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MuiIntroSliderSecond()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: Text('自定义'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MuiIntroSliderThird()));
                },
              ),
            ],
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('expansionTile(折叠面板)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiExpansionTile()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('date picker(时间选择器)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiDatePicker()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('city picker(城市选择器)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiCityPicker()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('drop down menu(下拉菜单)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiDropDownMenu()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('url luncher(加载网页)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiUrlLuncher()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('toast(提示)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiToast()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('photo view(图片预览)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiPhotoView()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('camera(拍照)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiImagePicker()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('image picker(照片选择)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiImageLibaryPicker()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('screen util(屏幕适配信息)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiScreenUtil()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ListTile(
            title: Text('shared preferences(轻量级本地存储)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiSharedPreferences()));
            },
          ),
          Divider(
            color: Colors.black38,
          ),
          ExpansionTile(
            title: Text('dio (网络请求)'),
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                title: Text('get请求'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MuiGet()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: Text('post请求'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MuiPost()));
                },
              ),
              Divider(
                color: Colors.black38,
              ),
            ],
          ),
          Divider(
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}
