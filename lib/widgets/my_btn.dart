import 'package:flutter/material.dart';

class MyBtn extends StatefulWidget {
  final String btnName;
  final bool? disabled;
  final IconData? iconName;
  final Color? iconColor;
  final Function onPressed;
  final String? tooltip;

  const MyBtn(
      {Key? key,
      required this.btnName,
      required this.onPressed,
      this.iconName,
      this.disabled,
      this.tooltip,
      this.iconColor})
      : super(key: key);

  @override
  _MyBtnState createState() => _MyBtnState();
}

class _MyBtnState extends State<MyBtn> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: widget.tooltip != null ? widget.tooltip! : '',
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                widget.tooltip == null ? Colors.transparent : Colors.black54),
        child: widget.iconName == null
            ? OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.pressed)
                        ? Colors.orange
                        : Colors.black12;
                    return BorderSide(color: color, width: 3);
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.blueGrey[100]!;
                    if (states.contains(MaterialState.pressed))
                      return Colors.orange;
                    return Colors.lightBlue;
                    // Defer to the widget's default.
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.blueGrey[100]!;
                    return Colors.lightBlue; // Defer to the widget's default.
                  }),
                ),
                onPressed: (widget.disabled != null && widget.disabled == true)
                    ? null
                    : widget.onPressed as void Function()?,
                child: Text(
                  widget.btnName,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : OutlinedButton.icon(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.pressed)
                        ? Colors.orange
                        : Colors.black12;
                    return BorderSide(color: color, width: 3);
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.blueGrey[100];
                    if (states.contains(MaterialState.pressed))
                      return Colors.orange;
                    return Colors.lightBlue;
                    // Defer to the widget's default.
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.blueGrey[100]!;
                    return Colors.lightBlue; // Defer to the widget's default.
                  }),
                ),
                onPressed: (widget.disabled != null && widget.disabled == true)
                    ? null
                    : widget.onPressed as void Function()?,
                label: Text(
                  widget.btnName,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                icon: Icon(
                  widget.iconName,
                  color: widget.iconColor == null
                      ? Colors.green
                      : widget.iconColor,
                ),
              ));
  }
}
