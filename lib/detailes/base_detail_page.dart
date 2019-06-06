import 'package:flutter/material.dart';

//文本
class MuiText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('文本')),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('左对齐，单行，大小50，黑色，加粗'),
              subtitle: Text(
                'Heading ',
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
            ),
            Divider(color: Colors.black38, indent: 10.0),
            ListTile(
              title: Text('中对齐，单行，大小40，亮蓝色，下划线，点状'),
              subtitle: Text(
                'Heading Heading Heading',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dotted),
              ),
            ),
            Divider(color: Colors.black38, indent: 10.0),
            ListTile(
              title: Text('右对齐，换行，大小30，亮红色，中划线，块状'),
              subtitle: Text(
                'Good good study, day day up!',
                textAlign: TextAlign.left,
                maxLines: 10,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.redAccent,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
            ),
            Divider(color: Colors.black38, indent: 10.0),
            ListTile(
              title: Text('右对齐，换行，大小20，紫色，上划线，波浪'),
              subtitle: Text(
                'Good good study, day day up!',
                textAlign: TextAlign.left,
                maxLines: 10,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple,
                    decoration: TextDecoration.overline,
                    decorationStyle: TextDecorationStyle.wavy),
              ),
            ),
            Divider(color: Colors.black38, indent: 10.0),
          ],
        ));
  }
}

//按钮
class MuiButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('凸起的材质矩形按钮（RaisedButton）'),
          ),
          Center(
            child: Container(
              width: 200.0,
              height: 50.0,
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('RaisedButton'),
                onPressed: () {},
              ),
            ),
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Text('扁平按钮（FlatButton）'),
          ),
          Center(
            child: Container(
              width: 200.0,
              height: 50.0,
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                  onPressed: () {},
                  color: Colors.red,
                  child: Text(
                    'FlatButton',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Text('图标按钮（IconButton）'),
          ),
          Center(
            child: Container(
              width: 200.0,
              height: 50.0,
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(Icons.android),
                onPressed: () {},
                color: Colors.red,
              ),
            ),
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Text('水平排列的按钮组（ButtonBar）'),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 40.0,
              height: 80.0,
              color: Colors.greenAccent,
              padding: const EdgeInsets.all(10.0),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    child: Text('alpha'),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text('brove'),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text('colt'),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Text('悬停的圆形图标按钮（FloatingActionButton）'),
          ),
          Center(
            child: Container(
              width: 100.0,
              height: 100.0,
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                tooltip: 'FloatingActionButton',
                child: Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Text('弹出式菜单列表（PopupMenuButton）'),
          ),
          Center(
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.greenAccent,
              child: PopupMenuButton(
                icon: Icon(Icons.tap_and_play),
                tooltip: '提示信息',
                itemBuilder: (BuildContext context) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//图片
class MuiImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          child: Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556441718510&di=ef816a7ef3cda064f069c124aeb3e16b&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150905%2Fmp30611817_1441425070569_3.jpeg',
            scale: 2.5, //缩放比例，值越大图片越小
            repeat: ImageRepeat.noRepeat, //是否重复，重复方向X/Y轴
            color: Colors.yellowAccent,
            colorBlendMode: BlendMode.color, //颜色混合模式
            fit: BoxFit.contain, //显示模式
          ),
          width: 400.0,
          height: 600.0,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}

//输入框
class MuiTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入框'),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            cursorWidth: 5.0,
            style: TextStyle(
              color: Colors.redAccent,
            ),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: '请输入内容',
            ),
          ),
          Divider(height: 100.0, color: Colors.white),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightBlueAccent),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: '请求参数',
              helperText: '请输入参数',
            ),
          ),
          Divider(height: 100.0, color: Colors.white),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightBlueAccent),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: '请求参数',
              helperText: '请输入参数',
              icon: Icon(Icons.add_to_home_screen),
              hintText: 'hintText',
            ),
          ),
        ],
      ),
    );
  }
}

