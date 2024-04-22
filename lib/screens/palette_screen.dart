import 'package:flutter/material.dart';
import 'package:color_palette_flutter_app/components/color_card.dart';
import 'package:color_palette_flutter_app/data_acсess/i_color_repository.dart';
import 'package:color_palette_flutter_app/Models/color_dto.dart';

class PaletteScreen extends StatelessWidget {
  final IColorRepository _repository;

  const PaletteScreen({super.key, required IColorRepository repository})
      : _repository = repository;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 115,
        title: Padding(
          padding: const EdgeInsets.only(top: 44),
          child: Text(
            "Эксклюзивная палитра\n«Colored Box»",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 32, 16, 33),
        child: FutureBuilder(
            future: _repository.getColors(),
            builder: (context, AsyncSnapshot<List<ColorDto>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Text("Нет ни одного цвета");
                }
                return ColorsGrid(
                  colors: snapshot.data!,
                );
              } else if (snapshot.hasError) {
                return const Text("Ошибка загрузки данных");
              } else {
                return const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class ColorsGrid extends StatelessWidget {
  final List<ColorDto> _colors;

  const ColorsGrid({super.key, required List<ColorDto> colors})
      : _colors = colors;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 22,
      mainAxisSpacing: 40,
      childAspectRatio: 100 / 140,
      children: [..._colors.map((e) => ColorCard(colorDto: e))],
    );
  }
}
