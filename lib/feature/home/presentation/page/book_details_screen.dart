import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/data/models/book_list_rsponse/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({
    super.key,
    required this.product,
    required this.source,
  });
  final Product product;
  final String source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${product.price?.split(".")[0]}\$',
                  style: TextStyles.getSize24(),
                ),
              ),

              MainButton(
                title: 'Add To Cart',
                width: 220,
                height: 60,
                bgcolor: AppColors.darkColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBarWithBack(
        action: IconButton(
          icon: SvgPicture.asset(AppAssets.bookmarkSvg),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Hero(
                tag: product.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: product.image ?? '',
                    height: 280,
                  ),
                ),
              ),
              Gap(10),
              Text('${product.name}', style: TextStyles.getSize30()),
              Gap(10),
              Text(
                '${product.category}',
                style: TextStyles.getSize30(color: AppColors.primaryColor),
              ),
              Gap(10),
              Text('${product.description}', style: TextStyles.getSize12()),
            ],
          ),
        ),
      ),
    );
  }
}
