import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:dropdown_menu/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/date_picker_widget.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/httpHeaders.dart';
import '../detailes/city_picker/show_city_picker.dart';

//数据父传子
class Product {
  final String title;
  final String description;
  Product(this.title, this.description);
}

class MuiPushWithData extends StatefulWidget {
  @override
  _MuiPushWithDataState createState() => _MuiPushWithDataState();
}

class _MuiPushWithDataState extends State<MuiPushWithData> {
  List<Product> products = List();
  @override
  void initState() {
    super.initState();
    products = List.generate(10, (i) => Product('商品编号 $i', '这是一个商品详情页面，编号为$i'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('跳转页面传递商品编号')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          ListTile(
            title: Text('${products[index].title}'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ProductDetail(product: products[index])));
            },
          );
        },
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品详情页')),
      body: Center(
        child: Text('${product.description}'),
      ),
    );
  }
}

//贝塞尔曲线
class MuiBezier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贝塞尔曲线'),
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          ),
          ClipPath(
            clipper: BezierClipper(),
            child: Container(
              color: Colors.redAccent,
              height: 200.0,
            ),
          )
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firsrEndPoint = Offset(size.width / 2, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firsrEndPoint.dx, firsrEndPoint.dy);

    var secondControlPoint = Offset(size.width / 4 * 3, size.height - 100);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

//底部导航栏
class MuiBottomNav extends StatefulWidget {
  @override
  _MuiBottomNavState createState() => _MuiBottomNavState();
}

class _MuiBottomNavState extends State<MuiBottomNav> {
  final _bottomNavigationColor = Colors.blue;
  int currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(FirstPage())
      ..add(SecondPage())
      ..add(ThirdPage())
      ..add(FourthPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('底部导航栏')),
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _bottomNavigationColor),
              title: Text('First',
                  style: TextStyle(color: _bottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(Icons.email, color: _bottomNavigationColor),
              title: Text('Second',
                  style: TextStyle(color: _bottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages, color: _bottomNavigationColor),
              title: Text('Third',
                  style: TextStyle(color: _bottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplay, color: _bottomNavigationColor),
              title: Text('Fourth',
                  style: TextStyle(color: _bottomNavigationColor))),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
    );
  }
}

//带加号的底部导航栏
class MuiBottomAddNav extends StatefulWidget {
  @override
  _MuiBottomAddNavState createState() => _MuiBottomAddNavState();
}

class _MuiBottomAddNavState extends State<MuiBottomAddNav> {
  List<Widget> _eachView;
  int index = 0;

  @override
  void initState() {
    _eachView = List();
    _eachView
      ..add(EachView('First'))
      ..add(EachView('Second'))
      ..add(EachView('Third'))
      ..add(EachView('Fourth'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[index],
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.lightBlue,
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.announcement),
              color: Colors.lightBlue,
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.email),
              color: Colors.lightBlue,
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.android),
              color: Colors.lightBlue,
              onPressed: () {
                setState(() {
                  index = 3;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return EachView('NewPage');
          }));
        },
        tooltip: 'add',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);
  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._title)),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}

//高斯模糊
class MuiClipFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('高斯模糊')),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            //约束性盒子，添加额外的约束条件
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556441718510&di=ef816a7ef3cda064f069c124aeb3e16b&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150905%2Fmp30611817_1441425070569_3.jpeg'),
          ),
          Center(
            child: ClipRect(
              //可裁切矩形
              child: BackdropFilter(
                //背景过滤器
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(
                      //盒子修饰器
                      color: Colors.grey.shade400,
                    ),
                    child: Center(
                      child: Text(
                        '高斯模糊',
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//拖拽
class MuiDraggable extends StatefulWidget {
  @override
  _MuiDraggableState createState() => _MuiDraggableState();
}

class _MuiDraggableState extends State<MuiDraggable> {
  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('拖拽')),
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(80.0, 50.0),
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            offset: Offset(200.0, 50.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                _draggableColor = color;
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _draggableColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;

  const DraggableWidget({Key key, this.offset, this.widgetColor})
      : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor,
        ),
        feedback: Container(
          //拖动时效果
          width: 110.0,
          height: 110.0,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          //拖动结束
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}

//闪屏动画
class MuiSplash extends StatefulWidget {
  @override
  _MuiSplashState createState() => _MuiSplashState();
}

class _MuiSplashState extends State<MuiSplash>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
//        Navigator.of(context).pushAndRemoveUntil(
//            MaterialPageRoute(builder: (context) => MyHomePage()),
//            (route) => route == null);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      }
    });

    _controller.forward(); //播放动画
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556527271366&di=c169b0ef8f2d29bfbd3b2abd6307922c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201408%2F11%2F20140811185039_3cAKz.thumb.700_0.jpeg',
        scale: 2.0, //缩放
        fit: BoxFit.cover, //填充外部容器
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('闪屏动画'),
      ),
      body: Center(
        child: Text('首页'),
      ),
    );
  }
}

//路由动画 - 渐隐渐现
class MuiFadeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('firstPage'),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).push(FadeRoute(FadeSecondPage()));
          },
        ),
      ),
    );
  }
}

class FadeSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('secondPage'),
        elevation: 4.0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget widget;

  FadeRoute(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget child) {
            return FadeTransition(
              child: child,
              opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1, curve: Curves.fastOutSlowIn)),
            );
          },
        );
}

