import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/components/section_title.dart';
import 'package:zalada_flutter/modules/home/presenter/hot_deals_see_all_page.dart';
import 'package:zalada_flutter/modules/home/presenter/see_all_categories_page.dart';
import 'package:zalada_flutter/modules/home/widgets/banner_widget.dart';
import 'package:zalada_flutter/modules/home/widgets/menu_categories.dart';
import 'package:zalada_flutter/modules/home/widgets/profile_home_page.dart';
import 'package:zalada_flutter/modules/home/widgets/see_more.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/modules/notifications/pages/notification_page.dart';
import 'package:zalada_flutter/modules/wishlist/models/product_wishlist.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/product_card.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final TabController tabController;

  

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: NestedScrollView(
        controller: scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.kBackgroundColor,
              floating: true,
              toolbarHeight: 70,
              title: ProfileHomePage(
                name: 'Chorn THOEN',
                image:
                    'https://static.vecteezy.com/system/resources/thumbnails/008/846/297/small_2x/cute-boy-avatar-png.png',
                cartCount: 2,
                notificationCount: 3,
                onCartPressed: () {
                  pageController.jumpToPage(3);
                },
                onNotificationPressed: () {
                  context.push(NotificationPage.routePath);
                },
                onProfilePressed: () {
                  pageController.jumpToPage(4);
                },
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SectionTitle(
                title: 'Hot deals 🔥',
                action: 'See all',
                onAction: () {
                  context.push(HotDealSeeAllPage.routePath);
                },
              ),
              BannerWidget(),
              SizedBox(height: AppSpacing.xs),
              SectionTitle(title: 'Categories'),
              SizedBox(height: AppSpacing.xs),
              MenuCategories(),
              SectionTitle(
                title: 'New Arrivals 🚀',
                action: 'See all',
                onAction: () {
                  context.push(SeeAllCategoriesPage.routePath);
                },
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productWishlistPhone.length <= 6
                      ? productWishlistPhone.length
                      : 6,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  itemBuilder: (context, index) {
                    final item = productWishlistPhone[index];
                    //see more
                    if (index == 6 - 1 && productWishlistPhone.length > 6) {
                      return SeeMore(
                        onTap: () {
                          context.push(SeeAllCategoriesPage.routePath);
                        },
                      );
                    }
                    return ProductCard(
                      size: AppSpacing.lg,
                      title: item.title,
                      image: item.image,
                      status: item.status,
                      originalPrice: item.originalPrice,
                      salePrice: item.salePrice,
                      type: item.type,
                    );
                  },
                ),
              ),
              SectionTitle(
                title: 'Popular Products 🥇',
                action: 'See all',
                onAction: () {
                  context.push(SeeAllCategoriesPage.routePath);
                },
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productWishlistPhone.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  itemBuilder: (context, index) {
                    final item = productWishlistPhone[index];
                    return ProductCard(
                      size: AppSpacing.lg,
                      title: item.title,
                      image: item.image,
                      status: item.status,
                      originalPrice: item.originalPrice,
                      salePrice: item.salePrice,
                      type: item.type,
                    );
                  },
                ),
              ),
              SectionTitle(
                title: 'Best Deals',
                action: 'See all',
                onAction: () {
                  context.push(SeeAllCategoriesPage.routePath);
                },
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productWishlistPhone.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  itemBuilder: (context, index) {
                    final item = productWishlistPhone[index];
                    return ProductCard(
                      size: AppSpacing.lg,
                      title: item.title,
                      image: item.image,
                      status: item.status,
                      originalPrice: item.originalPrice,
                      salePrice: item.salePrice,
                      type: item.type,
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.xxxlg),
            ],
          ),
        ),
      ),
    );
  }
}
