import 'package:color_palette_flutter_app/Models/color_dto.dart';

abstract class IColorRepository {
  Future<List<ColorDto>> getColors();
}
