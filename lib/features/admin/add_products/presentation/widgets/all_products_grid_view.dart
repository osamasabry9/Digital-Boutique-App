import 'package:digital_boutique/core/common/loading/empty_screen.dart';
import 'package:digital_boutique/core/common/loading/loading_shimmer.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/product_admin_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductsGridView extends StatelessWidget {
  const AllProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<GetAllAdminProductsBloc>().add(
                const GetAllAdminProductsEvent.getAllProducts(
                  isNotLoading: true,
                ),
              );
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: BlocBuilder<GetAllAdminProductsBloc,
                  GetAllAdminProductsState>(
                builder: (context, state) {
                  return state.when(
                    loading: () {
                      return GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //Number of columns
                          crossAxisSpacing: 8, // Spacing between columns
                          mainAxisSpacing: 15, //Spacing between rows
                          childAspectRatio: 165 / 250,
                        ),
                        itemBuilder: (context, index) {
                          return LoadingShimmer(height: 220.h, width: 165.w);
                        },
                      );
                    },
                    success: (productList) {
                      return GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //Number of columns
                          crossAxisSpacing: 8, // Spacing between columns
                          mainAxisSpacing: 15, //Spacing between rows
                          childAspectRatio: 165 / 250,
                        ),
                        itemBuilder: (context, index) {
                          final product = productList[index];
                          return ProductAdminItem(
                            imageUrl: product.images!.first,
                            title: product.title!,
                            categoryName: product.category!.name!,
                            price: product.price!.toString(),
                          );
                        },
                      );
                    },
                    empty: EmptyScreen.new,
                    error: Text.new,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
