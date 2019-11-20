class RecentUploads {
  String imageUrl;
  String name;
  String description;
  int price;

  RecentUploads({
    this.imageUrl,
    this.name,
    this.description,
    this.price,
  });
}

final List<RecentUploads> uploads = [
  RecentUploads(
    imageUrl: 'assets/images/book1.jpg',
    name: 'RecentUploads 0',
    description: '404 Science',
    price: 175,
  ),
  RecentUploads(
    imageUrl: 'assets/images/book2.jpg',
    name: 'RecentUploads 1',
    description: '404 Math',
    price: 300,
  ),
  RecentUploads(
    imageUrl: 'assets/images/book3.jpg',
    name: 'RecentUploads 2',
    description: '404 Social',
    price: 240,
  ),
];
