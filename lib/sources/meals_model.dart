enum MealSize { Small, Medium, Large }

class MealCard {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final List<MealSize> pizzaSize;
  final String imgUrl;

  MealCard(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.price,
      required this.pizzaSize,
      required this.imgUrl});
}

List <MealCard>meals = <MealCard>[
  MealCard(
      id: '11-0001',
      name: 'Margherita',
      category: 'Pizza',
      description:
          "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words",
      price: 64.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic01.png'),
  MealCard(
      id: '11-0002',
      name: 'Spicy Delight',
      category: 'Pizza',
      description:
          "It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.",
      price: 74.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic02.png'),
  MealCard(
      id: '11-0004',
      name: 'Peppy Paneer',
      category: 'Pizza',
      description:
          "Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
      price: 63.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic03.png'),
  MealCard(
      id: '11-0005',
      name: 'Chicken Fiesta',
      category: 'Pizza',
      description:
          "a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature,",
      price: 64.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic04.png'),
  MealCard(
      id: '11-0006',
      name: 'Spicy Chicken',
      category: 'Pizza',
      description:
          "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero",
      price: 98.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic05.png'),
  MealCard(
      id: '11-0007',
      name: 'Gourmet',
      category: 'Pizza',
      description:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even",
      price: 75.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic06.png'),
  MealCard(
      id: '11-0008',
      name: 'Pepper',
      category: 'Pizza',
      description:
          "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
      price: 71.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic07.png'),
  MealCard(
      id: '11-0009',
      name: 'Margherita',
      category: 'Pizza',
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here",
      price: 86.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic08.png'),
  MealCard(
      id: '11-0010',
      name: 'Chicken Mexican',
      category: 'Pizza',
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia",
      price: 101.99,
      pizzaSize: [MealSize.Small, MealSize.Medium, MealSize.Large],
      imgUrl: 'assets/images/pic09.png'),
];
