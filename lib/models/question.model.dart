class Question{
  const Question(this.title , this.answer);

  final String title;
  final List<String> answer;

  List<String> getShuffled() {
    final suffle = List.of(answer);
    suffle.shuffle();
    return suffle;
  }
}