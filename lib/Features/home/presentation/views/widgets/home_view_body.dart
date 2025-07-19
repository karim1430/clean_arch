import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_builder.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/feature_books_list_view.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_bloc_builder.dart';
import 'feature_ books_list_view_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
        // Wrap the Column in SingleChildScrollView
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeatureBooksListViewBlocBuilder(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 20),
                  child: Text(
                    'Best Seller',
                    style: Style.textStyle18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BestSellerListViewBlocBuilder(),
              ],
            ),
          ),
        ]);
  }
}
