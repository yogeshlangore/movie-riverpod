import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/models/movies.dart';
import 'package:movie_riverpod/presentation/screens/movie_categories.dart';
import 'package:movie_riverpod/presentation/screens/search_screen.dart';
import 'package:movie_riverpod/providers/movies_providers.dart';
import 'package:movie_riverpod/providers/theme_provider.dart';
import 'package:movie_riverpod/utils/constant.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final AsyncValue<List<Result>> nowPlayingMovies =
        ref.watch(nowPlayingMovieFutureProvider);
    final AsyncValue<List<Result>> upComingMovies =
        ref.watch(upComingMovieFutureProvider);
    final AsyncValue<List<Result>> popularMovies =
        ref.watch(popularMovieFutureProvider);
    final AsyncValue<List<Result>> popularTvSeries =
        ref.watch(popularTVSeriesFutureProvider);
    final AsyncValue<List<Result>> topRatedMovies =
        ref.watch(topRatedMoviesFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
              icon: const Icon(Icons.lightbulb)),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              popularTvSeries.when(
                data: (moviesList) {
                  return CarouselSlider.builder(
                    itemCount: moviesList.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          width: width,
                          height: height,
                          imageUrl: '$imageUrl${moviesList[index].posterPath}',
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/netflix.jpg',
                            fit: BoxFit.fitWidth,
                            width: width,
                            height: height,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {},
                    ),
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.blue));
                },
              ),
              Text('Now Playing',
                  style: Theme.of(context).textTheme.headlineMedium!),
              MovieCategories(
                movies: nowPlayingMovies,
              ),
              Text('TopRated Movies',
                  style: Theme.of(context).textTheme.headlineMedium!),
              MovieCategories(
                movies: topRatedMovies,
              ),
              Text('Upcoming Movies',
                  style: Theme.of(context).textTheme.headlineMedium!),
              MovieCategories(
                movies: upComingMovies,
              ),
              Text('Popular Movies',
                  style: Theme.of(context).textTheme.headlineMedium!),
              MovieCategories(
                movies: popularMovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
