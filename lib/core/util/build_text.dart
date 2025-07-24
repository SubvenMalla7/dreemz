import 'package:dreemz/core/helper/export.dart';

class BuildText extends StatelessWidget {
  const BuildText(
      {super.key,
      this.text = "",
      this.fontSize = 14.0,
      this.color = Colors.black,
      this.weight = FontWeight.w400,
      this.family = '',
      this.decoration = TextDecoration.none,
      this.textAlign = TextAlign.start,
      this.maxLines,
      this.overFlow,
      this.lineHeight,
      this.italics = false});

  final String text;
  final double fontSize;
  final double? lineHeight;
  final Color color;
  final FontWeight weight;
  final TextDecoration decoration;
  final TextAlign textAlign;
  final int? maxLines;
  final bool italics;
  final String? family;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overFlow,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fontSize,
        color: color,
        fontStyle: italics ? FontStyle.italic : FontStyle.normal,
        decoration: decoration,
        fontFamily: "Poppins",
        height: lineHeight,
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.icon,
      required this.hintText,
      this.borderColor,
      this.onChanged,
      this.isSearch = false,
      this.isLogin = false});

  final TextEditingController controller;
  final bool obscureText;
  final IconData icon;
  final String hintText;
  final Color? borderColor;
  final bool isLogin;
  final bool isSearch;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isLogin ? 30 : 6),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon,
              color: isLogin ? AppColors.loginAppBarColor : borderColor),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: isSearch ? 4.sp : null,
            color: isLogin ? AppColors.loginFormHintColor : Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(isLogin ? 30 : 15),
            borderSide: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        onChanged: onChanged,
        textInputAction:
            obscureText ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }
}
