import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/app_values.dart';
import 'package:movies_application/features/fury/presentation/screens/HomeScreen/widgets/appbar_movie_builder.dart';
import 'package:movies_application/features/fury/presentation/screens/HomeScreen/widgets/category_item_builder/category_item_builder.dart';
import 'package:movies_application/core/keys/movies_category_keys.dart';

import '../../../../../core/api/movies_dio_helper.dart';
import '../../../../../core/utils/Colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/strings.dart';
import '../../controller/home_cubit/home_cubit.dart';
import '../../controller/home_cubit/home_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int randomPosterNumber = 0;

  @override
  void initState() {
    super.initState();
    randomPosterNumber = Random().nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s20),
                      color: AppColors.mainColor,
                    ),
                    child: Image(
                      image: const AssetImage('assets/images/logo.png'),
                      height: Helper.maxHeight * 0.05,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(Helper.maxHeight * 0.01),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(AppSize.s20)),
                      child: const Icon(Icons.search),
                    ),
                  )
                ],
              ),
              // pinned: true,
              expandedHeight: Helper.maxHeight * 0.7,
              flexibleSpace: AppBarMovieBuilder(
                movie: trendingMovies!.moviesList[randomPosterNumber],
                image:
                '${MoviesDioHelper.baseImageURL}${trendingMovies!
                    .moviesList[randomPosterNumber].posterPath}',
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Helper.maxHeight * 0.01,
                    vertical: Helper.maxHeight * 0.04),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(onPressed: () {
                            MoviesCubit.get(context).getMovieDetailsData(
                                movie: popularMovies!.moviesList[0]);
                          }, child: Text("TEST", style: TextStyle(
                              color: Colors.blue
                          ),),),
                          CategoryItemBuilder(
                            title: AppStrings.upComingMovies,
                            movies: upComingMovies!.moviesList,
                            category: MoviesCategoryKeys.upComing,
                          ),
                          CategoryItemBuilder(
                            title: AppStrings.trendingMovies,
                            movies: trendingMovies!.moviesList,
                            category: MoviesCategoryKeys.trending,
                          ),
                          CategoryItemBuilder(
                            title: AppStrings.popularMovies,
                            movies: popularMovies!.moviesList,
                            category: MoviesCategoryKeys.popular,
                          ),
                          CategoryItemBuilder(
                            title: AppStrings.topRatedMovies,
                            movies: topRatedMovies!.moviesList,
                            category: MoviesCategoryKeys.topRated,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
