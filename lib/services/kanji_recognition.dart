class KanjiRecognition {
  KanjiRecognitionResult recognize() {
    return KanjiRecognitionResult(text: "hogehoge");
  }
}

class KanjiRecognitionResult {
  final String text;

  KanjiRecognitionResult({required this.text});
}