//容器
class MuiContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('容器'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 100.0,
                height: 60.0,
                color: Colors.lightBlueAccent,
                child: Text('容器一'),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
              ),
              Container(
                child: Text('容器二', style: TextStyle(fontSize: 30.0)),
                alignment: Alignment.topLeft,
                width: 400.0,
                height: 300.0,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                  Colors.lightBlueAccent,
                  Colors.lightGreenAccent,
                  Colors.purpleAccent
                ])),
              ),
              Container(
                child: Image.network(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556441718510&di=ef816a7ef3cda064f069c124aeb3e16b&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150905%2Fmp30611817_1441425070569_3.jpeg'),
                alignment: Alignment.bottomRight,
                width: 200.0,
                height: 300.0,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.fromLTRB(10, 10, 20, 20),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                  Colors.redAccent,
                  Colors.yellowAccent,
                  Colors.blueAccent
                ])),
              ),
            ],
          ),
        ));
  }
}

//列表
class MuiListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('列表')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Heading'),
          ),
          Divider(color: Colors.redAccent, indent: 10),
          ListTile(
            title: Text('Heading'),
            leading: Icon(Icons.android),
          ),
          Divider(color: Colors.redAccent, indent: 10),
          ListTile(
            title: Text('Heading'),
            trailing: Icon(Icons.android),
          ),
          Divider(color: Colors.redAccent, indent: 10),
          ListTile(
            title: Text('Heading'),
            leading: Icon(Icons.android),
            trailing: Icon(Icons.android),
          ),
          Divider(color: Colors.redAccent, indent: 10),
          ListTile(
            title: Text('title'),
            subtitle: Text('subtitle : good good study , day day up !'),
          ),
          Divider(color: Colors.redAccent, indent: 10),
          ListTile(
            title: Text('title'),
            subtitle: Text('subtitle : good good study , day day up !'),
            leading: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556441718510&di=ef816a7ef3cda064f069c124aeb3e16b&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150905%2Fmp30611817_1441425070569_3.jpeg'),
          ),
          Divider(color: Colors.redAccent, indent: 10),
          ListTile(
            title: Text('title'),
            subtitle: Text('subtitle : good good study , day day up !'),
            trailing: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556441718510&di=ef816a7ef3cda064f069c124aeb3e16b&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150905%2Fmp30611817_1441425070569_3.jpeg'),
          ),
          Divider(color: Colors.redAccent, indent: 10),
          ListTile(
            title: Text('title'),
            subtitle: Text(
                'subtitle : Yamamoto has no worries, because of the white head; the water is innocent, and the wind is wrinkled.'),
            leading: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556441718510&di=ef816a7ef3cda064f069c124aeb3e16b&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150905%2Fmp30611817_1441425070569_3.jpeg'),
            trailing: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556441718510&di=ef816a7ef3cda064f069c124aeb3e16b&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150905%2Fmp30611817_1441425070569_3.jpeg'),
          ),
          Divider(color: Colors.redAccent, indent: 10),
        ],
      ),
    );
  }
}

//网格
class MuiGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网格'),
        backgroundColor: Colors.brown,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 0.7,
        ),
        children: <Widget>[
          new Image.network(
            'http://img5.mtime.cn/mg/2019/04/11/102353.51378887_270X405X4.jpg',
            fit: BoxFit.cover,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/03/29/162239.92284604_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/02/26/103754.10526344_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/04/03/075631.86906313_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2018/12/04/160519.43555325_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/03/29/095612.14234221_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/04/11/102353.51378887_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/03/29/162239.92284604_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/02/26/103754.10526344_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/04/03/075631.86906313_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2018/12/04/160519.43555325_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/03/29/095612.14234221_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/04/11/102353.51378887_270X405X4.jpg',
            fit: BoxFit.cover,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/03/29/162239.92284604_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/02/26/103754.10526344_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/04/03/075631.86906313_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2018/12/04/160519.43555325_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
          new Image.network(
            'http://img5.mtime.cn/mg/2019/03/29/095612.14234221_270X405X4.jpg',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

//手势
class MuiGesture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('点按'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => OneTap()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('双击'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DoubleTap()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('长按'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LongTap()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('垂直拖动'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => VerticalDrag()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('水平拖动'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HorizontalDrag()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('缩放'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ScaleDrag()));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

//点按
class OneTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('单击事件'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('监测到了点击')));
              },
              child: Center(
                  child: Container(
                width: 200.0,
                height: 50.0,
                color: Colors.deepPurpleAccent,
                child: Center(
                  child: Text('监听点击'),
                ),
              )),
            );
          },
        ));
  }
}

