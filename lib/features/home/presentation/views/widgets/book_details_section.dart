import 'package:flutter/material.dart';
import 'package:untitled/features/home/data/models/book_model/book_model.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_list_view_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var widthScreenDevice = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthScreenDevice * .2),
          child: CustomListViewItem(
              imageUrl: book.volumeInfo!.imageLinks!.thumbnail!),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          textAlign: TextAlign.center,
          book.volumeInfo!.title!,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: 4.5,
          countRating: book.volumeInfo!.pageCount!,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