//路由动画 - 缩放
class MuiScaleAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('firstPage'),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).push(ScaleRoute(FadeSecondPage()));
          },
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget widget;

  ScaleRoute(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget child) {
            return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child);
          },
        );
}

//路由动画 - 旋转
class MuiRotationAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('firstPage'),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).push(RotationRoute(FadeSecondPage()));
          },
        ),
      ),
    );
  }
}

class RotationRoute extends PageRouteBuilder {
  final Widget widget;

  RotationRoute(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget child) {
            return RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1, curve: Curves.fastOutSlowIn)),
              child: child,
            );
          },
        );
}

//路由动画 - 旋转缩放
class MuiRotationAndScaleAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('firstPage'),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).push(RSRoute(FadeSecondPage()));
          },
        ),
      ),
    );
  }
}

class RSRoute extends PageRouteBuilder {
  final Widget widget;

  RSRoute(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget child) {
            return RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1, curve: Curves.fastOutSlowIn)),
              child: ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child),
            );
          },
        );
}

//路由动画 - 左右滑动
class MuiSlideAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('firstPage'),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).push(SlideRoute(FadeSecondPage()));
          },
        ),
      ),
    );
  }
}

class SlideRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRoute(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget child) {
            return SlideTransition(
              child: child,
              position:
                  Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation1, curve: Curves.easeInOutCirc)),
            );
          },
        );
}

//轮播
class MuiSwiper extends StatefulWidget {
  @override
  _MuiSwiperState createState() => _MuiSwiperState();
}

class _MuiSwiperState extends State<MuiSwiper> {
  final List<String> cycArr = List();

  @override
  void initState() {
    super.initState();
    cycArr
      ..add(
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556527271366&di=c169b0ef8f2d29bfbd3b2abd6307922c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201408%2F11%2F20140811185039_3cAKz.thumb.700_0.jpeg')
      ..add(
          'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1979363571,4186382011&fm=27&gp=0.jpg')
      ..add(
          'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3645182395,1850330127&fm=27&gp=0.jpg')
      ..add(
          'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3987686714,2445788504&fm=27&gp=0.jpg')
      ..add(
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3766312619,227567624&fm=200&gp=0.jpg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.lightBlueAccent,
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              padding: const EdgeInsets.all(20.0),
              child: Swiper(
                autoplay: true,
                itemCount: cycArr.length,
                pagination: SwiperPagination(),
                controller: SwiperController(),
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(cycArr[index], fit: BoxFit.fill);
                },
              ),
            ),
            Container(
              color: Colors.redAccent,
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              padding: const EdgeInsets.all(20.0),
              child: Swiper(
                autoplay: true,
                itemCount: cycArr.length,
                viewportFraction: 0.8,
                scale: 0.9,
                pagination: SwiperPagination(),
                controller: SwiperController(),
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(cycArr[index], fit: BoxFit.fill);
                },
              ),
            ),
            Container(
              color: Colors.brown,
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              padding: const EdgeInsets.all(20.0),
              child: Swiper(
                autoplay: true,
                itemCount: cycArr.length,
                itemWidth: MediaQuery.of(context).size.width - 100.0,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(),
                controller: SwiperController(),
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(cycArr[index], fit: BoxFit.fill);
                },
              ),
            ),
            Container(
              color: Colors.yellowAccent,
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              padding: const EdgeInsets.all(20.0),
              child: Swiper(
                autoplay: true,
                itemCount: cycArr.length,
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: 300.0,
                layout: SwiperLayout.TINDER,
                pagination: SwiperPagination(),
                controller: SwiperController(),
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(cycArr[index], fit: BoxFit.fill);
                },
              ),
            ),
            Container(
              color: Colors.pinkAccent,
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              padding: const EdgeInsets.all(20.0),
              child: Swiper(
                autoplay: true,
                layout: SwiperLayout.CUSTOM,
                customLayoutOption:
                    CustomLayoutOption(startIndex: -1, stateCount: 3)
                        .addRotate([
                  -45.0 / 180,
                  0.0,
                  45.0 / 180,
                ]).addTranslate([
                  Offset(-370.0, -40.0),
                  Offset(0.0, 0.0),
                  Offset(370.0, -40.0),
                ]),
                itemWidth: 300.0,
                itemHeight: 200.0,
                pagination: SwiperPagination(),
                itemBuilder: (context, index) {
                  return Image.network(cycArr[index], fit: BoxFit.fill);
                },
                itemCount: cycArr.length,
              ),
            ),
            Container(
              color: Colors.purpleAccent,
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              padding: const EdgeInsets.all(0.0),
              child: ConstrainedBox(
                  child: new Swiper(
                    outer: false,
                    autoplay: true,
                    itemBuilder: (c, i) {
                      return new Wrap(
                        runSpacing: 6.0,
                        children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                          return new SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new SizedBox(
                                  child: new Container(
                                    child: new Image.network(
                                        'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1979363571,4186382011&fm=27&gp=0.jpg'),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.width * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                ),
                                new Padding(
                                  padding: new EdgeInsets.only(top: 6.0),
                                  child: new Text("$i"),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                    pagination:
                        new SwiperPagination(margin: new EdgeInsets.all(5.0)),
                    itemCount: 10,
                  ),
                  constraints: new BoxConstraints.loose(
                      new Size(MediaQuery.of(context).size.width, 170.0))),
            ),
          ],
        ),
      ),
    );
  }
}

