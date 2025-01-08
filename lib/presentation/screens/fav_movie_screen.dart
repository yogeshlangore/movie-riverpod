import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_riverpod/models/movies.dart';
import 'package:movie_riverpod/presentation/screens/movies_details_screen.dart';
import 'package:movie_riverpod/repo/hive_repo.dart';
import 'package:movie_riverpod/utils/constant.dart';

class FavMovieScreen extends StatefulWidget {
  const FavMovieScreen({super.key});

  @override
  State<FavMovieScreen> createState() => _FavMovieScreenState();
}

class _FavMovieScreenState extends State<FavMovieScreen> {
  List<Result> favMovie = [];
  final HiveRepo hiveRepo = HiveRepo();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      favMovie = await hiveRepo.getAllFavMoviesFromHive();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        favMovie.isNotEmpty
            ? SliverList.builder(
                itemCount: favMovie.length,
                itemBuilder: (context, index) {
                  String formattedDate = DateFormat('d MMM yyyy').format(
                      DateTime.parse(favMovie[index].releaseDate.toString()));
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              MovieDetailsScreen(result: favMovie[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                        color: Colors.blue),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                imageUrl:
                                    '$imageUrl${favMovie[index].posterPath}',
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favMovie[index].originalTitle!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                HiveRepo().deleteMovieFromHive(
                                    favMovie[index].title!);
                                favMovie.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : const SliverFillRemaining(
                child: Center(
                child: Text('Empty List'),
              )),
      ],
    ));
  }
}