//双击
class DoubleTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('双击事件'),
        ),
        body: Builder(builder: (BuildContext context) {
          return GestureDetector(
            onDoubleTap: () {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('监测到了双击')));
            },
            child: Center(
              child: Container(
                width: 200.0,
                height: 50.0,
                color: Colors.pink,
                child: Center(
                  child: Text('监听双击手势'),
                ),
              ),
            ),
          );
        }));
  }
}

//长按
class LongTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('长按'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onLongPress: () {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('监测到了长按')));
            },
            child: Center(
              child: Container(
                width: 200.0,
                height: 50.0,
                color: Colors.yellowAccent,
                child: Center(
                  child: Text('监听长按手势'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//垂直方向拖动
class VerticalDrag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('垂直拖动'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onVerticalDragStart: (startDetails) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('纵向拖动开始坐标 ${startDetails.globalPosition}')));
            },
            onVerticalDragEnd: (endDetails) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('纵向拖动结束')));
            },
            child: Center(
              child: Container(
                width: 200.0,
                height: 50.0,
                color: Colors.redAccent,
                child: Center(
                  child: Text('监听垂直拖动手势'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//横向拖动
class HorizontalDrag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('横向拖动'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onHorizontalDragStart: (startDetails) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('横向拖动开始坐标 ${startDetails.globalPosition}')));
            },
            onHorizontalDragEnd: (endDetails) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('横向拖动结束')));
            },
            child: Center(
              child: Container(
                width: 200.0,
                height: 50.0,
                color: Colors.brown,
                child: Center(
                  child: Text('监听横向拖动手势'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//缩放
class ScaleDrag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('缩放'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onScaleStart: (startDetails) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('缩放开始')));
            },
            onScaleEnd: (end) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('缩放结束')));
            },
            child: Center(
              child: Container(
                width: 200.0,
                height: 50.0,
                color: Colors.purple,
                child: Center(
                  child: Text('监听缩放手势'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//标签
class MuiChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('标签'),
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Chip(
                label: Text('这是一个标签'),
                backgroundColor: Colors.greenAccent,
              ),
            ),
            Center(
              child: Chip(
                label: Text('这是一个标签,这是一个标签,这是一个标签,这是一个标签',
                    style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.pinkAccent,
                deleteIcon: Icon(Icons.android),
                deleteButtonTooltipMessage: '点我',
                shadowColor: Colors.red,
              ),
            ),
            Center(
              child: Chip(
                label: Text('这是一个标签'),
              ),
            )
          ],
        ));
  }
}

//文本提示工具
class MuiTooltip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('文本提示工具'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('长按下面的按钮，弹出提示'),
            ),
            Center(
                child: FloatingActionButton(
              onPressed: () {},
              tooltip: '提示信息可自定义',
              child: Icon(Icons.add),
            )),
            Divider(color: Colors.black38),
          ],
        ));
  }
}

