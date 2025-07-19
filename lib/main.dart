import 'package:bookly_app/Features/home/data/repos/home_repos_impl.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_case/fetch_featured_book_use_case.dart';
import 'package:bookly_app/Features/home/domain/use_case/fetch_newest_book_use_case.dart';
import 'package:bookly_app/Features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_route.dart';
import 'package:bookly_app/core/utils/bloc_observer.dart';
import 'package:bookly_app/core/utils/setup_service_relocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(const BooklyApp());
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceRelocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Hive.openBox<BookEntity>(kFeatureBox);
  Hive.openBox<BookEntity>(kNewestBox);
  Hive.openBox<BookEntity>(kSearchBox);
  Bloc.observer = SimpleBlocOpserver();
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureBooksCubit(
            FetchFeaturedBookUseCase(getIt.get<HomeReposImpl>()),
          )..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBookUseCase(getIt.get<HomeReposImpl>()),
          )..fetchNewestBoods(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.route,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
