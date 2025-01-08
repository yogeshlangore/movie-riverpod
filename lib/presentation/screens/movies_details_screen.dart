import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movie_riverpod/models/movies.dart';
import 'package:movie_riverpod/repo/hive_repo.dart';
import 'package:movie_riverpod/utils/constant.dart';

class MovieDetailsScreen extends ConsumerWidget {
  const MovieDetailsScreen({super.key, required this.result});

  final Result result;
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HiveRepo hiveRepo = HiveRepo();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
        actions: [
          IconButton(
              onPressed: () {
                hiveRepo.addMovieToHive(result);
              },
              icon: const Icon(Icons.favorite)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: '$imageUrl${result.posterPath}',
                fit: BoxFit.fill,
                width: double.infinity,
                height: 400,
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text(
                        result.originalTitle!.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey),
                      ),
                      const Spacer(),
                      Text('Original Language: ${result.originalLanguage}'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'Release Date: ${DateFormat('d MMM yyyy').format(result.releaseDate!)}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Vote Average: ${result.voteAverage}'),
                      Text('Popularity: ${result.popularity!.toInt()}'),
                      Text('Vote Count: ${result.voteCount}'),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Container(
                      height: 30,
                      width: width * 0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow_rounded, color: Colors.white),
                          Text('Play'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Overview :\n${result.overview!}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
