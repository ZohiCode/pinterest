class Profile {
  final String name;
  final String username;
  final String avatarUrl;

  Profile({
    required this.name,
    required this.username,
    required this.avatarUrl,
  });
  static Profile profile() {
    return Profile(
      name: 'Zohi Code',
      username: '@zohi',
      avatarUrl: 'https://i.pravatar.cc/300',
    );
  }
}