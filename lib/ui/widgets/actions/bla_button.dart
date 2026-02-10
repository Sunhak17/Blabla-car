import 'package:flutter/material.dart';
import '../../theme/theme.dart';

enum ButtonType {
  primary,
  secondary,
}

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;

  const BlaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
  });

  Color get buttonColor => type == ButtonType.primary ? BlaColors.primary : BlaColors.white;

  Color get textColor => type == ButtonType.primary ? BlaColors.white : BlaColors.primary;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: type == ButtonType.primary
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: textColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(BlaSpacings.radius),
                ),
                padding: EdgeInsets.all(BlaSpacings.m),
              ),
              child: _buildContent(textColor),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: textColor,
                backgroundColor: buttonColor,
                side: BorderSide(color: BlaColors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(BlaSpacings.radius),
                ),
                padding: EdgeInsets.all(BlaSpacings.m),
              ),
              child: _buildContent(textColor),
            ),
    );
  }

  Widget _buildContent(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20, color: color),
          SizedBox(width: 8),
        ],
        Text(text, style: BlaTextStyles.button.copyWith(color: color)),
      ],
    );
  }
}
