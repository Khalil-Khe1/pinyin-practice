import 'package:flutter/material.dart';

import 'package:pinyin_quiz/features/pages/button.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onOkay,
    required this.onCancel
  });

  final String title;
  final String content;
  final VoidCallback onOkay;
  final VoidCallback onCancel;

  @override
  State<StatefulWidget> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.content),
      actions: [
        DefaultButton(label: 'OK', onPressed: () => widget.onOkay()),
        DefaultButton(label: 'Cancel', onPressed: () => widget.onCancel())
      ]
    );
  }
}