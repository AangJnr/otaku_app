import 'package:flutter/material.dart';

import '../../../utils/validators.dart';
import '../../config/theme_setup.dart';

class LabeledFormField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final Widget? suffixIcon;
  final bool isDone;
  final TextInputType inputType;
  final String hint;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Function? onSaved;
  final ValueChanged<String?>? onChanged;
  final bool showKeyboard;
  final Function? onTapped;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final String? errorMessage;
  final TextEditingController? controller;
  final bool hasError;
  final Color? accentColor;
  TextEditingController c = TextEditingController();

  LabeledFormField(
      {Key? key, this.accentColor,
      this.label = '',
      this.hint = "",
      this.isRequired = false,
      this.isDone = false,
      this.inputType = TextInputType.text,
      this.focusNode,
      this.nextFocus, this.hasError =false,
      this.suffixIcon,
      this.showKeyboard = true,
      this.errorMessage,
      this.onTapped,
      this.controller,
      this.onChanged,
      this.textInputAction = TextInputAction.next,
      this.initialValue,
      this.textCapitalization = TextCapitalization.none,
      this.onSaved})
      : super(key: key);
  String? errorMsg;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).primaryTextTheme.bodySmall;
    if (initialValue?.isNotEmpty == true) {
      c.text = initialValue!;
      c.selection = TextSelection(
        baseOffset: initialValue?.length ?? 0,
        extentOffset: initialValue?.length ?? 0,
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 85,
      child: TextFormField(
        key: ValueKey(label),
        keyboardType: inputType,
        focusNode: focusNode,
        showCursor: showKeyboard,
        cursorColor: accentColor,
        style: textStyle?.copyWith(color:  Colors.black87, fontSize: 14),
        obscureText: inputType == TextInputType.visiblePassword,
        onTap: () {
          onTapped?.call();
        },
        controller: controller ?? c,
        readOnly: !showKeyboard,
        textCapitalization: textCapitalization,
        textInputAction: isDone ? TextInputAction.done : textInputAction,
        decoration: InputDecoration(
          errorMaxLines: 1,
          hintText: hint,
          hintStyle:   textStyle?.copyWith(
              color: Colors.grey[300],
              fontSize: 13,
            ),
          filled: true,
          fillColor: Colors.white,
          errorText: errorMsg,
          label: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Text.rich(
              TextSpan(
                text: label,
                style:    textStyle?.copyWith(
                    color: accentColor,
                    fontSize: 13, ),
                children: [
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall
                          ?.copyWith(
                            color: Colors.red,
                          ),
                    )
                ],
              ),
            ),
          ),
          errorStyle:  textStyle?.copyWith(
            color: Colors.red,
            fontSize: 10,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5, color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5, color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:   BorderSide(width: 1, color: accentColor ?? Colors.black87)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 1.5,
                  color: hasError ? Colors.red : accentColor ?? Colors.black87)),
          suffixIcon:
              Padding(padding: const EdgeInsets.all(12.0), child: suffixIcon),
        ),
        onFieldSubmitted: (_) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        onChanged: (value) => onChanged?.call(value),
        validator: (val) {
          if (!isRequired) return null;
          if (inputType == TextInputType.emailAddress) {
            errorMsg = Validators.validateEmail(val!);
          } else if (inputType == TextInputType.visiblePassword) {
            errorMsg = Validators.validatePassword(val!);
          } else if (inputType == TextInputType.phone) {
            errorMsg = Validators.validatePhoneNumber(val!);
          } else {
            errorMsg = Validators.validateEmpty(val!);
          }
          if (errorMsg == null || errorMsg?.trim().isEmpty == true) return null;
          return ('$errorMessage\n$errorMsg').trim();
        },
        onSaved: (newValue) => onChanged?.call(newValue),
      ),
    );
  }
}
