class GetFaqsResponse {
  int code;
  List<Faq> faqsData;

  GetFaqsResponse({
    this.code = 0,
    required this.faqsData,
  });
}

class Faq {
  String faqQuestion;
  String faqAnswer;
  bool isItemSelected;

  Faq({
    this.faqQuestion = "",
    this.faqAnswer = "",
    this.isItemSelected = false,
  });
}
