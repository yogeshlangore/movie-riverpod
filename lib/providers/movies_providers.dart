import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/models/movies.dart';
import 'package:movie_riverpod/repo/movie_repo.dart';

final nowPlayingMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(moviesRepoProvider).getNowPlayingMovies();
});
final upComingMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(moviesRepoProvider).getUpComingMovies();
});
final popularMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(moviesRepoProvider).getPopularMovies();
});
final popularTVSeriesFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(moviesRepoProvider).getPopularTVSeries();
});
final topRatedMoviesFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(moviesRepoProvider).getTopRatedMovies();
});
final movieSearchProvider =
    FutureProvider.family<List<Result>, String>((ref, query) async {
  return await ref.watch(moviesRepoProvider).searchMovies(query);
});