//数据表
class MuiDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('数据表'),
        ),
        body: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: 1,
              sortAscending: false,
              columns: [
                DataColumn(
                  label: Text('alpha'),
                ),
                DataColumn(
                  label: Text('brove'),
                ),
                DataColumn(
                  label: Text('coult'),
                ),
                DataColumn(
                  label: Text('delta'),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('00')),
                  DataCell(Text('01')),
                  DataCell(Text('02')),
                  DataCell(Text('03')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('11')),
                  DataCell(Text('12')),
                  DataCell(Text('13')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20')),
                  DataCell(Text('21')),
                  DataCell(Text('22')),
                  DataCell(Text('23')),
                ]),
                DataRow(cells: [
                  DataCell(Text('30')),
                  DataCell(Text('31')),
                  DataCell(Text('32')),
                  DataCell(Text('33')),
                ]),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20.0,
              color: Colors.red,
              child: Text('我是漂亮的分割线', style: TextStyle(color: Colors.white)),
              alignment: Alignment.center,
            ),
            DataTable(
              sortColumnIndex: 3,
              sortAscending: true,
              columns: [
                DataColumn(
                  label: Text('alpha'),
                ),
                DataColumn(
                  label: Text('brove'),
                ),
                DataColumn(
                  label: Text('coult'),
                ),
                DataColumn(
                  label: Text('delta'),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('00')),
                  DataCell(Text('01')),
                  DataCell(Text('02')),
                  DataCell(Text('03')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('11')),
                  DataCell(Text('12')),
                  DataCell(Text('13')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20')),
                  DataCell(Text('21')),
                  DataCell(Text('22')),
                  DataCell(Text('23')),
                ]),
                DataRow(cells: [
                  DataCell(Text('30')),
                  DataCell(Text('31')),
                  DataCell(Text('32')),
                  DataCell(Text('33')),
                ]),
              ],
            ),
          ],
        ));
  }
}

//线性进度条
class MuiLinearProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('线性进度条'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('进度百分之二十'),
            ),
            Center(
              child: LinearProgressIndicator(
                backgroundColor: Colors.pinkAccent,
                value: 0.2,
                semanticsLabel: 'gggg',
                semanticsValue: 'ffff',
              ),
            ),
            ListTile(
              title: Text('进度百分之四十'),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.brown,
              value: 0.4,
              semanticsLabel: 'gggg',
            ),
            ListTile(
              title: Text('进度百分之六十'),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.yellowAccent,
              value: 0.6,
              semanticsLabel: 'gggg',
            ),
            ListTile(
              title: Text('进度百分之八十'),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.orangeAccent,
              value: 0.8,
              semanticsLabel: 'gggg',
            ),
          ],
        ));
  }
}

//步骤指示器
class MuiStepper extends StatefulWidget {
  @override
  _MuiStepperState createState() => _MuiStepperState();
}

class _MuiStepperState extends State<MuiStepper> {
  var int = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('步骤指示器')),
      body: Stepper(
        currentStep: int,
        onStepTapped: (index) {
          setState(() {
            int = index;
          });
        },
        onStepContinue: () {},
        onStepCancel: () {},
        steps: <Step>[
          Step(
            title: Text('第一步'),
            content: Text('把冰箱门打开'),
            isActive: true,
            state: StepState.indexed,
            subtitle: Text('把冰箱门打开的可行性报告'),
          ),
          Step(
              title: Text('第二步'),
              content: Text('把大象塞进去'),
              isActive: true,
              state: StepState.indexed,
              subtitle: Text('把大象装进冰箱的可行性报告')),
          Step(
              title: Text('第三步'),
              content: Text('把冰箱门关上'),
              isActive: true,
              state: StepState.indexed,
              subtitle: Text('把冰箱门关上的可行性报告')),
        ],
      ),
    );
  }
}

