import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/DataAc%D1%81ess/i_color_repository.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';

class MockColorRepository implements IColorRepository {
  ColorsData? _colorsData;

  // ColorDto("Fucsia", "ff00ff"),
  // ColorDto("Inv", "00ff00"),
  // ColorDto("Gray", "808080"),
  // ColorDto("Orange", "ff9505"),
  // ColorDto("Bronze", "ffdae9"),
  // ColorDto("Dark", "010203"),
  // ColorDto("Ffbe", "00ffbe"),

  @override
  Future<List<ColorDto>> getColors() async {
    if (_colorsData == null) {
      var str = await loadJson();
      var jsonDecoded = jsonDecode(str);
      _colorsData = ColorsData.fromJson(jsonDecoded);
    }

    await Future.delayed(const Duration(seconds: 3));
    // throw Exception("");
    return _colorsData!.colors;
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/colors.json');
  }
}
