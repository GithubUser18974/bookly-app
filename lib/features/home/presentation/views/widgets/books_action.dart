import 'package:flutter/material.dart';
import 'package:untitled/features/home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custome_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomeButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
            ),
          ),
          Expanded(
            child: CustomeButton(
              onPressed: () async {
                Uri uri = Uri.parse(book.volumeInfo!.previewLink!);
                if (!await launchUrl(uri)) {
                  throw Exception('Could not launch $uri');
                }
              },
              fontSize: 16,
              text: 'Free Preview',
              backgroundColor: Color(0xffef8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
