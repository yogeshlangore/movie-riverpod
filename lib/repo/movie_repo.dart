import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/models/movies.dart';
import 'package:movie_riverpod/networking/dio_client.dart';
import 'package:movie_riverpod/utils/constant.dart';

class MovieRepo {
  final Ref ref;
  MovieRepo(this.ref);
  Future getNowPlayingMovies() async {
    try {
      final response = await ref.read(dioProvider).get(nowPlaying);
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> nowPlayingMovies =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return nowPlayingMovies;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getUpComingMovies() async {
    try {
      final response = await ref.read(dioProvider).get(upComing);
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> getUpComingMovies =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return getUpComingMovies;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getPopularMovies() async {
    try {
      final response = await ref.read(dioProvider).get(popular);
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> getPopularMovies =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return getPopularMovies;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getPopularTVSeries() async {
    try {
      final response = await ref.read(dioProvider).get(tvPopularSeries);
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> getPopularTvSeries =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return getPopularTvSeries;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getTopRatedMovies() async {
    try {
      final response = await ref.read(dioProvider).get(topRated);
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> getTopRatedMovies =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return getTopRatedMovies;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future searchMovies(String data) async {
    try {
      final response =
          await ref.read(dioProvider).get('search/movie?query=$data');
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> searchedMovies =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return searchedMovies;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}


final moviesRepoProvider = Provider((ref) => MovieRepo(ref));
