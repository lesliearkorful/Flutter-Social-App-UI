import 'user.dart';

class Notification {
  final String user;
  final String comment;
  final String time;
  final String image;

  Notification({
    this.user,
    this.comment,
    this.time,
    this.image
  });
}


List<Notification> notificationsData = [
  Notification(
    user: 'Smith',
    comment: 'Wow! Inspirational',
    time: '1 hour ago',
    image: User.photos[0]
  ),
  Notification(
    user: 'Cece',
    comment: 'I really love this!',
    time: '2 hours ago',
    image: User.photos[1]
  ),
  Notification(
    user: 'Luca',
    comment: 'This is pure fire!',
    time: '2 hours ago',
    image: User.photos[2]
  ),
];