import 'package:flutter/material.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/features/home/presentation/views/widgets/book_rating.dart';

import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_list_view_item.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var widthScreenDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          CustomAppBarBookDetail(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreenDevice * .2),
            child: CustomListViewItem(),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: 0.7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(
            height: 37,
          ),
          BooksAction(),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You May also Like',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SimilarBooksListView(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
