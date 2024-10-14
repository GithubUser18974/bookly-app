import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/core/utils/service_locator.dart';
import 'package:untitled/features/home/data/models/book_model/book_model.dart';
import 'package:untitled/features/home/data/repos/home_repo_imple.dart';
import 'package:untitled/features/home/presentation/manager/similar_books/cubit/similar_books_cubit.dart';
import 'package:untitled/features/home/presentation/views/book_details_view.dart';
import 'package:untitled/features/home/presentation/views/home_view.dart';
import 'package:untitled/features/search/presentation/views/search_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/detailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                ),
            child: BookDetailsView(
              book: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}
