class Hamburger {
  final String title;
  final String subtitle;
  final String url;
  final double rating;

  Hamburger({required this.title, required this.subtitle, required this.url, required this.rating});

}

List<Hamburger> hamburgers = [
  Hamburger(
    title: "Cheeseburger", 
    subtitle: "Wendy's Burger", 
    url: "assets/images/hamburger-1.jpg", 
    rating: 4.9 
  ),
  Hamburger(
    title: "Hamburger", 
    subtitle: "Veggie Burger", 
    url: "assets/images/hamburger-2.jpg", 
    rating: 4.8 
  ),
  Hamburger(
    title: "Hamburger", 
    subtitle: "Chicken Burger", 
    url: "assets/images/hamburger-3.jpg", 
    rating: 4.6
  ),
  Hamburger(
    title: "Hamburger", 
    subtitle: "Fried Chicken Burger", 
    url: "assets/images/hamburger-4.jpg", 
    rating: 4.5
  )
];



