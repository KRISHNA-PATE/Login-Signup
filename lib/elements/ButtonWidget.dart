import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_demo/configs/AppConsts.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget(
      {Key? key,
      required this.color,
      required this.bkg_color,
      this.border_color,
      this.textSize,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final Color bkg_color;
  final Color? border_color;
  final double? textSize;
  final String text;
  final VoidCallback onPressed;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late Color colorSelected;

  @override
  void initState() {
    colorSelected = widget.bkg_color;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w >= 450 ? 60.w : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: colorSelected,
            padding: EdgeInsets.all(1.3.h),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: () {
          setState(() {
            colorSelected = widget.bkg_color.withOpacity(0.5);
          });
          widget.onPressed();
          Future.delayed(Duration(milliseconds: 300), () {
            if (mounted) {
              setState(() {
                colorSelected = widget.bkg_color;
              });
            }
          });
        },
        /*  textColor: widget.color,
        color: colorSelected,
        padding: EdgeInsets.all(1.3.h),*/
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Text(widget.text.tr,
            style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.w600,
              fontSize: widget.textSize ?? ContentTextSize.w,
            )),
      ),
    );
  }
}

class ButtonWidgetWithoutEffect extends StatelessWidget {
  const ButtonWidgetWithoutEffect(
      {Key? key,
      required this.color,
      required this.bkg_color,
      this.border_color,
      this.textSize,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final Color bkg_color;
  final Color? border_color;
  final double? textSize;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w >= 450 ? 60.w : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: bkg_color,
            padding: EdgeInsets.all(100.w >= 600 ? 1.3.h : 2.h),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(text.tr,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: textSize ?? ContentTextSize.w,
            )),
      ),
    );
  }
}
