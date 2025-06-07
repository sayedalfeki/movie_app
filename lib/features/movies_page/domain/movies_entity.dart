import 'movies_entity.dart';

/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie_count":332,"limit":1,"page_number":1,"movies":[{"id":64315,"url":"https://yts.mx/movies/dracula-3d-2012","imdb_code":"tt1852770","title":"Dracula 3D","title_english":"Dracula 3D","title_long":"Dracula 3D (2012)","slug":"dracula-3d-2012","year":2012,"rating":3.6,"runtime":110,"genres":["Drama","Horror","Romance","Thriller"],"summary":"","description_full":"","synopsis":"","yt_trailer_code":"SfzwSfDXnAE","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/dracula_3d_2012/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/dracula_3d_2012/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/dracula_3d_2012/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/dracula_3d_2012/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/dracula_3d_2012/large-cover.jpg","state":"ok","torrents":[{"url":"https://yts.mx/torrent/download/47150A0E431FF0144B10637CF23B36BFAB0345DC","hash":"47150A0E431FF0144B10637CF23B36BFAB0345DC","quality":"3D","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":9,"peers":6,"size":"2.03 GB","size_bytes":2179695903,"date_uploaded":"2024-10-04 22:17:34","date_uploaded_unix":1728073054}]}]}
/// @meta : {"server_time":1749226614,"server_timezone":"CET","api_version":2,"execution_time":"0.48 ms"}

class MoviesEntity {
  MoviesEntity({
      this.status, 
      this.statusMessage, 
      this.data, 
      this.meta,});

  MoviesEntity.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (meta != null) {
      map['@meta'] = meta?.toJson();
    }
    return map;
  }

}

/// server_time : 1749226614
/// server_timezone : "CET"
/// api_version : 2
/// execution_time : "0.48 ms"

class Meta {
  Meta({
      this.serverTime, 
      this.serverTimezone, 
      this.apiVersion, 
      this.executionTime,});

  Meta.fromJson(dynamic json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }
  num? serverTime;
  String? serverTimezone;
  num? apiVersion;
  String? executionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['server_time'] = serverTime;
    map['server_timezone'] = serverTimezone;
    map['api_version'] = apiVersion;
    map['execution_time'] = executionTime;
    return map;
  }

}

/// movie_count : 332
/// limit : 1
/// page_number : 1
/// movies : [{"id":64315,"url":"https://yts.mx/movies/dracula-3d-2012","imdb_code":"tt1852770","title":"Dracula 3D","title_english":"Dracula 3D","title_long":"Dracula 3D (2012)","slug":"dracula-3d-2012","year":2012,"rating":3.6,"runtime":110,"genres":["Drama","Horror","Romance","Thriller"],"summary":"","description_full":"","synopsis":"","yt_trailer_code":"SfzwSfDXnAE","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/dracula_3d_2012/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/dracula_3d_2012/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/dracula_3d_2012/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/dracula_3d_2012/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/dracula_3d_2012/large-cover.jpg","state":"ok","torrents":[{"url":"https://yts.mx/torrent/download/47150A0E431FF0144B10637CF23B36BFAB0345DC","hash":"47150A0E431FF0144B10637CF23B36BFAB0345DC","quality":"3D","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":9,"peers":6,"size":"2.03 GB","size_bytes":2179695903,"date_uploaded":"2024-10-04 22:17:34","date_uploaded_unix":1728073054}]}]

class Data {
  Data({
      this.movieCount, 
      this.limit, 
      this.pageNumber, 
      this.movies,});

  Data.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
  }
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movies>? movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 64315
/// url : "https://yts.mx/movies/dracula-3d-2012"
/// imdb_code : "tt1852770"
/// title : "Dracula 3D"
/// title_english : "Dracula 3D"
/// title_long : "Dracula 3D (2012)"
/// slug : "dracula-3d-2012"
/// year : 2012
/// rating : 3.6
/// runtime : 110
/// genres : ["Drama","Horror","Romance","Thriller"]
/// summary : ""
/// description_full : ""
/// synopsis : ""
/// yt_trailer_code : "SfzwSfDXnAE"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/dracula_3d_2012/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/dracula_3d_2012/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/dracula_3d_2012/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/dracula_3d_2012/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/dracula_3d_2012/large-cover.jpg"
/// state : "ok"
/// torrents : [{"url":"https://yts.mx/torrent/download/47150A0E431FF0144B10637CF23B36BFAB0345DC","hash":"47150A0E431FF0144B10637CF23B36BFAB0345DC","quality":"3D","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":9,"peers":6,"size":"2.03 GB","size_bytes":2179695903,"date_uploaded":"2024-10-04 22:17:34","date_uploaded_unix":1728073054}]

class Movies {
  Movies({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.summary, 
      this.descriptionFull, 
      this.synopsis, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.state, 
      this.torrents,});

  Movies.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
  }
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  num? year;
  num? rating;
  num? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  List<Torrents>? torrents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// url : "https://yts.mx/torrent/download/47150A0E431FF0144B10637CF23B36BFAB0345DC"
/// hash : "47150A0E431FF0144B10637CF23B36BFAB0345DC"
/// quality : "3D"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "5.1"
/// seeds : 9
/// peers : 6
/// size : "2.03 GB"
/// size_bytes : 2179695903
/// date_uploaded : "2024-10-04 22:17:34"
/// date_uploaded_unix : 1728073054

class Torrents {
  Torrents({
      this.url, 
      this.hash, 
      this.quality, 
      this.type, 
      this.isRepack, 
      this.videoCodec, 
      this.bitDepth, 
      this.audioChannels, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Torrents.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  num? seeds;
  num? peers;
  String? size;
  num? sizeBytes;
  String? dateUploaded;
  num? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['hash'] = hash;
    map['quality'] = quality;
    map['type'] = type;
    map['is_repack'] = isRepack;
    map['video_codec'] = videoCodec;
    map['bit_depth'] = bitDepth;
    map['audio_channels'] = audioChannels;
    map['seeds'] = seeds;
    map['peers'] = peers;
    map['size'] = size;
    map['size_bytes'] = sizeBytes;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}