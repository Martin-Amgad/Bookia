import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/data/models/book_list_rsponse/product.dart';
import 'package:bookia/feature/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewArrivalsBuilder extends StatelessWidget {
  const NewArrivalsBuilder({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('New Arrivals', style: TextStyles.getSize24()),
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
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            itemBuilder: (BuildContext context, int index) {
              return BookCard(product: products[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Gap(10);
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
