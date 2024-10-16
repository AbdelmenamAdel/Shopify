import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/core/styles/fonts/font_family_helper.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/admin/users/data/models/get_all_users_response.dart';
import 'package:shopify/features/admin/users/presentation/widgets/delete_user_icon.dart';
import 'package:shopify/features/admin/users/presentation/widgets/table_cell_title_widget.dart';

class TableOfUsers extends StatelessWidget {
  const TableOfUsers({
    required this.usersList,
    super.key,
  });
  final List<UserModel> usersList;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorsDark.blueLight),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(110.w),
        1: const FlexColumnWidth(),
        2: FixedColumnWidth(85.w),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(
            color: ColorsDark.blueDark,
          ),
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                title: 'Name',
                icon: Icons.person,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                title: 'Email',
                icon: Icons.email_outlined,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                title: 'Delete',
                icon: Icons.delete_forever,
              ),
            ),
          ],
        ),
        ...List.generate(
          usersList.length,
          (index) => TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextApp(
                    text: usersList[index].name ?? '',
                    theme: context.textStyle.copyWith(
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontSize: 12.sp,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextApp(
                    text: usersList[index].email ?? '',
                    theme: context.textStyle.copyWith(
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontSize: 12.sp,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DeleteUserIcon(
                    userId: usersList[index].id ?? '',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
