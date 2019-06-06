import 'package:flutter/material.dart';

//水平布局
class MuiRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('水平布局')),
      body: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            color: Colors.blueAccent,
            child: Text('flutter'),
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              color: Colors.redAccent,
              child: Text(
                'button',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.yellow,
            child: Text('dart'),
          )
        ],
      ),
    );
  }
}

//垂直布局
class MuiColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('垂直布局')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('alpha alpha alpha alpha'),
          ),
          Text('brove brove brove brove'),
          RaisedButton(
            onPressed: () {},
            child: Text('colt colt colt colt'),
          ),
        ],
      ),
    );
  }
}

//层叠布局
class MuiStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('层叠布局')),
      body: Center(
        child: Stack(
          alignment: const FractionalOffset(0.5, 0.8),
          children: <Widget>[
            Container(
              child: Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556441718510&di=ef816a7ef3cda064f069c124aeb3e16b&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150905%2Fmp30611817_1441425070569_3.jpeg'),
            ),
            Positioned(
              child: Text('alpha', style: TextStyle(color: Colors.white)),
              right: 20.0,
              top: 20.0,
            ),
            Positioned(
              child: Icon(Icons.redeem),
              left: 20.0,
              top: 20.0,
            ),
            Positioned(
              child: RaisedButton(
                onPressed: () {},
                child: Text('按钮'),
                color: Colors.blueAccent,
              ),
              left: 20.0,
              bottom: 20.0,
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text('Heading', style: TextStyle(color: Colors.red)),
                    color: Colors.white,
                  ),
                  Container(
                    child:
                        Text('Hello', style: TextStyle(color: Colors.yellow)),
                    color: Colors.pink,
                  ),
                  Container(
                    child: Text('Word',
                        style: TextStyle(color: Colors.blueAccent)),
                    color: Colors.purple,
                  ),
                  Container(
                    child:
                        Text('Leading', style: TextStyle(color: Colors.pink)),
                    color: Colors.white70,
                  )
                ],
              ),
              right: 20.0,
              bottom: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

//卡片布局
class MuiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('卡片布局')),
      body: Card(
        margin: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '山东省济南市高新区',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('趵突泉'),
              leading: Icon(
                Icons.gamepad,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
            ListTile(
              title: Text(
                '北京市海淀区中国科技大学',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('大明湖'),
              leading: Icon(
                Icons.gamepad,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
            ListTile(
              title: Text(
                '上海市浦东区',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('黑虎泉'),
              leading: Icon(
                Icons.gamepad,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
          ],
        ),
      ),
    );
  }
}

//瀑布流布局
class MuiWrap extends StatefulWidget {
  @override
  _MuiWrapState createState() => _MuiWrapState();
}

class _MuiWrapState extends State<MuiWrap> {
  List<Widget> list;

  @override
  void initState() {
    list = List<Widget>()..add(buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('wrap')),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: 10.0,
            ),
          ),
        ),
      ),
    );
  }

  //自定义的添加按钮空间
  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 16) {
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.purpleAccent,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  //自定义照片空间
  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.yellowAccent,
        child: Center(child: Text('照片')),
      ),
    );
  }
}
