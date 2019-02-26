class Note {
  String title;
  bool isCompleted;

  Note({this.title, this.isCompleted = false});

  void changeCompleteness() {
    isCompleted = !isCompleted;
  }
}
