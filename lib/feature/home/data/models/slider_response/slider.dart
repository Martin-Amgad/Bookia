class SliderModal {
  String? image;

  SliderModal({this.image});

  factory SliderModal.fromJson(Map<String, dynamic> json) =>
      SliderModal(image: json['image'] as String?);

  Map<String, dynamic> toJson() => {'image': image};
}
