import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';
import 'package:surf_flutter_courses_template/Utils/hex_color.dart';

class ColorDetailsScreen extends StatelessWidget {
  final ColorDto _colorDto;

  const ColorDetailsScreen({super.key, required ColorDto colorDto})
      : _colorDto = colorDto;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var color = HexColor.fromHex(_colorDto.hex);
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),

      //toolbarHeight: height / 2,
      //backgroundColor: HexColor.fromHex(_colorDto.hex),
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back_ios,
      //     color: Colors.black,
      //     size: 24,
      //   ),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: _colorDto.hex,
            child: Container(
              height: height / 2,
              width: double.infinity,
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _colorDto.name,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                DetailsButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Hex"),
                      Text(_colorDto.hex),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        child: Text("Red ${color.red}"),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        child: Text("Green ${color.green}"),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        child: Text("Blue ${color.blue}"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsButton extends StatelessWidget {
  const DetailsButton({
    super.key,
    required Widget child,
    required Function()? onPressed,
  })  : _child = child,
        _onPressed = onPressed;

  final Widget _child;
  final Function()? _onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        child: _child,
        onPressed: _onPressed,
      ),
    );
  }
}
