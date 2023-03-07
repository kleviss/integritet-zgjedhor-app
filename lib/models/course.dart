class Course {
  // Course model with all properties
  String? id;
  String? title;
  String? description;
  String? author;
  String? authorId;
  String? authorImageUrl;
  String? imageUrl;
  String? videoUrl;
  String? category;
  String? duration;

  Course({
    this.id,
    this.title,
    this.description,
    this.author,
    this.authorId,
    this.authorImageUrl,
    this.imageUrl,
    this.videoUrl,
    this.category,
    this.duration,
  });

  // generate list of courses
  static List<Course> generateCourses() {
    return [
      Course(
        id: '123456',
        title: 'Kontrollo Targat',
        description:
            'Learn Flutter and Dart to build beautiful native apps for iOS and Android',
        author: 'Automjetet Shtetërore',
        authorId: '1',
        authorImageUrl: 'assets/images/flutter_team.jpg',
        imageUrl: 'assets/images/targa2.png',
        videoUrl: 'https://www.youtube.com/watch?v=IYvD9oBCuJI',
        category: 'Mobile Development',
        duration: "26 targa",
      ),
      Course(
        id: '1234567',
        title: 'Shkelësit bashkiake',
        description:
            'Learn React Native to build beautiful native apps for iOS and Android',
        author: 'Raportim i veprimtarisë',
        authorId: '2',
        authorImageUrl: 'assets/images/kennt_academy.jpg',
        imageUrl: 'assets/images/bashkia2.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=0-S5a0eXPoc',
        category: 'Mobile Development',
        duration: "06 hours 20 minutes",
      ),
      Course(
        id: '12345678',
        title: 'Plants Care',
        description:
            'Learn how to take care of your plants and make them grow healthy',
        author: 'Plantalogy',
        authorId: '3',
        authorImageUrl: 'assets/images/plantalogy.jpg',
        imageUrl: 'assets/images/plants.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=0-S5a0eXPoc',
        category: 'Gardening',
        duration: "06 hours 20 minutes",
      ),
    ];
  }

  // method to get course by id
  static Course getCourseById(String id) {
    return generateCourses().firstWhere((course) => course.id == id);
  }

  // method to print course to string
  @override
  String toString() {
    return 'Course{id: $id, title: $title, description: $description, author: $author, authorId: $authorId, authorImageUrl: $authorImageUrl, imageUrl: $imageUrl, videoUrl: $videoUrl, category: $category}';
  }
}
