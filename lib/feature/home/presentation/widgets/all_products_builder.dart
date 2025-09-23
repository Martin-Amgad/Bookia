import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/data/models/book_list_rsponse/product.dart';
import 'package:bookia/feature/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllProductsBuilder extends StatelessWidget {
  const AllProductsBuilder({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('All products', style: TextStyles.getSize24()),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyles.getSize18(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
        Gap(15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 280,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return BookCard(product: products[index]);
          },
        ),
      ],
    );
  }
}
