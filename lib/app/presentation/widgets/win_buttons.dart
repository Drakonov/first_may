import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

const borderColor = Color(0xFF805306);

const backgroundStartColor = Color(0xFFFFD500);
const backgroundEndColor = Color(0xFFF6A00C);

class WindowsButtons extends StatelessWidget {
  const WindowsButtons({Key? key, this.onTapMinimize, this.onTapClose}) : super(key: key);

  final VoidCallback? onTapMinimize;
  final VoidCallback? onTapClose;

  @override
  Widget build(BuildContext context) {
    print('was rebuild');
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [backgroundStartColor, backgroundEndColor],
              stops: [0.0, 1.0]),
        ),
        child: Column(children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(child: MoveWindow()),
                WindowButtons(
                  onTapMinimize: onTapMinimize,
                  onTapClose: onTapClose,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key, this.onTapMinimize, this.onTapClose}) : super(key: key);

  final VoidCallback? onTapMinimize;
  final VoidCallback? onTapClose;

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: buttonColors,
          onPressed: widget.onTapMinimize,
        ),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(
          colors: closeButtonColors,
          onPressed: widget.onTapClose,
        ),
      ],
    );
  }
}
