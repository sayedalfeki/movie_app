/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":1,"url":"https://yts.mx/movies/bikini-model-academy-2015","imdb_code":"tt3208802","title":"Bikini Model Academy","title_english":"Bikini Model Academy","title_long":"Bikini Model Academy (2015)","slug":"bikini-model-academy-2015","year":2015,"rating":2.3,"runtime":84,"genres":["Action","Comedy"],"like_count":35,"description_intro":"When T. J. and Benji, two California twenty-something best buddies, lose their girlfriends, they start a home grown bikini modeling academy to make money and meet new girls. With a little help from T.J.'s Uncle Seymour (Gary Busey), the guys begin recruiting pretty girls, until a rival modeling school owned by their old grade school enemy tries to shut them down.—joshishivansh","description_full":"When T. J. and Benji, two California twenty-something best buddies, lose their girlfriends, they start a home grown bikini modeling academy to make money and meet new girls. With a little help from T.J.'s Uncle Seymour (Gary Busey), the guys begin recruiting pretty girls, until a rival modeling school owned by their old grade school enemy tries to shut them down.—joshishivansh","yt_trailer_code":"pOZbOY8liOA","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot3.jpg","cast":[{"name":"Morgan Fairchild","character_name":"Ms.Morgan Fairchild","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000392.jpg","imdb_code":"0000392"},{"name":"Gary Busey","character_name":"Uncle Seymour","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000997.jpg","imdb_code":"0000997"},{"name":"Mindy Robinson","character_name":"Gangina","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm4535518.jpg","imdb_code":"4535518"},{"name":"Jakki Jandrell","character_name":"Scary Mary","imdb_code":"2669330"}],"torrents":[{"url":"https://yts.mx/torrent/download/80F67E2D236A1A2854876F6A409C92D2D54C3849","hash":"80F67E2D236A1A2854876F6A409C92D2D54C3849","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":1,"peers":0,"size":"701.10 MB","size_bytes":735156634,"date_uploaded":"2015-10-31 16:40:51","date_uploaded_unix":1446306051},{"url":"https://yts.mx/torrent/download/BA2DD0FB35E9055372873D420E5C951CD41D6A8F","hash":"BA2DD0FB35E9055372873D420E5C951CD41D6A8F","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":1,"size":"1.24 GB","size_bytes":1331439862,"date_uploaded":"2015-10-31 16:40:56","date_uploaded_unix":1446306056}],"date_uploaded":"2015-10-31 16:40:51","date_uploaded_unix":1446306051}}
/// @meta : {"server_time":1749385527,"server_timezone":"CET","api_version":2,"execution_time":"0 ms"}

class MovieDetailsEntity {
  MovieDetailsEntity({
      this.status, 
      this.statusMessage, 
      this.data, 
      });

  MovieDetailsEntity.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;

  }
  String? status;
  String? statusMessage;
  Data? data;
}

/// server_time : 1749385527
/// server_timezone : "CET"
/// api_version : 2
/// execution_time : "0 ms"


/// movie : {"id":1,"url":"https://yts.mx/movies/bikini-model-academy-2015","imdb_code":"tt3208802","title":"Bikini Model Academy","title_english":"Bikini Model Academy","title_long":"Bikini Model Academy (2015)","slug":"bikini-model-academy-2015","year":2015,"rating":2.3,"runtime":84,"genres":["Action","Comedy"],"like_count":35,"description_intro":"When T. J. and Benji, two California twenty-something best buddies, lose their girlfriends, they start a home grown bikini modeling academy to make money and meet new girls. With a little help from T.J.'s Uncle Seymour (Gary Busey), the guys begin recruiting pretty girls, until a rival modeling school owned by their old grade school enemy tries to shut them down.—joshishivansh","description_full":"When T. J. and Benji, two California twenty-something best buddies, lose their girlfriends, they start a home grown bikini modeling academy to make money and meet new girls. With a little help from T.J.'s Uncle Seymour (Gary Busey), the guys begin recruiting pretty girls, until a rival modeling school owned by their old grade school enemy tries to shut them down.—joshishivansh","yt_trailer_code":"pOZbOY8liOA","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot3.jpg","cast":[{"name":"Morgan Fairchild","character_name":"Ms.Morgan Fairchild","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000392.jpg","imdb_code":"0000392"},{"name":"Gary Busey","character_name":"Uncle Seymour","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000997.jpg","imdb_code":"0000997"},{"name":"Mindy Robinson","character_name":"Gangina","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm4535518.jpg","imdb_code":"4535518"},{"name":"Jakki Jandrell","character_name":"Scary Mary","imdb_code":"2669330"}],"torrents":[{"url":"https://yts.mx/torrent/download/80F67E2D236A1A2854876F6A409C92D2D54C3849","hash":"80F67E2D236A1A2854876F6A409C92D2D54C3849","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":1,"peers":0,"size":"701.10 MB","size_bytes":735156634,"date_uploaded":"2015-10-31 16:40:51","date_uploaded_unix":1446306051},{"url":"https://yts.mx/torrent/download/BA2DD0FB35E9055372873D420E5C951CD41D6A8F","hash":"BA2DD0FB35E9055372873D420E5C951CD41D6A8F","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":1,"size":"1.24 GB","size_bytes":1331439862,"date_uploaded":"2015-10-31 16:40:56","date_uploaded_unix":1446306056}],"date_uploaded":"2015-10-31 16:40:51","date_uploaded_unix":1446306051}

