import 'package:flutter/material.dart';

const BUTTON_COLOR = Color(0xFF424549);

class DefaultButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Color bgColor;
  final double ph;
  final double pv;
  final bool isEnabled;

  const DefaultButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.bgColor = BUTTON_COLOR,
    this.ph = 60,
    this.pv = 20,
    this.isEnabled = true,
  });

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.isEnabled ? widget.onPressed() : null,
      style: TextButton.styleFrom(
        padding: EdgeInsets.fromLTRB(
          widget.ph,
          widget.pv,
          widget.ph,
          widget.pv,
        ),
        backgroundColor: widget.isEnabled
            ? widget.bgColor
            : ([
                Colors.pink,
                Colors.lightGreenAccent,
                Colors.red,
              ].contains(widget.bgColor))
            ? widget.bgColor
            : Colors.black12,
        overlayColor: Colors.transparent,
        //splashFactory: NoSplash.splashFactory,
      ),
      child: Text(widget.label, style: TextStyle(color: Colors.white)),
    );
  }
}
