import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// The arrow tip.
class HandlerWidget extends StatelessWidget {
  ///
  const HandlerWidget({
    super.key,
    required this.params,
    this.icon,
  });

  ///
  final HandlerParams params;

  ///
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: params.width,
      height: params.height,
      decoration: BoxDecoration(
        color: params.backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(params.width),
        ),
        border: Border.all(
          width: 2,
          color: params.borderColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FittedBox(child: icon),
      ),
    );
  }
}

class HandlerParams {
  final double width;
  final double height;
  final double borderWidth;
  final Color backgroundColor;
  final Color borderColor;

  HandlerParams({
    this.width = 30,
    this.height = 30,
    this.borderWidth = 2,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.blueAccent,
  });

  HandlerParams copyWith({
    double? width,
    double? height,
    double? borderWidth,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return HandlerParams(
      width: width ?? this.width,
      height: height ?? this.height,
      borderWidth: borderWidth ?? this.borderWidth,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'borderWidth': borderWidth,
      'backgroundColor': backgroundColor.value,
      'borderColor': borderColor.value,
    };
  }

  factory HandlerParams.fromMap(Map<String, dynamic> map) {
    return HandlerParams(
      width: map['width'] as double,
      height: map['height'] as double,
      borderWidth: map['borderWidth'] as double,
      backgroundColor: Color(map['backgroundColor'] as int),
      borderColor: Color(map['borderColor'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory HandlerParams.fromJson(String source) =>
      HandlerParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HandlerParams(width: $width, height: $height, borderWidth: $borderWidth, backgroundColor: $backgroundColor, borderColor: $borderColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HandlerParams &&
        other.width == width &&
        other.height == height &&
        other.borderWidth == borderWidth &&
        other.backgroundColor == backgroundColor &&
        other.borderColor == borderColor;
  }

  @override
  int get hashCode {
    return width.hashCode ^
        height.hashCode ^
        borderWidth.hashCode ^
        backgroundColor.hashCode ^
        borderColor.hashCode;
  }
}