//下拉刷新,上拉加载更多
class MuiRefresh extends StatefulWidget {
  @override
  _MuiRefreshState createState() => _MuiRefreshState();
}

class _MuiRefreshState extends State<MuiRefresh> {
  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EasyRefresh"),
      ),
      body: Center(
          child: new EasyRefresh(
        key: _easyRefreshKey,
        behavior: ScrollOverBehavior(),
        refreshHeader: ClassicsHeader(
          key: _headerKey,
          bgColor: Colors.transparent,
          textColor: Colors.black87,
          moreInfoColor: Colors.black54,
          showMore: true,
        ),
        refreshFooter: ClassicsFooter(
          key: _footerKey,
          bgColor: Colors.transparent,
          textColor: Colors.black87,
          moreInfoColor: Colors.black54,
          showMore: true,
        ),
        child: new ListView.builder(
            //ListView的Item
            itemCount: str.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  height: 70.0,
                  child: Card(
                    child: new Center(
                      child: new Text(
                        str[index],
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ));
            }),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              str.clear();
              str.addAll(addStr);
            });
          });
        },
        loadMore: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            if (str.length < 20) {
              setState(() {
                str.addAll(addStr);
              });
            }
          });
        },
      )),
      persistentFooterButtons: <Widget>[
        FlatButton(
            onPressed: () {
              _easyRefreshKey.currentState.callRefresh();
            },
            child: Text("refresh", style: TextStyle(color: Colors.black))),
        FlatButton(
            onPressed: () {
              _easyRefreshKey.currentState.callLoadMore();
            },
            child: Text("loadMore", style: TextStyle(color: Colors.black)))
      ], // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//加载指示器
class MuiSpinkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('加载指示器')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRotatingCircle(color: Colors.red),
                SpinKitRotatingPlain(color: Colors.redAccent),
                SpinKitChasingDots(color: Colors.pink),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPumpingHeart(color: Colors.pinkAccent),
                SpinKitPulse(color: Colors.yellow),
                SpinKitDoubleBounce(color: Colors.yellowAccent),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitWave(color: Colors.blue, type: SpinKitWaveType.start),
                SpinKitWave(
                    color: Colors.lightBlue, type: SpinKitWaveType.center),
                SpinKitWave(
                    color: Colors.lightBlueAccent, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitThreeBounce(color: Colors.green),
                SpinKitWanderingCubes(color: Colors.greenAccent),
                SpinKitWanderingCubes(
                    color: Colors.lightGreenAccent, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitCircle(color: Colors.lightGreenAccent),
                SpinKitFadingFour(color: Colors.lightBlueAccent),
                SpinKitFadingFour(
                    color: Colors.purple, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCube(color: Colors.purpleAccent),
                SpinKitCubeGrid(size: 51.0, color: Colors.deepPurple),
                SpinKitFoldingCube(color: Colors.deepPurpleAccent),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRing(color: Colors.orange),
                SpinKitDualRing(color: Colors.deepOrange),
                SpinKitRipple(color: Colors.deepOrangeAccent),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingGrid(color: Colors.orangeAccent),
                SpinKitFadingGrid(
                    color: Colors.brown, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: Colors.lime),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitSpinningCircle(color: Colors.limeAccent),
                SpinKitSpinningCircle(
                    color: Colors.teal, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: Colors.tealAccent),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPouringHourglass(color: Colors.orangeAccent),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}

//介绍屏幕 -- 样式一
class MuiIntroSliderFirst extends StatefulWidget {
  @override
  _MuiIntroSliderFirstState createState() => _MuiIntroSliderFirstState();
}

class _MuiIntroSliderFirstState extends State<MuiIntroSliderFirst> {
  List<Slide> slides = List();

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: 'alpha',
        description:
            'Allow miles wound place the leave had. To sitting subject no improve studied limited',
        pathImage: 'images/welcome1.jpg',
        backgroundColor: Color(0xfff5a623),
      ),
    );

    slides.add(Slide(
      title: 'alpha',
      description: 'Ye indulgence unreserved connection alteration appearance',
      pathImage: 'images/welcome2.jpg',
      backgroundColor: Colors.teal,
    ));

    slides.add(Slide(
      title: 'alpha',
      description:
          'Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of',
      pathImage: 'images/welcome3.jpg',
      backgroundColor: Color(0xff203152),
    ));

    slides.add(Slide(
      title: 'alpha',
      description: 'alpha alpha alpha alpha alpha',
      pathImage: 'images/welcome4.jpg',
      backgroundColor: Color(0xff9932CC),
    ));
  }

  void onDonePress() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SlidePage()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}

class SlidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: Text('home'),
      ),
    );
  }
}

//创建介绍屏幕 -- 样式二
class MuiIntroSliderSecond extends StatefulWidget {
  @override
  _MuiIntroSliderSecondState createState() => _MuiIntroSliderSecondState();
}

class _MuiIntroSliderSecondState extends State<MuiIntroSliderSecond> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title:
            "A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE",
        maxLineTitle: 2,
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Text("Replace this with a custom widget",
            style: TextStyle(color: Color(0xffD02090))),
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        pathImage: 'images/welcome1.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title: "MUSEUM",
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
            color: Color(0xffD02090),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/welcome2.png",
        colorBegin: Color(0xffFFFACD),
        colorEnd: Color(0xffFF6347),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "COFFEE",
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xffD02090),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/welcome3.png",
        colorBegin: Color(0xffFFA500),
        colorEnd: Color(0xff7FFFD4),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SlidePage()),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Color(0x33D02090),
      colorActiveDot: Color(0xffD02090),
      sizeDot: 13.0,

      // Show or hide status bar
      shouldHideStatusBar: true,
    );
  }
}