class Data {
  Data({
      this.movie,});

  Data.fromJson(dynamic json) {
    movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
  }
  Movie? movie;



}

/// id : 1
/// url : "https://yts.mx/movies/bikini-model-academy-2015"
/// imdb_code : "tt3208802"
/// title : "Bikini Model Academy"
/// title_english : "Bikini Model Academy"
/// title_long : "Bikini Model Academy (2015)"
/// slug : "bikini-model-academy-2015"
/// year : 2015
/// rating : 2.3
/// runtime : 84
/// genres : ["Action","Comedy"]
/// like_count : 35
/// description_intro : "When T. J. and Benji, two California twenty-something best buddies, lose their girlfriends, they start a home grown bikini modeling academy to make money and meet new girls. With a little help from T.J.'s Uncle Seymour (Gary Busey), the guys begin recruiting pretty girls, until a rival modeling school owned by their old grade school enemy tries to shut them down.—joshishivansh"
/// description_full : "When T. J. and Benji, two California twenty-something best buddies, lose their girlfriends, they start a home grown bikini modeling academy to make money and meet new girls. With a little help from T.J.'s Uncle Seymour (Gary Busey), the guys begin recruiting pretty girls, until a rival modeling school owned by their old grade school enemy tries to shut them down.—joshishivansh"
/// yt_trailer_code : "pOZbOY8liOA"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.mx/assets/images/movies/bikini_model_academy_2015/large-screenshot3.jpg"
/// cast : [{"name":"Morgan Fairchild","character_name":"Ms.Morgan Fairchild","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000392.jpg","imdb_code":"0000392"},{"name":"Gary Busey","character_name":"Uncle Seymour","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000997.jpg","imdb_code":"0000997"},{"name":"Mindy Robinson","character_name":"Gangina","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm4535518.jpg","imdb_code":"4535518"},{"name":"Jakki Jandrell","character_name":"Scary Mary","imdb_code":"2669330"}]
/// torrents : [{"url":"https://yts.mx/torrent/download/80F67E2D236A1A2854876F6A409C92D2D54C3849","hash":"80F67E2D236A1A2854876F6A409C92D2D54C3849","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":1,"peers":0,"size":"701.10 MB","size_bytes":735156634,"date_uploaded":"2015-10-31 16:40:51","date_uploaded_unix":1446306051},{"url":"https://yts.mx/torrent/download/BA2DD0FB35E9055372873D420E5C951CD41D6A8F","hash":"BA2DD0FB35E9055372873D420E5C951CD41D6A8F","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":1,"size":"1.24 GB","size_bytes":1331439862,"date_uploaded":"2015-10-31 16:40:56","date_uploaded_unix":1446306056}]
/// date_uploaded : "2015-10-31 16:40:51"
/// date_uploaded_unix : 1446306051

class Movie {
  Movie({
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
      this.likeCount, 
      this.descriptionIntro, 
      this.descriptionFull, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.mediumScreenshotImage1, 
      this.mediumScreenshotImage2, 
      this.mediumScreenshotImage3, 
      this.largeScreenshotImage1, 
      this.largeScreenshotImage2, 
      this.largeScreenshotImage3, 
      this.cast, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Movie.fromJson(dynamic json) {
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
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    mediumScreenshotImage1 = json['medium_screenshot_image1'];
    mediumScreenshotImage2 = json['medium_screenshot_image2'];
    mediumScreenshotImage3 = json['medium_screenshot_image3'];
    largeScreenshotImage1 = json['large_screenshot_image1'];
    largeScreenshotImage2 = json['large_screenshot_image2'];
    largeScreenshotImage3 = json['large_screenshot_image3'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  num? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<Cast>? cast;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;



}

/// url : "https://yts.mx/torrent/download/80F67E2D236A1A2854876F6A409C92D2D54C3849"
/// hash : "80F67E2D236A1A2854876F6A409C92D2D54C3849"
/// quality : "720p"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 1
/// peers : 0
/// size : "701.10 MB"
/// size_bytes : 735156634
/// date_uploaded : "2015-10-31 16:40:51"
/// date_uploaded_unix : 1446306051

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
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

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

/// name : "Morgan Fairchild"
/// character_name : "Ms.Morgan Fairchild"
/// url_small_image : "https://yts.mx/assets/images/actors/thumb/nm0000392.jpg"
/// imdb_code : "0000392"

class Cast {
  Cast({
      this.name, 
      this.characterName, 
      this.urlSmallImage, 
      this.imdbCode,});

  Cast.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    urlSmallImage = json['url_small_image'];
    imdbCode = json['imdb_code'];
  }
  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['character_name'] = characterName;
    map['url_small_image'] = urlSmallImage;
    map['imdb_code'] = imdbCode;
    return map;
  }

}