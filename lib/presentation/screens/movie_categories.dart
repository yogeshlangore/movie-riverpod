import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/models/movies.dart';
import 'package:movie_riverpod/presentation/screens/movies_details_screen.dart';
import 'package:movie_riverpod/utils/constant.dart';

class MovieCategories extends ConsumerWidget {
  const MovieCategories({super.key, required this.movies});
  final AsyncValue<List<Result>> movies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.20,
      child: movies.when(
        data: (moviesList) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(
                      result: moviesList[index],
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: '$imageUrl${moviesList[index].posterPath}',
                        width: 125,
                        height: 125,
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/netflix.jpg'),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () {
          return const Center(child: CircularProgressIndicator(color: Colors.blue));
        },
      ),
    );
  }
}
