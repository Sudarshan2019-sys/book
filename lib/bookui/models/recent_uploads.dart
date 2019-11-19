class RecentUploads {
  String imageUrl;
  String name;
  String address;
  int price;

  RecentUploads({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<RecentUploads> uploads = [
  RecentUploads(
    imageUrl: 'assets/images/book1.jpg',
    name: 'RecentUploads 0',
    address: '404 Science',
    price: 175,
  ),
  RecentUploads(
    imageUrl: 'assets/images/book2.jpg',
    name: 'RecentUploads 1',
    address: '404 Math',
    price: 300,
  ),
  RecentUploads(
    imageUrl: 'assets/images/book3.jpg',
    name: 'RecentUploads 2',
    address: '404 Social',
    price: 240,
  ),
];
