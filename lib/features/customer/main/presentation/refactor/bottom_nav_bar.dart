import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify/core/common/animations/animate_do.dart';
import 'package:shopify/core/enums/nav_bar_enum.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/images/app_images.dart';
import 'package:shopify/features/customer/main/presentation/manager/cubit/main_cubit.dart';
import 'package:shopify/features/customer/main/presentation/widgets/icon_tap_nav_bar.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 800,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 90.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 75.h,
                    width: MediaQuery.of(context).size.width,
                    color: context.color.navBarbg,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 50.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: BlocBuilder<MainCubit, MainState>(
                            builder: (context, state) {
                              final cubit = context.read<MainCubit>();
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconTapNavBar(
                                    onTap: () {
                                      cubit.changeBottomNav(
                                        NavBarEnum.home,
                                      );
                                    },
                                    icon: AppImages.homeTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.home,
                                  ),
                                  IconTapNavBar(
                                    onTap: () {
                                      cubit.changeBottomNav(
                                        NavBarEnum.notification,
                                      );
                                    },
                                    icon: AppImages.categoriesTab,
                                    isSelected: cubit.navBarEnum ==
                                        NavBarEnum.notification,
                                  ),
                                  IconTapNavBar(
                                    onTap: () {
                                      cubit.changeBottomNav(
                                        NavBarEnum.favorites,
                                      );
                                    },
                                    icon: AppImages.favouritesTab,
                                    isSelected: cubit.navBarEnum ==
                                        NavBarEnum.favorites,
                                  ),
                                  IconTapNavBar(
                                    onTap: () {
                                      cubit.changeBottomNav(
                                        NavBarEnum.profile,
                                      );
                                    },
                                    icon: AppImages.profileTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.profile,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -9,
                left: -8,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(context.assets.bigNavBar!),
                    ),
                  ),
                ),
              ),
              //Car Icon
              Positioned(
                left: 35,
                top: 15,
                child: SvgPicture.asset(
                  AppImages.carShop,
                  color: Colors.white,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
