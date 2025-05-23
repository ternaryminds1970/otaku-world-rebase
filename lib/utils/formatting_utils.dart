import 'dart:ui';

import 'package:intl/intl.dart';

import '../graphql/__generated/graphql/schema.graphql.dart';
import '../theme/colors.dart';

class FormattingUtils {
  static String formatDurationFromMilliseconds(int milliseconds) {
    // Convert milliseconds to seconds
    int totalSeconds = milliseconds ~/ 1000;

    // Calculate the number of days, hours, and minutes
    int days = totalSeconds ~/ (24 * 60 * 60);
    int hours = (totalSeconds % (24 * 60 * 60)) ~/ (60 * 60);
    int minutes = (totalSeconds % (60 * 60)) ~/ 60;

    // Format the duration in 'dd:hh:mm' format
    return '${days.toString().padLeft(2, '0')}:${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  static String formatDurationFromSeconds(int seconds) {
    // Calculate the number of days, hours, and minutes
    int days = seconds ~/ (24 * 60 * 60);
    int hours = (seconds % (24 * 60 * 60)) ~/ (60 * 60);
    int minutes = (seconds % (60 * 60)) ~/ 60;

    String duration = '';
    if (days > 0) {
      duration += '${days.toString()}d ';
    }
    if (hours > 0) {
      duration += '${hours.toString()}h ';
    }
    duration += '${minutes.toString()}m';
    return duration;
  }

  static String formatDurationFromSecondsBefore(int seconds) {
    // Calculate the number of days, hours, and minutes
    int days = (seconds ~/ (24 * 60 * 60)).abs();
    int hours = 23 - (seconds % (24 * 60 * 60)) ~/ (60 * 60);
    int minutes = 59 - (seconds % (60 * 60)) ~/ 60;

    String duration = '';
    if (days > 0) {
      duration += '${days.toString()}d ';
    }
    if (hours > 0) {
      duration += '${hours.toString()}h ';
    }
    duration += '${minutes.toString()}m';
    return duration;
  }

  static int getUnixTimeStampFromDate(DateTime date) {
    return date.millisecondsSinceEpoch ~/ 1000;
  }

