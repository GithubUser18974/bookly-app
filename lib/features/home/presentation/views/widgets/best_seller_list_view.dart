import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/widgets/custome_error_widget.dart';
import 'package:untitled/core/widgets/custome_loading_indecator.dart';
import 'package:untitled/features/home/presentation/manager/newest_books/cubit/newest_books_cubit.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (BuildContext context, state) {
      if (state is NewestBooksSuccess) {
        return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.books.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  book: state.books[index],
                ),
              );
            });
      } else if (state is NewestBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return CustomeLoadingIndecator();
      }
    });
  }
}
