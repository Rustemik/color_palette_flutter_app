import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';
import 'package:surf_flutter_courses_template/Utils/hex_color.dart';

class ColorDetailsScreen extends StatelessWidget {
  ColorDto _colorDto;

  ColorDetailsScreen({super.key, required ColorDto colorDto})
      : _colorDto = colorDto;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height / 2,
        backgroundColor: HexColor.fromHex(_colorDto.hex),
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //     size: 24,
        //   ),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }
}