  static String formatTimeFromMilliseconds(int milliseconds) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000);

    return DateFormat('hh:mm a').format(time);
  }

  static String formatUnixTimestamp(
    int unixTimestamp, {
    bool isFromAniList = true,
  }) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      isFromAniList ? unixTimestamp * 1000 : unixTimestamp,
    );
    String formattedDate = DateFormat('E, d MMM yyyy').format(dateTime);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return '$formattedDate at $formattedTime';
  }

  static int getYearFromTimestamp(int unixTimestamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    return dateTime.year;
  }

  static String minutesToDays(int minutes) {
    final days = minutes / (24 * 60);
    return days.toStringAsFixed(1);
  }

  static String minutesToHours(int minutes) {
    final hours = minutes / 60;
    return hours.truncate().toString();
  }

  static String formatMinutes(int minutesWatched) {
    int days = minutesWatched ~/ (24 * 60);
    int remainingMinutes = minutesWatched % (24 * 60);
    int hours = remainingMinutes ~/ 60;
    int minutes = remainingMinutes % 60;

    if (days > 0) {
      return hours > 0 ? '$days Days $hours Hours' : '$days Days';
    } else if (hours > 0) {
      return minutes > 0 ? '$hours Hours $minutes Minutes' : '$hours Hours';
    } else {
      return '$minutes Minutes';
    }
  }

  static String getCountryCode(String country) {
    switch (country) {
      case 'Japan':
        return 'JP';
      case 'South Korea':
        return 'KR';
      case 'China':
        return 'CN';
      case 'Taiwan':
        return 'TW';
      default:
        return 'NO';
    }
  }

  static String getCountry(String? countryCode) {
    switch (countryCode) {
      case 'JP':
        return 'Japan';
      case 'KR':
        return 'South Korea';
      case 'CN':
        return 'China';
      case 'TW':
        return 'Taiwan';
      default:
        return 'All';
    }
  }

  static Color getCountryColor(String? country) {
    switch (country) {
      case 'JP' || 'Japan':
        return AppColors.toolBox;
      case 'KR' || 'South Korea':
        return AppColors.americanGreen;
      case 'CN' || 'China':
        return AppColors.pantonePink;
      case 'TW' || 'Taiwan':
        return AppColors.deepLemon;
      default:
        return AppColors.white;
    }
  }

  static String getSeasonString(Enum$MediaSeason? season) {
    if (season == null) return 'All';

    switch (season) {
      case Enum$MediaSeason.FALL:
        return 'Fall';
      case Enum$MediaSeason.SPRING:
        return 'Spring';
      case Enum$MediaSeason.SUMMER:
        return 'Summer';
      case Enum$MediaSeason.WINTER:
        return 'Winter';
      default:
        return 'All';
    }
  }

  static Enum$MediaSeason getSeason(String season) {
    switch (season) {
      case 'Fall':
        return Enum$MediaSeason.FALL;
      case 'Spring':
        return Enum$MediaSeason.SPRING;
      case 'Summer':
        return Enum$MediaSeason.SUMMER;
      case 'Winter':
        return Enum$MediaSeason.WINTER;
      default:
        return Enum$MediaSeason.$unknown;
    }
  }

  static String getMediaFormatString(Enum$MediaFormat? format, {bool forList = false,}) {
    switch (format) {
      case Enum$MediaFormat.TV:
        return forList ? 'TV' : 'TV Show';
      case Enum$MediaFormat.TV_SHORT:
        return 'TV Short';
      case Enum$MediaFormat.MOVIE:
        return 'Movie';
      case Enum$MediaFormat.SPECIAL:
        return 'Special';
      case Enum$MediaFormat.OVA:
        return 'OVA';
      case Enum$MediaFormat.ONA:
        return 'ONA';
      case Enum$MediaFormat.MUSIC:
        return 'Music';
      case Enum$MediaFormat.MANGA:
        return 'Manga';
      case Enum$MediaFormat.NOVEL:
        return forList ? 'Novel' : 'Light Novel';
      case Enum$MediaFormat.ONE_SHOT:
        return 'One Shot';
      default:
        return 'Unknown';
    }
  }

  static Enum$MediaFormat getMediaFormat(String format) {
    switch (format) {
      case 'TV Show' || 'TV':
        return Enum$MediaFormat.TV;
      case 'TV Short':
        return Enum$MediaFormat.TV_SHORT;
      case 'Movie':
        return Enum$MediaFormat.MOVIE;
      case 'Special':
        return Enum$MediaFormat.SPECIAL;
      case 'OVA':
        return Enum$MediaFormat.OVA;
      case 'ONA':
        return Enum$MediaFormat.ONA;
      case 'Music':
        return Enum$MediaFormat.MUSIC;
      case 'Manga':
        return Enum$MediaFormat.MANGA;
      case 'Light Novel' || 'Novel':
        return Enum$MediaFormat.NOVEL;
      case 'One Shot':
        return Enum$MediaFormat.ONE_SHOT;
      default:
        return Enum$MediaFormat.$unknown;
    }
  }

  static String getMediaStatusString(
    Enum$MediaStatus? status, {
    bool anime = true,
  }) {
    switch (status) {
      case Enum$MediaStatus.RELEASING:
        return anime ? 'Airing' : 'Publishing';
      case Enum$MediaStatus.NOT_YET_RELEASED:
        return anime ? 'Not Yet Aired' : 'Not Yet Published';
      case Enum$MediaStatus.FINISHED:
        return 'Finished';
      case Enum$MediaStatus.CANCELLED:
        return 'Cancelled';
      case Enum$MediaStatus.HIATUS:
        return 'Hiatus';
      default:
        return 'Unknown';
    }
  }

  static Enum$MediaStatus getMediaStatus(String status) {
    switch (status) {
      case 'Airing' || 'Publishing':
        return Enum$MediaStatus.RELEASING;
      case 'Not Yet Aired' || 'Not Yet Published':
        return Enum$MediaStatus.NOT_YET_RELEASED;
      case 'Finished':
        return Enum$MediaStatus.FINISHED;
      case 'Cancelled':
        return Enum$MediaStatus.CANCELLED;
      case 'Hiatus':
        return Enum$MediaStatus.HIATUS;
      default:
        return Enum$MediaStatus.$unknown;
    }
  }

  static Enum$MediaListStatus getMediaListStatus(String status) {
    switch (status) {
      case 'Watching' || 'Reading':
        return Enum$MediaListStatus.CURRENT;
      case 'Planning':
        return Enum$MediaListStatus.PLANNING;
      case 'Completed':
        return Enum$MediaListStatus.COMPLETED;
      case 'Dropped':
        return Enum$MediaListStatus.DROPPED;
      case 'Paused':
        return Enum$MediaListStatus.PAUSED;
      case 'Rewatching' || 'Rereading':
        return Enum$MediaListStatus.REPEATING;
      default:
        return Enum$MediaListStatus.$unknown;
    }
  }

  static String getMediaListStatusString(
    Enum$MediaListStatus? status, {
    bool isAnime = true,
  }) {
    switch (status) {
      case Enum$MediaListStatus.CURRENT:
        return isAnime ? 'Watching' : 'Reading';
      case Enum$MediaListStatus.PLANNING:
        return 'Planning';
      case Enum$MediaListStatus.COMPLETED:
        return 'Completed';
      case Enum$MediaListStatus.DROPPED:
        return 'Dropped';
      case Enum$MediaListStatus.PAUSED:
        return 'Paused';
      case Enum$MediaListStatus.REPEATING:
        return isAnime ? 'Rewatching' : 'Rereading';
      default:
        return 'Unknown';
    }
  }

  static String getMediaSourceString(Enum$MediaSource source) {
    switch (source) {
      case Enum$MediaSource.ANIME:
        return 'Anime';
      case Enum$MediaSource.COMIC:
        return 'Comic';
      case Enum$MediaSource.DOUJINSHI:
        return 'Doujinshi (Self Published)';
      case Enum$MediaSource.GAME:
        return 'Game';
      case Enum$MediaSource.LIGHT_NOVEL:
        return 'Light Novel';
      case Enum$MediaSource.LIVE_ACTION:
        return 'Live Action';
      case Enum$MediaSource.MANGA:
        return 'Manga';
      case Enum$MediaSource.MULTIMEDIA_PROJECT:
        return 'Multimedia Project';
      case Enum$MediaSource.NOVEL:
        return 'Novel';
      case Enum$MediaSource.ORIGINAL:
        return 'Original';
      case Enum$MediaSource.OTHER:
        return 'Other';
      case Enum$MediaSource.PICTURE_BOOK:
        return 'Picture Book';
      case Enum$MediaSource.VIDEO_GAME:
        return 'Video Game';
      case Enum$MediaSource.VISUAL_NOVEL:
        return 'Visual Novel';
      case Enum$MediaSource.WEB_NOVEL:
        return 'Web Novel';
      default:
        return 'Unknown';
    }
  }

  static Enum$MediaSource getMediaSource(String source) {
    switch (source) {
      case 'Anime':
        return Enum$MediaSource.ANIME;
      case 'Comic':
        return Enum$MediaSource.COMIC;
      case 'Doujinshi (Self Published)':
        return Enum$MediaSource.DOUJINSHI;
      case 'Game':
        return Enum$MediaSource.GAME;
      case 'Light Novel':
        return Enum$MediaSource.LIGHT_NOVEL;
      case 'Live Action':
        return Enum$MediaSource.LIVE_ACTION;
      case 'Manga':
        return Enum$MediaSource.MANGA;
      case 'Multimedia Project':
        return Enum$MediaSource.MULTIMEDIA_PROJECT;
      case 'Novel':
        return Enum$MediaSource.NOVEL;
      case 'Original':
        return Enum$MediaSource.ORIGINAL;
      case 'Other':
        return Enum$MediaSource.OTHER;
      case 'Picture Book':
        return Enum$MediaSource.PICTURE_BOOK;
      case 'Video Game':
        return Enum$MediaSource.VIDEO_GAME;
      case 'Visual Novel':
        return Enum$MediaSource.VISUAL_NOVEL;
      case 'Web Novel':
        return Enum$MediaSource.WEB_NOVEL;
      default:
        return Enum$MediaSource.$unknown;
    }
  }

  static Enum$MediaSort getMediaSortOption(String option) {
    switch (option) {
      case 'Popularity':
        return Enum$MediaSort.POPULARITY_DESC;
      case 'Title':
        return Enum$MediaSort.TITLE_ROMAJI;
      case 'Average Score':
        return Enum$MediaSort.SCORE_DESC;
      case 'Trending':
        return Enum$MediaSort.TRENDING_DESC;
      case 'Favourites':
        return Enum$MediaSort.FAVOURITES_DESC;
      case 'Date Added':
        return Enum$MediaSort.UPDATED_AT_DESC;
      case 'Release Date':
        return Enum$MediaSort.START_DATE_DESC;
      default:
        return Enum$MediaSort.POPULARITY_DESC;
    }
  }

  /*
  'Title',
    'Score',
    'Progress',
    'Last Updated',
    'Last Added',
    'Start Date',
    'Completed Date',
    'Release Date',
    'Average Score',
    'Popularity',
   */

  static Enum$MediaListSort getMediaListSortOption(String option) {
    switch (option) {
      case 'Title':
        return Enum$MediaListSort.MEDIA_TITLE_ROMAJI;
      case 'Score':
        return Enum$MediaListSort.SCORE_DESC;
      case 'Progress':
        return Enum$MediaListSort.PROGRESS_DESC;
      case 'Last Updated':
        return Enum$MediaListSort.UPDATED_TIME_DESC;
      case 'Last Added':
        return Enum$MediaListSort.ADDED_TIME_DESC;
      case 'Start Date':
        return Enum$MediaListSort.STARTED_ON_DESC;
      case 'Completed Date':
        return Enum$MediaListSort.FINISHED_ON_DESC;
      case 'Release Date':
        return Enum$MediaListSort
            .ADDED_TIME; // Assume this is correct for release date
      case 'Average Score':
        return Enum$MediaListSort
            .MEDIA_ID_DESC; // Assume this is correct for average score
      case 'Popularity':
        return Enum$MediaListSort.MEDIA_POPULARITY_DESC;
      default:
        return Enum$MediaListSort.MEDIA_POPULARITY_DESC;
    }
  }

  static String getMediaListSortOptionString(Enum$MediaListSort option) {
    switch (option) {
      case Enum$MediaListSort.MEDIA_TITLE_ROMAJI:
        return 'Title';
      case Enum$MediaListSort.SCORE_DESC:
        return 'Score';
      case Enum$MediaListSort.PROGRESS_DESC:
        return 'Progress';
      case Enum$MediaListSort.UPDATED_TIME_DESC:
        return 'Last Updated';
      case Enum$MediaListSort.ADDED_TIME_DESC:
        return 'Last Added';
      case Enum$MediaListSort.STARTED_ON_DESC:
        return 'Start Date';
      case Enum$MediaListSort.FINISHED_ON_DESC:
        return 'Completed Date';
      case Enum$MediaListSort.ADDED_TIME:
        return 'Release Date';
      case Enum$MediaListSort.MEDIA_ID_DESC:
        return 'Average Score';
      case Enum$MediaListSort.MEDIA_POPULARITY_DESC:
        return 'Popularity';
      default:
        return 'Popularity';
    }
  }

  static String getMediaSortString(Enum$MediaSort option) {
    switch (option) {
      case Enum$MediaSort.POPULARITY_DESC:
        return 'Popularity';
      case Enum$MediaSort.TITLE_ROMAJI:
        return 'Title';
      case Enum$MediaSort.SCORE_DESC:
        return 'Average Score';
      case Enum$MediaSort.TRENDING_DESC:
        return 'Trending';
      case Enum$MediaSort.FAVOURITES_DESC:
        return 'Favourites';
      case Enum$MediaSort.UPDATED_AT_DESC:
        return 'Date Added';
      case Enum$MediaSort.START_DATE_DESC:
        return 'Release Date';
      default:
        return 'Popularity';
    }
  }

  static Color getSelectMediaCardColors({
    required int index,
  }) {
    switch (index) {
      case 0:
        return AppColors.gold;
      case 1:
        return AppColors.silver;
      case 2:
        return AppColors.bronze;
      default:
        if (index % 3 == 0) {
          return AppColors.sunsetOrange;
        } else if (index % 3 == 1) {
          return AppColors.trueBlue;
        } else {
          return AppColors.kiwi;
        }
    }
  }
}
