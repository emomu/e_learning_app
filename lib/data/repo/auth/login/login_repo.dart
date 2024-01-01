class LoginRepo{

  Future login() async {
    await Future.delayed(const Duration(seconds: 3));

    throw Exception("Giriş Yapamadınız.");
  }
}