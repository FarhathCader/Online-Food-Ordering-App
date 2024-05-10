class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<UnboardingContent> contents = [
  UnboardingContent(
    description: "Let's start with our tasty food",
    image: "images/burger.jpg",
    title: "Explore Flavorful Delights2, Order by Your Appetite's Delight!",
  ),
  UnboardingContent(
    title: "We have everything you need",
    description: "Let's start with card payment",
    image: "images/payment.jpg",
  ),
  UnboardingContent(
    title: "Delivering Delight, One Bite at a Time",
    description: "Let's start with our tasty food",
    image: "images/delivery.jpg",
  ),
];
