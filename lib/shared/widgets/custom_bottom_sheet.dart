import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/filled_button_custom.dart';

class CustomBottomSheet {
  static void showBottomSheetSuccess({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xlg,
            vertical: AppSpacing.xlg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/images/success.png'),
                height: 180,
              ),
              Text(
                'Congratulations!',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Your account is ready to use. You will be redirected to the Homepage in a few seconds.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: AppSpacing.lg),
              FilledButtonCustom(
                onPressed: onPressed,
                text: 'Continue',
              ),
              SizedBox(height: AppSpacing.sm)
            ],
          ),
        );
      },
    );
  }

  static Future<void> successOrder(
    BuildContext context, {
    required VoidCallback onViewOrder,
  }) async {
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: Duration(milliseconds: 300),
      )..forward(),
      context: context,
      constraints: BoxConstraints(
        maxHeight: 450,
      ),
      isScrollControlled: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSpacing.lg),
                topRight: Radius.circular(AppSpacing.lg),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: AppSpacing.md),
                Center(
                  child: Image(
                    image: AssetImage('assets/images/onboarding3.png'),
                    fit: BoxFit.cover,
                    width: 180,
                    height: 180,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Order Successfully!',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  'Your order is ready to place',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.kGreyColor,
                      ),
                ),
                const Spacer(),
                CustomElevated(
                  onPressed: onViewOrder,
                  text: 'Done',
                ),
                const SizedBox(height: AppSpacing.xlg),
              ],
            ),
          ),
        );
      },
    );
  }
}
