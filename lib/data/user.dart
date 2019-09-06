
class User {

  static String name = 'Leslie Arkorful';

  static String username = 'leslie';

  //would have used int if I wrote function
  //to format the actual followers digits
  static String followersCount = '22k';

  static int articlesCount = 24;

  static int photosCount = 48;

  static String photosPath = 'images/posts';

  static List<String> photos = [
    '$photosPath/1.jpg',
    '$photosPath/2.jpg',
    '$photosPath/3.jpg',
    '$photosPath/4.jpg',
    '$photosPath/5.jpg',
  ];

  static List<String> videos = [
    '$photosPath/1.jpg',
    '$photosPath/2.jpg',
    '$photosPath/3.jpg',
    '$photosPath/4.jpg',
    '$photosPath/5.jpg',
  ].reversed.toList();
}