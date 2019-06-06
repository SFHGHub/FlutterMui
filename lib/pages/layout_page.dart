import 'package:flutter/material.dart';

import '../detailes/layout_detail_page.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('row(水平布局)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiRow()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('column(垂直布局)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiColumn()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('stack(层叠布局)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiStack()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('card(卡片布局)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiCard()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
          ListTile(
            title: Text('waterfall(瀑布流布局)'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MuiWrap()));
            },
          ),
          Divider(color: Colors.black38, indent: 10.0),
        ],
      ),
    );
  }
}
