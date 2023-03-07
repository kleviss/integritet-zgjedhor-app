class ActiveCourse {
  String? id;
  String? title;
  String? description;
  String? author;
  String? authorId;
  String? authorImageUrl;
  String? imageUrl;
  String? videoUrl;
  String? category;
  double? minutesLeft;
  double? lessonsWatched;
  double? totalLessons;
  double? totalMinutes;
  bool? isCompleted;
  bool? isSaved;

  ActiveCourse({
    this.id,
    this.title,
    this.description,
    this.author,
    this.authorId,
    this.authorImageUrl,
    this.imageUrl,
    this.videoUrl,
    this.category,
    this.minutesLeft,
    this.lessonsWatched,
    this.totalLessons,
    this.totalMinutes,
    this.isCompleted,
    this.isSaved,
  });

  // generate list of active courses
  static List<ActiveCourse> generateActiveCourses() {
    return [
      ActiveCourse(
        id: '1234567',
        title: 'Harta sipas shkeljeve',
        description:
            'Learn React Native to build beautiful native apps for iOS and Android',
        author: 'Kennt Academy',
        authorId: '2',
        authorImageUrl: 'assets/images/kennt_academy.jpg',
        imageUrl: 'assets/images/react_native.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=0-S5a0eXPoc',
        category: 'Mobile Development',
        minutesLeft: 30,
        lessonsWatched: 2,
        totalLessons: 6,
        totalMinutes: 60,
        isCompleted: false,
        isSaved: false,
      ),
      ActiveCourse(
        id: '123456',
        title: 'Learn Flutter',
        description:
            'Learn Flutter and Dart to build beautiful native apps for iOS and Android',
        author: 'Flutter Team',
        authorId: '1',
        authorImageUrl: 'assets/images/flutter_team.jpg',
        imageUrl: 'assets/images/flutter.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=IYvD9oBCuJI',
        category: 'Mobile Development',
        minutesLeft: 30,
        lessonsWatched: 6,
        totalLessons: 12,
        totalMinutes: 60,
        isCompleted: false,
        isSaved: false,
      ),
    ];
  }

  // generate getActiveCourseById method
  static ActiveCourse getActiveCourseById(String id) {
    return generateActiveCourses().firstWhere((course) => course.id == id);
  }
}