//介绍屏幕 -- 样式三
class MuiIntroSliderThird extends StatefulWidget {
  @override
  _MuiIntroSliderThirdState createState() => _MuiIntroSliderThirdState();
}

class _MuiIntroSliderThirdState extends State<MuiIntroSliderThird> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "SCHOOL",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/welcome1.png",
      ),
    );
    slides.add(
      new Slide(
        title: "MUSEUM",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/welcome2.png",
      ),
    );
    slides.add(
      new Slide(
        title: "COFFEE SHOP",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/welcome3.png",
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SlidePage()),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffcc5c),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Color(0xffffcc5c),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33ffcc5c),
      highlightColorDoneBtn: Color(0xffffcc5c),

      // Dot indicator
      colorDot: Color(0x33ffcc5c),
      colorActiveDot: Color(0xffffcc5c),
      sizeDot: 13.0,

      // List custom tabs
      listCustomTabs: this.renderListCustomTabs(),

      // Show or hide status bar
      shouldHideStatusBar: true,
    );
  }
}

//折叠面板
class MuiExpansionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('折叠面板')),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('雷霆沙赞'),
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: <Widget>[
              Image.network(
                'http://img5.mtime.cn/mg/2019/04/11/102353.51378887_270X405X4.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
          Divider(
            color: Colors.black38,
          ),
          ExpansionTile(
            title: Text('大黄蜂'),
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: <Widget>[
              Image.network(
                'http://img5.mtime.cn/mg/2018/12/04/160519.43555325_270X405X4.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
          Divider(
            color: Colors.black38,
          ),
          ExpansionTile(
            title: Text('复仇者联盟：终局之战'),
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: <Widget>[
              Image.network(
                'http://img5.mtime.cn/mg/2019/03/29/095612.14234221_270X405X4.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
          Divider(
            color: Colors.black38,
          ),
          ExpansionTile(
            title: Text('权力的游戏 最终季'),
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: <Widget>[
              Image.network(
                'http://img5.mtime.cn/mg/2019/04/03/075631.86906313_270X405X4.jpg',
                fit: BoxFit.cover,
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

//时间选择器
class MuiDatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Date Picker Demo')),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text("选择器以底部弹窗形式弹出",
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: () {
                //选择器以弹出的形似
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PickerBottomSheet();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("选择器在页面内",
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: () {
                //选择器在页面上
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PickerInPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//时间选择器 -- 底部弹窗形式
class PickerBottomSheet extends StatefulWidget {
  PickerBottomSheet({Key key}) : super(key: key);

  @override
  _PickerBottomSheetState createState() => _PickerBottomSheetState();
}

class _PickerBottomSheetState extends State<PickerBottomSheet> {
  String _datetime = '';
  int _year = 2018;
  int _month = 11;
  int _date = 11;

  String _lang = 'zh';
  String _format = 'yyyy-mm-dd';
  bool _showTitleActions = true;

  TextEditingController _langCtrl = TextEditingController();
  TextEditingController _formatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _langCtrl.text = 'zh';
    _formatCtrl.text = 'yyyy-mm-dd';

    DateTime now = DateTime.now();
    _year = now.year;
    _month = now.month;
    _date = now.day;
  }

  /// Display date picker.
  void _showDatePicker() {
    final bool showTitleActions = false;
    DatePicker.showDatePicker(
      context,
      showTitleActions: _showTitleActions,
      minYear: 1970,
      maxYear: 2020,
      initialYear: _year,
      initialMonth: _month,
      initialDate: _date,
      minDateTime: DateTime(2000),
      maxDateTime: DateTime(2021, 5, 15),
      initialDateTime: DateTime(2019, 1, 1),
      confirm: Text('确定', style: TextStyle(color: Colors.red)),
      cancel: Text('取消', style: TextStyle(color: Colors.cyan)),
      locale: _lang,
      dateFormat: _format,
      onChanged: (year, month, date) {
        debugPrint('onChanged date: $year-$month-$date');

        if (!showTitleActions) {
          _changeDatetime(year, month, date);
        }
      },
      onConfirm: (year, month, date) {
        _changeDatetime(year, month, date);
      },
      onCancel: () {
        debugPrint('onCancel');
      },
      onChanged2: (dateTime, List<int> index) {
        debugPrint('onChanged2 date: $dateTime');
        debugPrint('onChanged2 index: $index');
      },
      onConfirm2: (dateTime, List<int> index) {
        debugPrint('onConfirm2 date: $dateTime');
        debugPrint('onConfirm2 index: $index');
      },
    );
  }

  void _changeDatetime(int year, int month, int date) {
    setState(() {
      _year = year;
      _month = month;
      _date = date;
      _datetime = '$year-$month-$date';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Date Picker Bottom Sheet')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            // show title actions checkbox
            Row(
              children: <Widget>[
                Text('是否展示标题', style: TextStyle(fontSize: 16.0)),
                Checkbox(
                  value: _showTitleActions,
                  onChanged: (value) => setState(() {
                        _showTitleActions = value;
                      }),
                )
              ],
            ),

            // Language input field
            TextField(
              controller: _langCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: '语言',
                hintText: 'en / zh ...',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) => _lang = value,
            ),

            // Formatter input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: '时间格式',
                hintText: 'yyyy-mm-dd / yyyy-mmm-dd / yyyy-mmmm-dd',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) {
                _format = value;
              },
            ),

            // Selected date
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('选择时间:', style: Theme.of(context).textTheme.subhead),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text('$_datetime',
                        style: Theme.of(context).textTheme.title),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDatePicker,
        tooltip: 'Show DatePicker',
        child: Icon(Icons.date_range),
      ),
    );
  }
}

//时间选择器 -- 在页面上
class PickerInPage extends StatefulWidget {
  PickerInPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PickerInPageState();
}

class _PickerInPageState extends State<PickerInPage> {
  DateTime _currDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date Picker In Page")),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              child: DatePickerWidget(
//                minDateTime: DateTime(2005),
//                maxDateTime: DateTime(2019),
//                initDateTime: DateTime(2018, 1, 1),
//                dateFormat: 'mm-dd-yyyy',
                onChanged2: (dateTime, selectedIndex) {
                  debugPrint(
                      '****** dataTime=$dateTime\nselectedIndex=$selectedIndex');
                  setState(() {
                    _currDateTime = dateTime;
                  });
                },
              ),
            ),

            // Selected date
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('选择时间:', style: Theme.of(context).textTheme.subhead),
                Container(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    _currDateTime != null
                        ? '${_currDateTime.year}-${_currDateTime.month}-${_currDateTime.day}'
                        : '',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//城市选择器
class MuiCityPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowCityPicker();
  }
}

//下拉菜单
const List<Map<String, dynamic>> ORDERS = [
  {"title": "综合排序"},
  {"title": "好评优先"},
  {"title": "离我最近"},
  {"title": "人气最高"},
];

const int ORDER_INDEX = 0;

const List<Map<String, dynamic>> TYPES = [
  {"title": "全部", "id": 0},
  {"title": "甜点饮品", "id": 1},
  {"title": "生日蛋糕", "id": 2},
  {"title": "火锅", "id": 3},
  {"title": "自助餐", "id": 4},
  {"title": "小吃", "id": 5},
  {"title": "快餐", "id": 6},
  {"title": "日韩料理", "id": 7},
  {"title": "西餐", "id": 8},
  {"title": "聚餐", "id": 9},
  {"title": "烧烤", "id": 10},
  {"title": "川菜", "id": 11},
  {"title": "江浙菜", "id": 12},
  {"title": "东北菜", "id": 13},
  {"title": "蒙餐", "id": 14},
  {"title": "新疆菜", "id": 15},
];

const int TYPE_INDEX = 2;

const List<Map<String, dynamic>> BUSINESS_CYCLE = [
  {
    "title": "附近",
    "children": [
      {"title": "附近", "distance": 500},
      {"title": "1km", "distance": 1000},
      {"title": "2km", "distance": 2000}
    ]
  },
  {
    "title": "推荐商圈",
    "children": [
      {"title": "中山路", "count": 326},
      {"title": "万达广场", "count": 100},
      {"title": "瑞景", "count": 50}
    ]
  },
  {
    "title": "附近",
    "children": [
      {"title": "附近", "distance": 500},
      {"title": "1km", "distance": 1000},
      {"title": "2km", "distance": 2000}
    ]
  },
  {
    "title": "附近",
    "children": [
      {"title": "附近", "distance": 500},
      {"title": "1km", "distance": 1000},
      {"title": "2km", "distance": 2000}
    ]
  },
];

String FOOD_JSON =
    '[{"title":"力体","children":[{"title":"传声织","count":810},{"title":"分队什","count":463},{"title":"且工","count":325},{"title":"清局","count":899},{"title":"代老克","count":325},{"title":"持连回","count":14},{"title":"改层听","count":470},{"title":"存比","count":908},{"title":"热土米","count":333},{"title":"水发","count":58},{"title":"制见","count":28},{"title":"取化无","count":469},{"title":"记有何","count":503},{"title":"亲公何","count":930},{"title":"步业要","count":885}]},{"title":"建易外","children":[{"title":"生观真","count":207},{"title":"音代","count":425},{"title":"族王资","count":205},{"title":"圆传统","count":791},{"title":"些任","count":141},{"title":"程即走","count":163},{"title":"各七","count":65},{"title":"院此格","count":314},{"title":"支及","count":726},{"title":"别题","count":524},{"title":"低去到","count":706},{"title":"般将","count":13},{"title":"西南","count":189},{"title":"状南制","count":335},{"title":"调油","count":90},{"title":"听从没","count":33},{"title":"电求什","count":88}]},{"title":"非先算","children":[{"title":"严状","count":108},{"title":"查增","count":634},{"title":"号备","count":304},{"title":"法口群","count":304},{"title":"半电报","count":324},{"title":"线红","count":153},{"title":"信证作","count":546},{"title":"器电","count":651},{"title":"示南称","count":128},{"title":"全战","count":412},{"title":"走打","count":592},{"title":"眼基般","count":134},{"title":"来究计","count":322},{"title":"性们","count":511},{"title":"儿数金","count":427},{"title":"已计","count":593},{"title":"导养","count":973}]},{"title":"头走认","children":[{"title":"导时","count":229},{"title":"达积且","count":277},{"title":"样队儿","count":592},{"title":"电历","count":568},{"title":"车一","count":618},{"title":"求生研","count":886},{"title":"正将","count":300},{"title":"并米论","count":945},{"title":"压进到","count":320},{"title":"具候素","count":607},{"title":"它长","count":411},{"title":"写非","count":716},{"title":"实员产","count":452},{"title":"资参管","count":561},{"title":"八主","count":748},{"title":"事厂要","count":672},{"title":"命面","count":83},{"title":"任天","count":106}]},{"title":"机列二","children":[{"title":"展花","count":426},{"title":"经报导","count":363},{"title":"分带完","count":767},{"title":"于却安","count":687},{"title":"她回别","count":520},{"title":"根层性","count":853},{"title":"历感","count":532},{"title":"大响三","count":573},{"title":"本住","count":893},{"title":"际志","count":466},{"title":"温金起","count":231},{"title":"山温","count":910},{"title":"把程","count":463},{"title":"出交认","count":232}]},{"title":"其造据","children":[{"title":"满成风","count":49},{"title":"正世龙","count":385},{"title":"命出","count":142},{"title":"真区","count":736},{"title":"压平马","count":780},{"title":"交飞省","count":876},{"title":"集处就","count":694},{"title":"车便","count":410},{"title":"样装性","count":713},{"title":"斯更","count":425},{"title":"响许","count":975},{"title":"能目设","count":778},{"title":"近准","count":974},{"title":"参音","count":252},{"title":"教见","count":611},{"title":"问素","count":883},{"title":"连也","count":265},{"title":"飞采","count":448},{"title":"法那且","count":748},{"title":"区决门","count":173}]},{"title":"东么","children":[{"title":"近华","count":875},{"title":"极何现","count":576},{"title":"叫条等","count":501},{"title":"办市","count":344},{"title":"无组便","count":177},{"title":"义料","count":728},{"title":"声米","count":743},{"title":"进论书","count":670},{"title":"土九","count":339},{"title":"山矿","count":560},{"title":"一参","count":303}]},{"title":"老农","children":[{"title":"总计工","count":667},{"title":"验义风","count":456},{"title":"业导低","count":802},{"title":"音速是","count":26},{"title":"器众","count":869},{"title":"争才","count":775},{"title":"面听三","count":635},{"title":"拉后","count":293},{"title":"也按","count":339},{"title":"没式其","count":673},{"title":"酸细","count":405},{"title":"平后","count":302},{"title":"给气","count":269},{"title":"持后","count":864},{"title":"月次","count":561},{"title":"一者","count":36},{"title":"名问当","count":600},{"title":"马该","count":785},{"title":"为列","count":915}]},{"title":"局点自","children":[{"title":"什深求","count":399},{"title":"时么","count":514},{"title":"果放北","count":638},{"title":"导片","count":622},{"title":"第该打","count":353},{"title":"队深决","count":526},{"title":"器低县","count":626},{"title":"花正不","count":98},{"title":"难要江","count":111},{"title":"质市","count":241},{"title":"快强又","count":429},{"title":"细与","count":624},{"title":"证厂","count":922},{"title":"新调业","count":302},{"title":"开圆","count":35}]},{"title":"近从","children":[{"title":"改然","count":396},{"title":"受为","count":17},{"title":"受口","count":262},{"title":"与全大","count":25},{"title":"拉总","count":149},{"title":"代打题","count":171},{"title":"主造出","count":163},{"title":"最交能","count":922},{"title":"高五","count":786},{"title":"开革","count":12},{"title":"名情","count":990},{"title":"级油","count":818},{"title":"温办始","count":431},{"title":"济地节","count":330},{"title":"象龙","count":233}]}]';

List FOODS = jsonDecode(FOOD_JSON);

const int FOOD_INDEX = 1;

class MuiDropDownMenu extends StatefulWidget {
  @override
  _MuiDropDownMenuState createState() => _MuiDropDownMenuState();
}

class _MuiDropDownMenuState extends State<MuiDropDownMenu> {
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = new ScrollController();
    globalKey = new GlobalKey();
    super.initState();
  }

  DropdownMenu buildDropdownMenu() {
    return new DropdownMenu(maxMenuHeight: kDropdownMenuItemHeight * 10,
        //  activeIndex: activeIndex,
        menus: [
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: TYPE_INDEX,
                  data: TYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * TYPES.length),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: ORDER_INDEX,
                  data: ORDERS,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * ORDERS.length),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownTreeMenu(
                  selectedIndex: 0,
                  subSelectedIndex: 0,
                  itemExtent: 45.0,
                  background: Colors.red,
                  subBackground: Colors.blueAccent,
                  itemBuilder:
                      (BuildContext context, dynamic data, bool selected) {
                    if (!selected) {
                      return new DecoratedBox(
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: Divider.createBorderSide(context))),
                          child: new Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: new Row(
                                children: <Widget>[
                                  new Text(data['title']),
                                ],
                              )));
                    } else {
                      return new DecoratedBox(
                          decoration: new BoxDecoration(
                              border: new Border(
                                  top: Divider.createBorderSide(context),
                                  bottom: Divider.createBorderSide(context))),
                          child: new Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: new Row(
                                children: <Widget>[
                                  new Container(
                                      color: Theme.of(context).primaryColor,
                                      width: 3.0,
                                      height: 20.0),
                                  new Padding(
                                      padding: new EdgeInsets.only(left: 12.0),
                                      child: new Text(data['title'])),
                                ],
                              )));
                    }
                  },
                  subItemBuilder:
                      (BuildContext context, dynamic data, bool selected) {
                    Color color = selected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).textTheme.body1.color;

                    return new SizedBox(
                      height: 45.0,
                      child: new Row(
                        children: <Widget>[
                          new Text(
                            data['title'],
                            style: new TextStyle(color: color),
                          ),
                          new Expanded(
                              child: new Align(
                                  alignment: Alignment.centerRight,
                                  child: new Text(data['count'].toString())))
                        ],
                      ),
                    );
                  },
                  getSubData: (dynamic data) {
                    return data['children'];
                  },
                  data: FOODS,
                );
              },
              height: 450.0)
        ]);
  }

  DropdownHeader buildDropdownHeader({DropdownMenuHeadTapCallback onTap}) {
    return new DropdownHeader(
      onTap: onTap,
      titles: [TYPES[TYPE_INDEX], ORDERS[ORDER_INDEX], FOODS[0]['children'][0]],
    );
  }

  Widget buildFixHeaderDropdownMenu() {
    return new DefaultDropdownMenuController(
        child: new Column(
      children: <Widget>[
        buildDropdownHeader(),
        new Expanded(
            child: new Stack(
          children: <Widget>[
            new ListView(
              children: <Widget>[new Text("123123")],
            ),
            buildDropdownMenu()
          ],
        ))
      ],
    ));
  }

  Widget buildInnerListHeaderDropdownMenu() {
    return new DefaultDropdownMenuController(
        onSelected: ({int menuIndex, int index, int subIndex, dynamic data}) {
          print(
              "menuIndex:$menuIndex index:$index subIndex:$subIndex data:$data");
        },
        child: new Stack(
          children: <Widget>[
            new CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  new SliverList(
                      key: globalKey,
                      delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return new Container(
                          color: Colors.black26,
                          child: Container(color: Colors.pink),
                        );
                      }, childCount: 1)),
                  new SliverPersistentHeader(
                    delegate: new DropdownSliverChildBuilderDelegate(
                        builder: (BuildContext context) {
                      return new Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: buildDropdownHeader(onTap: this._onTapHead));
                    }),
                    pinned: true,
                    floating: true,
                  ),
                  new SliverList(
                      delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                    return new Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: new Image.asset(
                        "images/body.jpg",
                        fit: BoxFit.fill,
                      ),
                    );
                  }, childCount: 10)),
                ]),
            new Padding(
                padding: new EdgeInsets.only(top: 46.0),
                child: buildDropdownMenu())
          ],
        ));
  }

  GlobalKey globalKey;
  @override
  void dispose() {
    super.dispose();
  }

  void _onTapHead(int index) {
    RenderObject renderObject = globalKey.currentContext.findRenderObject();
    DropdownMenuController controller =
        DefaultDropdownMenuController.of(globalKey.currentContext);
    //
    scrollController
        .animateTo(scrollController.offset + renderObject.semanticBounds.height,
            duration: new Duration(milliseconds: 150), curve: Curves.ease)
        .whenComplete(() {
      controller.show(index);
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('drop down menu'),
      ),
      body: _currentIndex == 0
          ? buildFixHeaderDropdownMenu()
          : buildInnerListHeaderDropdownMenu(),
      bottomNavigationBar: new BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            {"name": "Fix", "icon": Icons.hearing},
            {"name": "ScrollView", "icon": Icons.list}
          ]
              .map((dynamic data) => new BottomNavigationBarItem(
                  title: new Text(data["name"]), icon: new Icon(data["icon"])))
              .toList()),
    );
  }
}

