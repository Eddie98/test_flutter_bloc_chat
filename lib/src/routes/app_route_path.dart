enum AppRoute {
  chats(path: '/chats'),
  messages(path: 'messages');

  final String path;
  const AppRoute({required this.path});
}
