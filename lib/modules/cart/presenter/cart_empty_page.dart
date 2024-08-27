import 'package:flutter/material.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/filled_button_custom.dart';

class CartEmptyPage extends StatelessWidget {
  const CartEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        children: [
          Image.asset(
            'assets/images/onboarding3.png',
            width: 200,
            height: 160,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Your cart is empty',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxlg),
            child: Text(
              'Looks like you haven\'t added anything to your cart yet',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButtonCustom(
            onPressed: () {
              pageController.jumpToPage(0);
            },
            text: 'Start Shopping',
          ),
          SizedBox(height: AppSpacing.xs),
        ],
      ),
    );
  }
}
