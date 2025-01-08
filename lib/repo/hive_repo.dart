import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:movie_riverpod/models/movies.dart';

class HiveRepo {
  final movieboxname = 'moviebox';
  void registerAdapter() {
    Hive.registerAdapter(ResultAdapter());
  }

  Future addMovieToHive(Result movie) async {
    final moviebox = await Hive.openBox<Result>(movieboxname);
    await moviebox.put(movie.title, movie);
    log('Movie added to Hive ${movie.title}');
  }

  Future<List<Result>> getAllFavMoviesFromHive() async {
    final moviebox = await Hive.openBox<Result>(movieboxname);
    if (moviebox.isOpen) {
      return moviebox.values.toList();
    } else {
      return [];
    }
  }

  Future deleteMovieFromHive(String id) async {
    final moviebox = await Hive.openBox<Result>(movieboxname);
    await moviebox.delete(id);
  }
}
