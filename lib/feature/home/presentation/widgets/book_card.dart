import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/data/models/book_list_rsponse/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.image ?? '',
                fit: BoxFit.cover,
                width: 150,
                height: 174,
              ),
            ),
          ),
          Gap(5),
          Text(
            product.name ?? '',
            style: TextStyles.getSize18(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(10),
          Row(
            children: [
              Text(
                '${product.price?.split(".")[0]}\$',
                style: TextStyles.getSize18(),
              ),
              Spacer(),
              MainButton(
                title: 'Buy',
                onPressed: () {},
                width: 70,
                height: 30,
                borderRadius: 4,
                bgcolor: AppColors.darkColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
