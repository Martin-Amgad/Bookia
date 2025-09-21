import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/presentation/widgets/homeslider.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppAssets.logoSvg, height: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.searchSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeslider(),
              Gap(20),
              Text('Best Sellers', style: TextStyles.getSize24()),
              Gap(15),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(
                        AppAssets.welcome,
                        fit: BoxFit.cover,
                        width: 150,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(10);
                  },
                  itemCount: 5,
                ),
              ),
              // Text('New Arrivals', style: TextStyles.getSize24()),
              // Gap(15),
              // SizedBox(
              //   height: 200,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,

              //     itemBuilder: (BuildContext context, int index) {
              //       return ClipRRect(
              //         borderRadius: BorderRadiusGeometry.circular(10),
              //         child: Image.asset(
              //           AppAssets.welcome,
              //           fit: BoxFit.cover,
              //           width: 150,
              //         ),
              //       );
              //     },
              //     separatorBuilder: (BuildContext context, int index) {
              //       return Gap(10);
              //     },
              //     itemCount: 5,
              //   ),
              // ),
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //   ),
              //   itemBuilder: (context, index) {
              //     return Container(child: SvgPicture.asset(AppAssets.appleSvg));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
