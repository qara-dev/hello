class ServerErrorBody {
  ServerErrorBody({required this.code, required this.message});

  factory ServerErrorBody.fromJson(Map<String, dynamic> json) =>
      ServerErrorBody(code: json["error"], message: json["message"]);
  final String code;
  final String message;
}
