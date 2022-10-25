bool isValidCPF(String cpf) {
  cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  if (cpf.length != 11) {
    return false;
  }

  if (cpf == '00000000000' ||
      cpf == '11111111111' ||
      cpf == '22222222222' ||
      cpf == '33333333333' ||
      cpf == '44444444444' ||
      cpf == '55555555555' ||
      cpf == '66666666666' ||
      cpf == '77777777777' ||
      cpf == '88888888888' ||
      cpf == '99999999999') return false;

  int sum = 0;

  for (int i = 1; i <= 9; i++) {
    sum += int.parse(cpf[i - 1]) * (11 - i);
  }

  int rest = (sum * 10) % 11;

  if ((rest == 10) || (rest == 11)) {
    rest = 0;
  }

  if (rest != int.parse(cpf[9])) {
    return false;
  }

  sum = 0;

  for (int i = 1; i <= 10; i++) {
    sum += int.parse(cpf[i - 1]) * (12 - i);
  }

  rest = (sum * 10) % 11;

  if ((rest == 10) || (rest == 11)) {
    rest = 0;
  }

  if (rest != int.parse(cpf[10])) {
    return false;
  }

  return true;
}

void main() {
  print('CPF: 263.900.600-25 ${isValidCPF("26390060025")}!');
  print('CPF: 263.900.600-26 ${isValidCPF("26390060026")}!');
}