//加载网页
class MuiUrlLuncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加载网页'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Text('Flutter中文网'),
              onPressed: _launchURL,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Text('打电话：10086'),
              onPressed: _launchPhone,
            ),
          )
        ],
      )),
    );
  }

  _launchURL() async {
    const url = 'https://flutterchina.club/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchPhone() async {
    const url = 'tel:10086';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//提示
class MuiToast extends StatefulWidget {
  @override
  _MuiToastState createState() => _MuiToastState();
}

class _MuiToastState extends State<MuiToast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('toast'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('Show Short Toast'),
                onPressed: () => showToast('这是一个提示时间很短的toast'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Long Toast'),
                  onPressed: () => showToast("这是一个提示时间略长的toast",
                      duration: Toast.LENGTH_LONG)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Bottom Toast'),
                  onPressed: () =>
                      showToast("这是一个底部toast", gravity: Toast.BOTTOM)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Center Toast'),
                  onPressed: () =>
                      showToast("这是一个居中toast", gravity: Toast.CENTER)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Top Toast'),
                  onPressed: () => showToast(
                      """所爱隔山海，山海皆可平。可是你不爱我啊，隔了座火焰山还拿不到芭蕉扇。我奋不顾身穿山越岭到了你身旁，你也只会来一句“卧槽你好666啊”""",
                      duration: Toast.LENGTH_LONG, gravity: Toast.TOP)),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}

//图片预览
class MuiPhotoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片预览'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        color: Colors.pink,
        child: PhotoView(imageProvider: AssetImage('images/star.jpg')),
      ),
    );
  }
}

