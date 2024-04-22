import 'package:flutter/material.dart';
import 'package:color_palette_flutter_app/Models/color_dto.dart';
import 'package:color_palette_flutter_app/Utils/hex_color.dart';
import 'package:color_palette_flutter_app/assets/app_strings.dart';
import 'package:color_palette_flutter_app/components/details_button.dart';
import 'package:color_palette_flutter_app/utils/copy_helper.dart';

class ColorDetailsScreen extends StatelessWidget {
  final ColorDto _colorDto;

  const ColorDetailsScreen({super.key, required ColorDto colorDto})
      : _colorDto = colorDto;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final color = HexColor.fromHex(_colorDto.hex);
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
                const SizedBox(
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
                  onPressed: () async {
                    await CopyHelper.copyWithSnackbar(context, _colorDto.hex,
                        "${AppStrings.hex} ${AppStrings.copied}");
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailsButton(
                      child: Text("Red ${color.red}"),
                      onPressed: () async {
                        await CopyHelper.copyWithSnackbar(
                            context,
                            color.red.toString(),
                            "${AppStrings.red} ${AppStrings.copied}");
                      },
                    ),
                    DetailsButton(
                      child: Text("Green ${color.green}"),
                      onPressed: () async {
                        await CopyHelper.copyWithSnackbar(
                            context,
                            color.green.toString(),
                            "${AppStrings.green} ${AppStrings.copied}");
                      },
                    ),
                    DetailsButton(
                      child: Text("Blue ${color.blue}"),
                      onPressed: () async {
                        await CopyHelper.copyWithSnackbar(
                            context,
                            color.blue.toString(),
                            "${AppStrings.blue} ${AppStrings.copied}");
                      },
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