//附加提示或操作
class MuiSimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SimpleDialog')),
      body: SingleChildScrollView(
        child: SimpleDialog(
          title: Text(
            '标题:权力的游戏 最终季',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.tealAccent,
          semanticLabel: 'gfdfgfd',
          titlePadding: const EdgeInsets.all(10.0),
          contentPadding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
              child: Image.network(
                  'http://img5.mtime.cn/mg/2019/04/03/075631.86906313_270X405X4.jpg'),
            ),
            Container(
              child: Text(
                  '《权力的游戏第八季》（Game of Thrones Season 8）是《权力的游戏》系列电视剧的第八季，也是该系列电视剧的最终季 [1]  。2019年4月14日（美国时间）回归播出 [2]  。该季只有6集，于美国时间每周日更新一集。该剧根据乔治·R·R·马丁所著小说《冰与火之歌》改编。'),
            ),
            Chip(
              label: Text('简介'),
              backgroundColor: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}

//对话框
class MuiAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlertDialog')),
      body: SingleChildScrollView(
        child: AlertDialog(
          title: Text('复仇者联盟：终局之战', textAlign: TextAlign.center),
          titlePadding: const EdgeInsets.all(10.0),
          titleTextStyle: TextStyle(color: Colors.orangeAccent),
          content: Image.network(
              'http://img5.mtime.cn/mg/2019/03/29/095612.14234221_270X405X4.jpg'),
          actions: <Widget>[
            RaisedButton(
              color: Colors.pink,
              onPressed: () {},
              child: Text(
                '取消',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.orangeAccent,
              onPressed: () {},
              child: Text(
                '确定',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//底部滑起列表
class MuiBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomSheet')),
      body: Center(
        child: MaterialButton(
          color: Colors.pink,
          child: Text('点我'),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 300.0,
                    child: Image.network(
                        'http://img5.mtime.cn/mg/2019/03/29/095612.14234221_270X405X4.jpg'),
                  );
                });
          },
        ),
      ),
    );
  }
}

//复选框
class MuiCheckbox extends StatefulWidget {
  @override
  _MuiCheckboxState createState() => _MuiCheckboxState();
}

class _MuiCheckboxState extends State<MuiCheckbox> {
  List<bool> isChecks = [true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkbox')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Checkbox(
              value: isChecks[0],
              activeColor: Colors.blue,
              onChanged: (bool) {
                setState(() {
                  isChecks[0] = bool;
                });
              },
            ),
          ),
          Divider(),
          Center(
            child: CheckboxListTile(
              value: isChecks[1],
              title: Text('CheckboxListTile_pinkAccent_platform'),
              activeColor: Colors.pinkAccent,
              controlAffinity: ListTileControlAffinity.platform, //控制亲和度
              onChanged: (bool) {
                setState(() {
                  isChecks[1] = bool;
                });
              },
            ),
          ),
          Divider(),
          Center(
            child: CheckboxListTile(
              value: isChecks[2],
              activeColor: Colors.orange,
              title: Text('CheckboxListTile_orangeAccent_trailing'),
              controlAffinity: ListTileControlAffinity.trailing, //控制亲和度
              onChanged: (bool) {
                setState(() {
                  isChecks[2] = bool;
                });
              },
            ),
          ),
          Divider(),
          Center(
            child: CheckboxListTile(
              value: isChecks[3],
              activeColor: Colors.greenAccent,
              title: Text('CheckboxListTile_greenAccent_leading'),
              controlAffinity: ListTileControlAffinity.leading, //控制亲和度
              onChanged: (bool) {
                setState(() {
                  isChecks[3] = bool;
                });
              },
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

//单选框
class MuiRadio extends StatefulWidget {
  @override
  _MuiRadioState createState() => _MuiRadioState();
}

class _MuiRadioState extends State<MuiRadio> {
  String _newValue = '语文';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radio')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio<String>(
            value: "语文",
            groupValue: _newValue,
            activeColor: Colors.pink,
            onChanged: (value) {
              setState(() {
                _newValue = value;
              });
            },
          ),
          Divider(),
          Radio<String>(
            value: "数学",
            groupValue: _newValue,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                _newValue = value;
              });
            },
          ),
          Divider(),
          Radio<String>(
            value: "英语",
            groupValue: _newValue,
            activeColor: Colors.brown,
            onChanged: (value) {
              setState(() {
                _newValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<String>(
            value: '语文',
            title: Text('语文'),
            groupValue: _newValue,
            activeColor: Colors.purpleAccent,
            onChanged: (value) {
              setState(() {
                _newValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<String>(
            value: '数学',
            title: Text('数学'),
            groupValue: _newValue,
            activeColor: Colors.orangeAccent,
            onChanged: (value) {
              setState(() {
                _newValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<String>(
            value: '英语',
            title: Text('英语'),
            groupValue: _newValue,
            activeColor: Colors.greenAccent,
            onChanged: (value) {
              setState(() {
                _newValue = value;
              });
            },
          ),
          Divider(),
        ],
      ),
    );
    ;
  }
}

//开关
class MuiSwitch extends StatefulWidget {
  @override
  _MuiSwitchState createState() => _MuiSwitchState();
}

class _MuiSwitchState extends State<MuiSwitch> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Switch(
            value: _value,
            activeColor: Colors.red, //圆形标记-开
            activeTrackColor: Colors.blue, //背景色-开
            inactiveThumbColor: Colors.brown, //圆形标记-关
            inactiveTrackColor: Colors.greenAccent, //背景色-关
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
          Divider(),
          Switch(
            value: _value,
            activeColor: Colors.green, //圆形标记-开
            activeTrackColor: Colors.lightGreenAccent, //背景色-开
            inactiveThumbColor: Colors.red, //圆形标记-关
            inactiveTrackColor: Colors.blueGrey, //背景色-关
            activeThumbImage: AssetImage('images/welcome4.jpg'),
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
          Divider(),
          Switch(
            value: _value,
            activeColor: Colors.green, //圆形标记-开
            activeTrackColor: Colors.lightGreenAccent, //背景色-开
            inactiveThumbColor: Colors.red, //圆形标记-关
            inactiveTrackColor: Colors.blueGrey, //背景色-关
            inactiveThumbImage: AssetImage('images/welcome1.jpg'),
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

//滑块
class MuiSlider extends StatefulWidget {
  @override
  _MuiSliderState createState() => _MuiSliderState();
}

class _MuiSliderState extends State<MuiSlider> {
  double progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300.0,
            child: Slider(
              value: progressValue, //实际进度的位置
              inactiveColor: Colors.black12, //进度中不活动部分的颜色
              label: '$progressValue',
              min: 0.0,
              max: 100.0,
              divisions: 1000,
              activeColor: Colors.blue, //进度中活动部分的颜色
              onChangeStart: (double) {
                print('8888');
              },
              onChangeEnd: (double) {
                print('999');
              },
              onChanged: (double) {
                setState(() {
                  progressValue = double.roundToDouble();
                });
              },
            ),
          ),
          Divider(),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.yellowAccent, //实际进度的颜色
              thumbColor: Colors.black, //滑块中心的颜色
              inactiveTrackColor: Colors.red, //默认进度条的颜色
              valueIndicatorColor: Colors.blue, //提示进度的气泡的背景色
              valueIndicatorTextStyle: TextStyle(
                //提示气泡里面文字的样式
                color: Colors.white,
              ),
              inactiveTickMarkColor: Colors.blue, //divisions对进度分割后，断续线中间间隔的颜色
              overlayColor: Colors.pink, //滑块边缘颜色
            ),
            child: Container(
              width: 300.0,
              margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
              child: Row(
                children: <Widget>[
                  Text('0.0'),
                  Expanded(
                    flex: 1,
                    child: Slider(
                      value: progressValue,
                      label: '$progressValue',
                      divisions: 10,
                      onChanged: (double) {
                        setState(() {
                          progressValue = double.floorToDouble();
                        });
                      },
                      min: 0.0,
                      max: 100.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
