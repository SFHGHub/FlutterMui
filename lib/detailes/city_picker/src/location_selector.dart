import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

class LocationSelector extends StatelessWidget {
  /// 触发对象
  final Widget target;

  /// 显示类型
  final ShowType showType;

  /// 确认
  final ValueChanged<Result> onConfirm;

  /// initResult type[Result]
  final Result initResult;
  LocationSelector(
      {this.showType = ShowType.pca,
      this.initResult,
      @required this.target,
      @required this.onConfirm});
  show(BuildContext context) async {
    Result result = await CityPickers.showCityPicker(
      context: context,
      locationCode: initResult != null
          ? initResult.areaId ?? initResult.cityId ?? initResult.provinceId
          : null,
    );
    if (result != null) {
      onConfirm(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        show(context);
      },
      child: Container(
        color: Colors.black12,
        alignment: Alignment.center,
        margin: EdgeInsets.all(3.0),
        child: target,
      ),
    );
  }
}

// 显示类型
enum Mods {
  Province,
  Area,
  City,
}

abstract class ShowTypeGeometry {
  const ShowTypeGeometry();
}

class ShowType extends ShowTypeGeometry {
  final List<Mods> typesList;

  const ShowType(this.typesList);

  static const ShowType p = ShowType([Mods.Province]);
  static const ShowType c = ShowType([Mods.City]);
  static const ShowType a = ShowType([Mods.Area]);
  static const ShowType pc = ShowType([Mods.Province, Mods.City]);
  static const ShowType pca = ShowType([Mods.Province, Mods.City, Mods.Area]);
  static const ShowType ca = ShowType([Mods.Area, Mods.City]);

  ShowType operator +(ShowType others) {
    typesList.addAll(others.typesList);
    return ShowType(typesList);
  }

  bool contain(ShowType other) {
    for (Mods m in other.typesList) {
      if (!typesList.contains(m)) {
        return false;
      }
    }
    return true;
  }
}
