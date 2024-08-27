import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/modules/orders/presenter/orders_page.dart';
import 'package:zalada_flutter/modules/product/models/model_detail.dart';
import 'package:zalada_flutter/modules/product/widgets/add_to_cart.dart';
import 'package:zalada_flutter/modules/wishlist/models/product_wishlist.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/product_card.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static const routePath = '/product-detail';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late CarouselController carouselController;
  late TextEditingController memoryController;
  late TextEditingController storageController;

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();
    memoryController = TextEditingController(text: '8GB Unified memory');
    storageController = TextEditingController(text: '256GB SSD storage');
  }

  @override
  void dispose() {
    super.dispose();
    memoryController.dispose();
    storageController.dispose();
  }

  int current = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          onLeft: () {
            Navigator.pop(context);
          },
          onRight: () {},
          title: '',
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              context.pop();
              pageController.jumpToPage(3);
              print('Go to cart');
            },
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kColorGray400,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: -2.0,
                    blurRadius: 12.0,
                  ),
                ],
              ),
              child: Icon(
                IconlyLight.buy,
                color: Colors.black.withOpacity(0.9),
                size: 20,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xxxlg,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "MX Master 3S Wireless Mouse",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$109',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kColorBlue,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            '\$125',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: modelDetail[currentColor].image.length,
                  carouselController: carouselController,
                  itemBuilder: (context, index, realIndex) {
                    return Image(
                      image: NetworkImage(
                        modelDetail[currentColor].image[index].image,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 210,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 8),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: modelDetail[currentColor].image.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          carouselController.animateToPage(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(AppSpacing.xs),
                          margin: const EdgeInsets.only(
                            right: AppSpacing.sm,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSpacing.sm),
                            border: Border.all(
                              color: current == index
                                  ? AppColors.kPrimaryColor
                                  : AppColors.kColorGray200,
                            ),
                          ),
                          child: Image(
                            image: NetworkImage(
                              modelDetail[currentColor].image[index].image,
                            ),
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xxxlg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        modelDetail[currentColor].nameColor,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            modelDetail.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentColor = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(AppSpacing.xxs),
                                margin: const EdgeInsets.only(
                                  right: AppSpacing.sm,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: currentColor == index
                                        ? AppColors.kPrimaryColor
                                        : Colors.grey.withOpacity(0.5),
                                    width: 2,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(AppSpacing.md),
                                  decoration: BoxDecoration(
                                    color: modelDetail[index].color,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: AppSpacing.lg,
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       LabelText(label: 'Memory'),
                //       const SizedBox(height: AppSpacing.xs),
                //       CustomTextFieldForms(
                //         controller: memoryController,
                //         hintText: 'Select Memory',
                //         suffixIcon: PhosphorIconsRegular.caretDown,
                //         onTap: () {
                //           print('Select Memory');
                //         },
                //       ),
                //       const SizedBox(height: AppSpacing.md),
                //       LabelText(label: 'Storage'),
                //       const SizedBox(height: AppSpacing.xs),
                //       CustomTextFieldForms(
                //         controller: storageController,
                //         suffixIcon: PhosphorIconsRegular.caretDown,
                //         hintText: 'Select Storage',
                //         onTap: () {
                //           print('Select Storage');
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: AppSpacing.md),
                Divider(
                  color: AppColors.kColorGray200,
                  thickness: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Description',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "Introducing Quiet Clicks – create, make and do with the same click feel, but less noise. Quiet Clicks deliver satisfying, soft tactile feedback with 90% less click noise14Compared to MX Master 3, MX Master 3S has 90% less Sound Power Level left and right click, measured at 1m..",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              maxLines: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Divider(
                  color: AppColors.kColorGray200,
                  thickness: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppSpacing.lg,
                        bottom: AppSpacing.lg,
                      ),
                      child: Text(
                        'Related Products',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productWishlist.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            size: AppSpacing.lg,
                            title: productWishlist[index].title,
                            image: productWishlist[index].image,
                            status: productWishlist[index].status,
                            originalPrice: productWishlist[index].originalPrice,
                            salePrice: productWishlist[index].salePrice,
                            type: productWishlist[index].type,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.xxxlg),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xlg,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showBottomSheet(
                          context: context,
                          title: 'Add to cart',
                          onPressed: () {
                            context.pop();
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kRedColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.md,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.xxlg),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showBottomSheet(
                            context: context,
                            title: 'Checkout',
                            onPressed: () {
                              context.pop();
                              context.push(OrdersPage.routePath);
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.md,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.xxlg),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Buy now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet({
    required BuildContext context,
    required String title,
    required VoidCallback onPressed,
  }) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isDismissible: false,
      enableDrag: false,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 500),
      ),
      builder: (BuildContext context) {
        return AddToCart(
          title: title,
          onPressed: onPressed,
        );
      },
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
    );
  }
}
