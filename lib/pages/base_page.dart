import 'package:flutter/material.dart';

import '../detailes/base_detail_page.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本控件'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('text(文本)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiText()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('button(按钮)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiButton()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('image(图片)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiImage()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('textField(输入框)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiTextField()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('container(容器)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiContainer()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('listView(列表)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiListView()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('gridView(网格)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiGridView()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('gesture(手势)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiGesture()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('chip(标签)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiChip()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('tooltip(文本提示工具)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiTooltip()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('dataTable(数据表)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiDataTable()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('linearProgressIndicator(线性进度条)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      MuiLinearProgressIndicator()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('stepper(步骤指示器)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiStepper()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('simpleDialog(附加提示或操作)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiSimpleDialog()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('alertDialog(对话框)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiAlertDialog()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('bottomSheet(底部滑起列表)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiBottomSheet()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('checkbox(复选框)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiCheckbox()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('radio(单选框)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiRadio()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('switch(开关)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiSwitch()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('slider(滑块)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiSlider()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
        ],
      ),
    );
  }
}
