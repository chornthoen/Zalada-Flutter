import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/modules/home/presenter/detail_category_page.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/models/category.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class MenuCategories extends StatelessWidget {
  const MenuCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push(
                DetailCategoryPage.routePath,
                extra: categories[index].name,
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 16 : 0,
                right: 12,
                bottom: 8,
                top: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSpacing.sm),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kColorGray200,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              constraints: BoxConstraints(
                minWidth: 80,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kColorGray500,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: -2.0,
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        categories[index].icon,
                        color: Theme.of(context).primaryColor,
                        size: AppSpacing.xlg,
                      )),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    categories[index].name,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
