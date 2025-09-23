import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:bookia/feature/home/presentation/widgets/all_products_builder.dart';
import 'package:bookia/feature/home/presentation/widgets/best_seller_builder.dart';
import 'package:bookia/feature/home/presentation/widgets/homeslider.dart';
import 'package:bookia/feature/home/presentation/widgets/new_arrivals_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(AppAssets.logoSvg, height: 30),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppAssets.searchSvg),
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (state is HomeLoadingState || state is HomeErrorState) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeslider(images: cubit.sliders),
                    Gap(20),
                    BestSellerBuilder(products: cubit.BestSellers),
                    NewArrivalsBuilder(products: cubit.NewArrivals),
                    AllProductsBuilder(products: cubit.AllBooks),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
