library text_drawable_widget;

import 'package:flutter/material.dart';

import 'color_generator.dart';

class TextDrawableWidget extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final BoxShape shape;
  final BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;
  final ColorGenerator colorGenerator;
  final Function onTap;
  final Color color;

  TextDrawableWidget({
    Key key,
    @required String text,
    this.width = 60,
    this.height = 60,
    this.shape = BoxShape.circle,
    BorderRadius borderRadius,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 28.0),
    ColorGenerator colorGenerator,
    this.color,
    this.onTap,
  }): 
    assert(text != null && text.isNotEmpty),
    this.text = text[0],
    this.colorGenerator = colorGenerator ?? ColorGenerator.defaultColors,
    this.borderRadius = borderRadius ?? shape == BoxShape.rectangle ? const BorderRadius.all(Radius.circular(5.0)) : null,
    super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextDrawableWidgetState(color ?? colorGenerator.getRandomColor());
  }
}

class _TextDrawableWidgetState extends State<TextDrawableWidget> {
  var selected = false;
  final Color backgroundColor;

  _TextDrawableWidgetState(this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap == null ? null : () {
          widget.onTap(!selected);

          setState(() {
            selected = !selected;
          });
      },
      child: selected ? _getSelected() : _getUnSelected(),
    );
  }

  Widget _getUnSelected() {
    return Stack(
      children: <Widget>[
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: backgroundColor,
            shape: widget.shape,
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          width: widget.width,
          height: widget.height,
          child: Text(
            widget.text,
            style: widget.textStyle,
          ),
        )
      ],
    );
  }

  Widget _getSelected() {
    return Stack(
      children: <Widget>[
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: Colors.grey.shade600,
            shape: widget.shape,
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          width: widget.width,
          height: widget.height,
          child: Icon(
            Icons.check,
            size: 32.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
