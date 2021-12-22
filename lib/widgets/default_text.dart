import 'package:flutter/material.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/Theme/themes.dart';

Widget DefaultTextField(
    {
      required TextEditingController controller,
      FocusNode? focusNode,
      String? label,
      Color? backgroundColor,
      IconData? prefixIcon,
      Widget? suffixIcon,
      int maxLine = 1,
      TextInputType textInputType = TextInputType.text,
      bool obscureText = false,
      String? hint,
      bool enable = true,
      Function? onTap,
      bool isRequired = false,
      bool borderEnable = true,
      bool enableValidation = true}) {
  return GestureDetector(
    // onTap: onTap(),
    child: AbsorbPointer(
      absorbing: onTap != null,
      child: TextFormField(
        style: TextStyle(
            color: Themes.Text_Color,
            fontSize: Dimension.Text_Size,
            fontWeight: Dimension.textNormal),
        controller: controller,
        focusNode: focusNode,
        autocorrect: false,
        keyboardType: textInputType,
        cursorColor: Themes.Primary,
        maxLines: maxLine,
        enabled: enable,
        obscureText: obscureText,
        textInputAction: TextInputAction.done,
        validator: enableValidation
            ? (String? value) {
          if (value!.isEmpty ) {
            if (focusNode != null) focusNode.requestFocus();
            return label != null
                ? 'this is required'
                : 'this is required';
          } else {
            return null;
          }
        }
            : null,
        decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: label != null ? Dimension.Padding : 5,
                bottom: label != null ? Dimension.Padding : 5),
            fillColor: enable
                ? backgroundColor ?? Themes.Primary.withAlpha(15)
                : Colors.transparent,
            enabledBorder: borderEnable ? textFieldBorder() : InputBorder.none,
            focusedBorder: borderEnable ? textFieldBorder() : InputBorder.none,
            errorBorder: borderEnable
                ? textFieldBorder(isError: true)
                : InputBorder.none,
            border: borderEnable ? textFieldBorder() : InputBorder.none,
            labelText: label != null ? '$label${isRequired ? '*' : ''}' : null,
            labelStyle: TextStyle(
                color: Themes.Text_Color,
                fontSize: Dimension.Text_Size,
                fontWeight: Dimension.textNormal),
            prefixIcon: prefixIcon != null
                ? Icon(
              prefixIcon,
              color: Themes.Primary,
            )
                : null,
            errorStyle: TextStyle(
                fontSize: Dimension.Text_Size_Small_Extra, color: Themes.Red),
            suffixIcon: suffixIcon != null ? suffixIcon : null,
            hintText: hint),
      ),
    ),
  );
}

textFieldBorder({bool isError = false}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
        width: 2, color: isError ? Themes.Red : Themes.TexftFieldBorder),
  );
}

