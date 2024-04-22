import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:color_palette_flutter_app/assets/app_assets.dart';
import 'package:color_palette_flutter_app/data_acсess/i_color_repository.dart';
import 'package:color_palette_flutter_app/Models/color_dto.dart';

class MockColorRepository implements IColorRepository {
  ColorsData? _colorsData;

  @override
  Future<List<ColorDto>> getColors() async {
    if (_colorsData == null) {
      var str = await loadJson();
      var jsonDecoded = jsonDecode(str);
      _colorsData = ColorsData.fromJson(jsonDecoded);
    }

    await Future.delayed(const Duration(seconds: 3));

    return _colorsData!.colors;
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString(AppAssets.colorList);
  }
}
