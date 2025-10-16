class CategoryItem {
  final String id;
  final String name;
  final String imgUrl;

  const CategoryItem({
    required this.id,
    required this.name,
    required this.imgUrl,
  });
}

List<CategoryItem> categories = [
  CategoryItem(
      id: "1", name: "Burgers", imgUrl: "assets/categories/burger.png"),
  CategoryItem(id: "2", name: "Pizza", imgUrl: "assets/categories/pizza.png"),
  CategoryItem(
      id: "3", name: "Pasta", imgUrl: "assets/categories/spaguetti.png"),
 
];
