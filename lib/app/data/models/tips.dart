class Tips {
  Tips({
    this.id,
    this.imageUrl,
    this.title,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? imageUrl;
  String? updatedAt;
}

final List<Tips> tipsData = [
  Tips(
    id: 2,
    title: 'Jakarta Fairship',
    imageUrl: 'assets/tips2.png',
    updatedAt: '11 Dec',
  ),
  Tips(
    id: 1,
    title: 'City Guidelines',
    imageUrl: 'assets/tips1.png',
    updatedAt: '20 Apr',
  ),
];
