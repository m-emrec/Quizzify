import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/image_icon_extensions.dart';
import 'package:trivia/core/shared/widgets/buttons/responsive_button.dart';

class ResponsiveElevatedButton extends ResponsiveButton {
  const ResponsiveElevatedButton({
    super.key,
    required super.label,
    super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors().elevatedButtonColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          padding: AppPaddings().elevatedButtonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius().buttonBorderRadius,
          ),
        ),
        onPressed: onPressed,
        child: Text(label ?? ""),
      ),
    );
  }
}

class ResponsiveOutlineButton extends ResponsiveButton {
  const ResponsiveOutlineButton({
    super.key,
    required super.label,
    required super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: AppPaddings().elevatedButtonPadding,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors().outlinedButtonBorderColor,
            ),
            borderRadius: AppBorderRadius().buttonBorderRadius,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label ?? "",
        ),
      ),
    );
  }
}

class ResponsiveGoogleSignInButton extends ResponsiveButton {
  const ResponsiveGoogleSignInButton({
    super.key,
    super.label,
    super.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: AppPaddings().elevatedButtonPadding -
              const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius().buttonBorderRadius,
          ),
          side: BorderSide(
            color: AppColors().outlinedButtonBorderColor,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 24,
              child: Image.asset(
                "google-icon.png".toIcon,
              ),
            ),
            // 16.pw,
            Text(
              label ?? "",
              style: context.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveFacebookButton extends ResponsiveButton {
  const ResponsiveFacebookButton({
    super.key,
    super.label,
    super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff0056b2),
          padding: AppPaddings().elevatedButtonPadding -
              const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius().buttonBorderRadius,
          ),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
            ),
            // 16.pw,
            Text(
              label ?? "",
              style:
                  context.textTheme.labelLarge?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
