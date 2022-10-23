import 'dart:ui' as ui;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../domain/paint_history/paint_history.dart';

class Painter extends StatefulWidget {
  final PaintController paintController;
  final int index;

  Painter({required this.paintController, required this.index})
      : super(key: ValueKey<PaintController>(paintController));

  @override
  State<Painter> createState() => _PainterState();
}

class _PainterState extends State<Painter> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: GestureDetector(
        onPanStart: _onPaintStart,
        onPanUpdate: _onPaintUpdate,
        onPanEnd: _onPaintEnd,
        child: RepaintBoundary(
            key: _globalKey,
            child: CustomPaint(
              willChange: true,
              painter: _CustomPainter(
                widget.paintController._paintHistory,
                repaint: widget.paintController,
              ),
            )),
      ),
    );
  }

  void _onPaintStart(DragStartDetails start) {
    widget.paintController._paintHistory
        .addPaint(_getGlobalToLocalPosition(start.globalPosition));
    widget.paintController._notifyListeners();
  }

  void _onPaintUpdate(DragUpdateDetails update) {
    widget.paintController._paintHistory
        .updatePaint(_getGlobalToLocalPosition(update.globalPosition));
    widget.paintController._notifyListeners();
  }

  void _onPaintEnd(DragEndDetails end) {
    widget.paintController._paintHistory.endPaint();
    widget.paintController._notifyListeners();
    _exportToImage();
  }

  void _exportToImage() async {
    final boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    while (true) {
      if (!boundary.debugNeedsPaint) break;

      await Future.delayed(const Duration(milliseconds: 20));
      continue;
    }

    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final storage = FirebaseStorage.instance;
    await storage.ref("writings/${widget.index}.png").putData(pngBytes);
    // TODO: RealtimeDatabaseを更新
  }

  Offset _getGlobalToLocalPosition(Offset global) {
    return (context.findRenderObject() as RenderBox).globalToLocal(global);
  }
}

class _CustomPainter extends CustomPainter {
  final PaintHistory _paintHistory;

  _CustomPainter(this._paintHistory, {required Listenable repaint})
      : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    _paintHistory.draw(canvas, size);
  }

  @override
  bool shouldRepaint(_CustomPainter oldDelegate) => true;
}

class PaintController extends ChangeNotifier {
  final _paintHistory = PaintHistory();
  get paintHistory => _paintHistory;

  final _drawColor = Color.fromARGB(255, 0, 0, 0);
  final double _thickness = 10.0;
  final _backgroundColor = Color.fromARGB(255, 255, 255, 255);

  /*
   * コンストラクタ
   */
  PaintController() : super() {
    // ペイント設定
    Paint paint = Paint();
    paint.color = _drawColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = _thickness;
    _paintHistory.currentPaint = paint;
    _paintHistory.backgroundColor = _backgroundColor;
  }

  /*
   * undo実行
   */
  void undo() {
    _paintHistory.undo();
    notifyListeners();
  }

  /*
   * redo実行
   */
  void redo() {
    _paintHistory.redo();
    notifyListeners();
  }

  /*
   * undo可能か
   */
  bool get canUndo => _paintHistory.canUndo();

  /*
   * redo可能か
   */
  bool get canRedo => _paintHistory.canRedo();

  /*
   * リスナー実行
   */
  void _notifyListeners() {
    notifyListeners();
  }

  /*
   * クリア
   */
  void clear() {
    _paintHistory.clear();
    notifyListeners();
  }
}
