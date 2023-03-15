import 'dart:math' show pi;
import 'package:flutter/material.dart';


class GeometricalBackground extends StatelessWidget {
  final Widget child;
  const GeometricalBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final borderSize = size.width / 7; // Este es el tamaño para colocar 7 elementos


    final shapeWidgets = [
      _Circle(borderSize),
      _Square(borderSize),
      _RightTriangle(borderSize),
      _LeftTriangle(borderSize),
      _Diamond(borderSize),
      _SemiCircle(borderSize),
      _SemiCircleInverted(borderSize),
    ];


    return SizedBox.expand(
      child: Stack(
        children: [

          // Background with shapes
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.black
            ),
            child: Column(
              children: [
                ShapeRow(shapeWidgets: shapeWidgets),
                ShapeRow(shapeWidgets: shapeWidgets),
                ShapeRow(shapeWidgets: shapeWidgets),
                ShapeRow(shapeWidgets: shapeWidgets),
                ShapeRow(shapeWidgets: shapeWidgets),
                ShapeRow(shapeWidgets: shapeWidgets),
                ShapeRow(shapeWidgets: shapeWidgets),
              ],
            )
          ),

          // Child widget
          child,
        ],
      ),
    );
  }
}

class ShapeRow extends StatelessWidget {
  const ShapeRow({
    super.key,
    required this.shapeWidgets,
  });

  final List<Widget> shapeWidgets;

  @override
  Widget build(BuildContext context) {
    shapeWidgets.shuffle();
    return Row(children: shapeWidgets);
  }
}

class _Circle extends StatelessWidget {
  final double borderSize;

  const _Circle(this.borderSize);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: borderSize,
      height: borderSize,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(50)
      ),
    );
  }
}

class _Square extends StatelessWidget {
  final double borderSize;

  const _Square(this.borderSize);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: borderSize,
      height: borderSize,
      decoration: const BoxDecoration(
        color: Colors.white10,
      ),
    );
  }
}

class _RightTriangle extends StatelessWidget {
  final double borderSize;

  const _RightTriangle(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _RightTrianglePainter(),
      ),
    );
  }
}

class _RightTrianglePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;

    final path = Path();
    path..lineTo(size.width, 0)
        ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_RightTrianglePainter oldDelegate) => false;
}


class _LeftTriangle extends StatelessWidget {
  final double borderSize;

  const _LeftTriangle(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _LeftTrianglePainter(),
      ),
    );
  }
}

class _LeftTrianglePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;

    final path = Path();
    path..lineTo(size.width, 0)
        ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_LeftTrianglePainter oldDelegate) => false;
}


class _Diamond extends StatelessWidget {
  final double borderSize;

  const _Diamond(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _DiamondPainter(),
      ),
    );
  }
}

class _DiamondPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;

    final path = Path();
    path..moveTo(size.width * 0.5, 0 )
        ..lineTo(0, size.height * 0.5)
        ..lineTo(size.width * 0.5, size.height)
        ..lineTo(size.width, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_DiamondPainter oldDelegate) => false;
}


class _SemiCircle extends StatelessWidget {
  final double borderSize;

  const _SemiCircle(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _SemiCirclePainter(),
      ),
    );
  }
}

class _SemiCirclePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height/2, size.width/2), 
        width: size.width, 
        height: size.height
      ), 
      pi, 
      pi, 
      false, 
      paint
    );
  }

  @override
  bool shouldRepaint(_SemiCirclePainter oldDelegate) => false;
}
class _SemiCircleInverted extends StatelessWidget {
  final double borderSize;

  const _SemiCircleInverted(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _SemiCircleInvertedPainter(),
      ),
    );
  }
}

class _SemiCircleInvertedPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height/2, size.width/2), 
        width: size.width, 
        height: size.height
      ), 
      pi, 
      -pi, 
      false, 
      paint
    );
  }

  @override
  bool shouldRepaint(_SemiCircleInvertedPainter oldDelegate) => false;
}