//图相机拍照
class MuiImagePicker extends StatefulWidget {
  @override
  _MuiImagePickerState createState() => _MuiImagePickerState();
}

class _MuiImagePickerState extends State<MuiImagePicker> {
  var _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照'),
      ),
      body: Center(
        child: _image == null ? Text('没有选中图片') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: '排照',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

//照片选择器
class MuiImageLibaryPicker extends StatefulWidget {
  @override
  _MuiImageLibaryPickerState createState() => _MuiImageLibaryPickerState();
}

class _MuiImageLibaryPickerState extends State<MuiImageLibaryPicker> {
  var _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('照片选择'),
      ),
      body: Center(
        child: _image == null ? Text('没有选中图片') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
    ;
  }
}

//屏幕适配
class MuiScreenUtil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('按照iPhone6 750*1334尺寸来适配'),
      ),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(375),
                  height: ScreenUtil.getInstance().setHeight(200),
                  color: Colors.red,
                  child: Text(
                    '我的宽度:${ScreenUtil.getInstance().setWidth(375)}dp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.getInstance().setSp(24),
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(375),
                  height: ScreenUtil.getInstance().setHeight(200),
                  color: Colors.blue,
                  child:
                      Text('我的宽度:${ScreenUtil.getInstance().setWidth(375)}dp',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.getInstance().setSp(24),
                          )),
                ),
              ],
            ),
            Text('设备宽度:${ScreenUtil.screenWidth}px'),
            Text('设备高度:${ScreenUtil.screenHeight}px'),
            Text('设备的像素密度:${ScreenUtil.pixelRatio}'),
            Text('底部安全区距离:${ScreenUtil.bottomBarHeight}px'),
            Text('状态栏高度:${ScreenUtil.statusBarHeight}px'),
            Text(
              '实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}',
              textAlign: TextAlign.center,
            ),
            Text(
              '实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}',
              textAlign: TextAlign.center,
            ),
            Text(
              '宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}',
              textAlign: TextAlign.center,
            ),
            Text(
              '高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(100),
            ),
            Text('系统的字体缩放比例:${ScreenUtil.textScaleFactory}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('我的文字大小在设计稿上是25px，不会随着系统的文字缩放比例变化',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil.getInstance().setSp(24))),
                Text('我的文字大小在设计稿上是25px，会随着系统的文字缩放比例变化',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            ScreenUtil(allowFontScaling: true).setSp(24))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//轻量级本地存储
class MuiSharedPreferences extends StatelessWidget {
  final String mUserName = "userName";
  final _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    save() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(mUserName, _userNameController.value.text.toString());
    }

    Future<String> get() async {
      var userName;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      userName = prefs.getString(mUserName);
      return userName;
    }

    return Builder(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('轻量级本地存储'),
        ),
        body: Center(
          child: Builder(builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      icon: Icon(Icons.perm_identity),
                      labelText: '请输入用户名',
                      helperText: '注册时填写的名字'),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text('存储'),
                  onPressed: () {
                    save();
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('数据存储成功'),
                    ));
                  },
                ),
                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text('获取'),
                  onPressed: () {
                    Future<String> userName = get();
                    userName.then((String userName) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('数据获取成功：$userName')));
                    });
                  },
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}

