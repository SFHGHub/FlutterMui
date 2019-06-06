//
// Created with Android Studio.
// User: 三帆
// Date: 12/02/2019
// Time: 16:53
// email: sanfan.hx@alibaba-inc.com
// tartget:  xxx
//

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './src/attr_item_container.dart';
import './src/location_selector.dart';
import './src/picker.dart';

var emptyResult = new Result();

class ShowCityPicker extends StatefulWidget {
  @override
  _ShowCityPickerState createState() => _ShowCityPickerState();
}

class _ShowCityPickerState extends State<ShowCityPicker> {
  PickerItem showTypeAttr = PickerItem(name: '省+市+县', value: ShowType.pca);
  Result resultAttr = new Result();
  Result result = new Result();
  double barrierOpacityAttr = 0.5;
  bool barrierDismissibleAttr = false;
  bool customerMeta = false;
  PickerItem themeAttr;
  Widget _buildShowTypes() {
    return Picker(
      target: showTypeAttr != null && showTypeAttr.name != null
          ? Text(showTypeAttr.name)
          : Text("显示几级联动"),
      onConfirm: (PickerItem item) {
        setState(() {
          showTypeAttr = item;
        });
      },
      items: [
        PickerItem(name: '省', value: ShowType.p),
        PickerItem(name: '市', value: ShowType.c),
        PickerItem(name: '县', value: ShowType.a),
        PickerItem(name: '省+市', value: ShowType.pc),
        PickerItem(name: '省+市+县', value: ShowType.pca),
        PickerItem(name: '市+县', value: ShowType.ca),
      ],
    );
  }

  Widget _buildDefaultLocation() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: LocationSelector(
            target: Text("${resultAttr.provinceName ?? '省'}",
                maxLines: 1, overflow: TextOverflow.ellipsis),
            showType: ShowType.p,
            initResult: resultAttr,
            onConfirm: (Result result) {
              if (result.provinceId != null) {
                this.setState(() {
                  resultAttr = result;
                });
              }
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: LocationSelector(
            target: Text("${resultAttr.cityName ?? '市'}",
                maxLines: 1, overflow: TextOverflow.ellipsis),
            showType: ShowType.c,
            initResult: resultAttr,
            onConfirm: (Result result) {
              if (result.cityId != null) {
                setState(() {
                  resultAttr = result;
                });
              }
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: LocationSelector(
            target: Text("${resultAttr.areaName ?? '区'}",
                maxLines: 1, overflow: TextOverflow.ellipsis),
            showType: ShowType.a,
            initResult: resultAttr,
            onConfirm: (Result result) {
              if (result.areaId != null) {
                setState(() {
                  resultAttr = result;
                });
              }
            },
          ),
        )
      ],
    );
  }

  Widget _buildBarrierDismissible() {
    return Container(
        alignment: Alignment.centerRight,
        child: CupertinoSwitch(
          value: barrierDismissibleAttr,
          onChanged: (bool val) {
            this.setState(() {
              barrierDismissibleAttr = !barrierDismissibleAttr;
            });
          },
        ));
  }

  Widget _buildBarrierOpacity() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: CupertinoSlider(
            value: barrierOpacityAttr, //实际进度的位置
            min: 0.01,
            max: 1.0,
            divisions: 100,
            activeColor: Colors.blue, //进度中活动部分的颜色
            onChanged: (double) {
              setState(() {
                barrierOpacityAttr = double.toDouble();
              });
            },
          ),
        ),
        Text("${barrierOpacityAttr.toStringAsFixed(2)}")
      ],
    );
  }

  Widget _buildCustomerMeta() {
    return Container(
        alignment: Alignment.centerRight,
        child: CupertinoSwitch(
          value: customerMeta,
          onChanged: (bool val) {
            this.setState(() {
              customerMeta = !customerMeta;
            });
          },
        ));
  }

  Widget _buildTheme() {
    return Picker(
        target: themeAttr != null && themeAttr.name != null
            ? Text(themeAttr.name)
            : Text("主题切换"),
        onConfirm: (PickerItem item) {
          setState(() {
            themeAttr = item;
          });
        },
        items: [
          PickerItem(name: 'ThemeData.light()', value: ThemeData.light()),
          PickerItem(name: 'ThemeData.fallback()', value: ThemeData.fallback()),
          PickerItem(name: 'ThemeData.dark()', value: ThemeData.dark()),
          PickerItem(name: 'ThemeData.of(context)', value: null),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ios风格城市选择器"),
      ),
      body: Column(
        children: <Widget>[
          AttrItemContainer(title: '级联方式', editor: _buildShowTypes()),
          AttrItemContainer(title: '默认地址', editor: _buildDefaultLocation()),
          AttrItemContainer(title: '背景透明度', editor: _buildBarrierOpacity()),
          AttrItemContainer(
              title: '背景点击关闭', editor: _buildBarrierDismissible()),
          AttrItemContainer(title: '是否采用自定义数据', editor: _buildCustomerMeta()),
          AttrItemContainer(title: '主题选择', editor: _buildTheme()),
          AttrItemContainer(
              title: '选择结果', editor: Text("${result.toString()}")),
          RaisedButton(
            onPressed: () async {
              print("locationCode $resultAttr");
              Result tempResult = await CityPickers.showCityPicker(
                context: context,
//                  theme: themeAttr != null ? themeAttr.value : null,
                locationCode: resultAttr != null
                    ? resultAttr.areaId ??
                        resultAttr.cityId ??
                        resultAttr.provinceId
                    : null,
//                  showType: showTypeAttr.value,
//                  barrierOpacity: barrierOpacityAttr,
//                  barrierDismissible: barrierDismissibleAttr,
//                  citiesData: customerMeta == true ? citiesData : null,
//                  provincesData: customerMeta == true ? provincesData : null
              );
              if (tempResult == null) {
                return;
              }
              this.setState(() {
                result = tempResult;
              });
            },
            child: Text("展示city picker"),
          )
        ],
      ),
    );
  }
}
