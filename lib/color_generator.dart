import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  static final defaultColors = ColorGenerator([
    Color(0xfff16364),
    Color(0xfff58559),
    Color(0xfff9a43e),
    Color(0xffe4c62e),
    Color(0xff67bf74),
    Color(0xff59a2be),
    Color(0xff2093cd),
    Color(0xffad62a7),
    Color(0xff805781)
  ]);

  static final materialColors = ColorGenerator([
    Color(0xffe57373),
    Color(0xfff06292),
    Color(0xffba68c8),
    Color(0xff9575cd),
    Color(0xff7986cb),
    Color(0xff64b5f6),
    Color(0xff4fc3f7),
    Color(0xff4dd0e1),
    Color(0xff4db6ac),
    Color(0xff81c784),
    Color(0xffaed581),
    Color(0xffff8a65),
    Color(0xffd4e157),
    Color(0xffffd54f),
    Color(0xffffb74d),
    Color(0xffa1887f),
    Color(0xff90a4ae)
  ]);

  final Random _random;
  final List<Color> colorList;

  ColorGenerator(this.colorList, { int seed }):
    _random = Random(seed);

  Color getRandomColor() {
    return colorList[_random.nextInt(colorList.length)];
  }
}
