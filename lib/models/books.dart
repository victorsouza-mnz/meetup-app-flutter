class Book {
  final int id;
  final String name;
  final String imagePath;
  final int themeId;
  final int solvedPercentage;

  const Book({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.themeId,
    required this.solvedPercentage,
  });

  factory Book.fromResponse(res) {
    return Book(
      id: res['id'],
      name: res['name'],
      imagePath: res['imagePath'],
      themeId: res['themeId'],
      solvedPercentage: res['solvedPercentage'],
    );
  }
}
