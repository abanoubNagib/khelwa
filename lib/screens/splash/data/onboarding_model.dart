class OnBoardingModel {
  final String name;
  final String description;
  final String image;

  OnBoardingModel({
    required this.name,
    required this.description,
    required this.image,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      name: json['name'],
      description: json['desc'],
      image: json['image'],
    );
  }
}