//dio - get请求
class MuiGet extends StatefulWidget {
  @override
  _MuiGetState createState() => _MuiGetState();
}

class _MuiGetState extends State<MuiGet> {
  TextEditingController typeController = TextEditingController();
  String showText = '这是没有请求时的提示信息';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('dio - get'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '请求参数',
                    helperText: '请输入参数',
                  ),
                  autofocus: false,
                ),
                RaisedButton(
                  onPressed: _choiceAction,
                  child: Text('请求'),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                ),
              ],
            ),
          ),
        ));
  }

  void _choiceAction() {
    print('开始进行get请求.....');
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请求参数不能为空'),
              ));
    } else {
      getHttp(typeController.text.toString()).then((val) {
        setState(() {
          showText = val['data'].toString();
//          showText = val['data']['appVersionContent'].toString();
        });
      });
    }
  }

  Future getHttp(String TypeText) async {
    try {
      Response response;
      response = await Dio().get(
        'http://www.morecaret.cn/teacherapi/downloadVersion/getDownloadVersion',
      );
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}

//dio - post请求
class MuiPost extends StatefulWidget {
  @override
  _MuiPostState createState() => _MuiPostState();
}

class _MuiPostState extends State<MuiPost> {
  TextEditingController typeController = TextEditingController();
  String showText = '这是没有请求时的提示信息';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('dio - post'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '请求参数',
                    helperText: '请输入参数',
                  ),
                  autofocus: false,
                ),
                RaisedButton(
                  onPressed: _choiceAction,
                  child: Text('请求'),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                ),
              ],
            ),
          ),
        ));
  }

  void _choiceAction() {
    print('开始进行get请求.....');
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请求参数不能为空'),
              ));
    } else {
      postHttp(typeController.text.toString()).then((val) {
        setState(() {
          showText = val['data'].toString();
//          showText = val['data']['appVersionContent'].toString();
        });
      });
    }
  }

  Future postHttp(String TypeText) async {
    try {
      Response response;
      var data = {
        'parkId': '3f1f094b977743dabf96337b2b4d9ccf',
        'classId': '11111111111111111111111111111112'
      };
      Dio dio = Dio();
      dio.options.headers = postHeaders;
      response = await dio.post(
          'http://morecarecs.cn/teacherapi/getHomeAllData',
          queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
