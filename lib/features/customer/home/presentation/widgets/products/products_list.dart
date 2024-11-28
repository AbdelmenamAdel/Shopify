import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/custom_product_item.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    required this.productList,
    super.key,
  });

  final List<GetAllProductsModel> productList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      sliver: SliverGrid.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Number of cloums
          crossAxisSpacing: 8, // Spacing between colums
          mainAxisSpacing: 15, //Spacing between rows
          childAspectRatio: 165 / 250,
        ),
        itemBuilder: (context, index) {
          return CustomProductItem(
            price: productList[index].price ?? 0,
            categoryName: productList[index].category!.name ?? '',
            title: productList[index].title ?? '',
            imageUrl: productList[index].images!.first,
            productId: int.parse(productList[index].id ?? '0'),
          );
        },
      ),
    );
  }
}
