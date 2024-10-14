import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/core/utils/app_router.dart';
import 'package:untitled/core/widgets/custome_error_widget.dart';
import 'package:untitled/core/widgets/custome_loading_indecator.dart';
import 'package:untitled/features/home/presentation/manager/featured_books/cubit/featured_books_cubit.dart';

import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (BuildContext context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetailsView,
                            extra: state.books[index]);
                      },
                      child: CustomListViewItem(
                        imageUrl: state
                            .books[index].volumeInfo!.imageLinks!.thumbnail!,
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          //Failure State
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          // Initial State
          return CustomeLoadingIndecator();
        }
      },
    );
  }
}
