import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopify/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:shopify/core/common/widgets/custom_button.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/core/styles/fonts/font_family_helper.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/admin/categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:shopify/features/admin/products/presentation/bloc/create_product/create_prodcut_bloc.dart';
import 'package:shopify/features/admin/products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:shopify/features/admin/products/presentation/widgets/create/create_product_bottom_sheet.dart';

class CreateProductSection extends StatelessWidget {
  const CreateProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Products',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.medium,
            fontFamily: FontFamilyHelper.poppinsEnglish,
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl<CreateProdcutBloc>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<UploadImageCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<GetAllAdminCategoriesBloc>()
                      ..add(
                        const GetAllAdminCategoriesEvent.fetchAdminCategories(
                          isNotLoading: false,
                        ),
                      ),
                  ),
                ],
                child: const CreateProductBottomSheet(),
              ),
              whenComplete: () {
                context.read<GetAllAdminProductsBloc>().add(
                      const GetAllAdminProductsEvent.getAllProducts(
                        isNotLoading: false,
                      ),
                    );
              },
            );
          },
          backgroundColor: ColorsDark.blueDark,
          lastRadius: 10,
          threeRadius: 10,
          text: 'Add',
          width: 90.w,
          height: 35.h,
        ),
      ],
    );
  }
}
