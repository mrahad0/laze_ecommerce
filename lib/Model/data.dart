class DataSection {
  final String title;
  final String content;

  const DataSection({
    required this.title,
    required this.content,
  });
}

const String dataText = "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.";

final List<DataSection> termsOfServiceSections = [
  DataSection(title: '1. Introduction', content: dataText),
  DataSection(title: '2. User Responsibilities', content: dataText),
  DataSection(title: '3. Privacy and Data Collection', content: dataText),
  DataSection(title: '4. User Content', content: dataText),
  DataSection(title: '5. Subscription and Payment', content: dataText),
];