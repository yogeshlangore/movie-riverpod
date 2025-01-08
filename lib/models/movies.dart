import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movies.g.dart';

@JsonSerializable()
@HiveType(typeId: 01)
class Result {
  @HiveField(0)
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  @HiveField(1)
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  @HiveField(2)
  final List<int>? genreIds;
  @HiveField(3)
  final int? id;
  @JsonKey(name: 'original_language')
  @HiveField(4)
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  @HiveField(5)
  final String? originalTitle;
  @HiveField(6)
  final String? overview;
  @HiveField(7)
  final double? popularity;
  @JsonKey(name: 'poster_path')
  @HiveField(8)
  final String? posterPath;
  @JsonKey(name: 'release_date')
  @HiveField(9)
  final DateTime? releaseDate;
  @HiveField(10)
  final String? title;
  @HiveField(11)
  final bool? video;
  @JsonKey(name: 'vote_average')
  @HiveField(12)
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  @HiveField(13)
  final int? voteCount;
  @JsonKey(name: 'genres')
  @HiveField(14)
  final List? genres;
  @JsonKey(name: 'runtime')
  @HiveField(15)
  final int? runtime;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.genres,
    this.runtime,
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
