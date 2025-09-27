import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Wishlist',
          style: TextStyles.getSize24(color: AppColors.darkColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppAssets.welcome,
                              height: 120,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Gap(20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'title',
                                      style: TextStyles.getSize18(),
                                    ),

                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.highlight_off),
                                    ),
                                  ],
                                ),
                                Text('285\$', style: TextStyles.getSize16()),
                                Gap(30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MainButton(
                                      title: 'Add To Cart',
                                      onPressed: () {},
                                      width: 180,
                                      height: 40,
                                      borderRadius: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(10);
                  },
                  itemCount: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
