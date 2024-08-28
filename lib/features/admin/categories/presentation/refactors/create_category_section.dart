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
import 'package:shopify/features/admin/categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:shopify/features/admin/categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:shopify/features/admin/categories/presentation/widgets/create/create_category_bottom_widget.dart';

class CreateCategorySection extends StatelessWidget {
  const CreateCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Categories',
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
                    create: (context) => sl<CreateCategoryBloc>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<UploadImageCubit>(),
                  ),
                ],
                child: const CreateCategoryBottomSheetWidget(),
              ),
              whenComplete: () {
                context.read<GetAllAdminCategoriesBloc>().add(
                      const GetAllAdminCategoriesEvent.fetchAdminCategories(
                        isNotLoading: false,
                      ),
                    );
              },
            );
          },
          lastRadius: 10,
          threeRadius: 10,
          backgroundColor: ColorsDark.blueDark,
          text: 'Add',
          width: 90.w,
          height: 35.h,
        ),
      ],
    );
  }
}
