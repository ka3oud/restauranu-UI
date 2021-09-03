class Category {
  final String name;
  final String category;
  final String imgUrl;

  Category({required this.name, required this.category, required this.imgUrl});
}

List<Category> categories = [
  Category(
      name: 'Picture 001', category: 'Pizza', imgUrl: 'assets/images/rabes01.jfif'),
  Category(
      name: 'Picture 002',
      category: 'Breakfast',
      imgUrl: 'assets/images/rabes03.jfif'),
  Category(
      name: 'Picture 003',
      category: 'Ice_Coffee',
      imgUrl: 'assets/images/rabes06.jfif'),
  Category(
      name: 'Picture 004',
      category: 'Hot_Drink',
      imgUrl: 'assets/images/rabes08.png'),
  Category(
      name: 'Picture 005',
      category: 'Cookies',
      imgUrl: 'assets/images/rabes11.jfif'),
  Category(
      name: 'Picture 006', category: 'Pasta', imgUrl: 'assets/images/rabes02.jfif'),
  Category(
      name: 'Picture 007', category: 'Soap', imgUrl: 'assets/images/rabes09.jfif'),
  Category(
      name: 'Picture 008', category: 'Steak', imgUrl: 'assets/images/rabes05.jfif'),
  Category(
      name: 'Picture 009',
      category: 'Broccoli',
      imgUrl: 'assets/images/rabes04.jfif'),
  Category(
      name: 'Picture 010', category: 'Fruits', imgUrl: 'assets/images/rabes07.jfif'),
  Category(
      name: 'Picture 011', category: 'Splash', imgUrl: 'assets/images/rabes10.png'),
];
