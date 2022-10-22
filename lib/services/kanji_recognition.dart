class KanjiRecognition {
  KanjiRecognitionResult recognize() {
    return KanjiRecognitionResult(text: "hogehoge");
  }
}

class KanjiRecognitionResult {
  late final String text;

  KanjiRecognitionResult({required this.text});
}
