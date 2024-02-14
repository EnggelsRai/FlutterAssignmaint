

class UserData {
  const UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
    );
  }
}

class users_model {
  const users_model({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserData> data;
  final SupportData support;

  factory users_model.fromJson(Map<String, dynamic> json) {
    return users_model(
      page: json["page"],
      perPage: json["per_page"],
      total: json["total"],
      totalPages: json["total_pages"],
      data: List.from(json["data"] ?? [])
          .map((e) => UserData.fromJson(e ?? {}))
          .toList(),
      support: SupportData.fromJson(json["support"]),
    );
  }
}

class SupportData {
  const SupportData({required this.text, required this.url});
  final String url;
  final String text;

  factory SupportData.fromJson(Map<String, dynamic> json) {
    return SupportData(
      text: json["text"],
      url: json["url"],
    );
  }
}
