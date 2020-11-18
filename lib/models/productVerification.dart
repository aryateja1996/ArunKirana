class ProductVerify {
  final String main;
  ProductVerify({this.main});

  // ignore: missing_return
  List<String> productVerify() {
    if (main == 'Biscuit') {
      List<String> bisuits = [
        'Bourbon',
        'DarkFantasy',
        'GoodDayKaju',
        'GoodDayCashew',
        'HappyHappy',
        'Hide&Seek',
        'KrackJack',
        'MarieGold',
        'Monaco',
        'OreoVanilla',
        'Parle-G'
      ];
      return bisuits;
    } else if (main == 'Flours') {
      List<String> flours = [
        'Wheat',
        'Aashirwad',
        'Maida',
        'Besan',
        'GokulBesan',
        'WhiteFlour',
      ];
      return flours;
    }
  }
}
