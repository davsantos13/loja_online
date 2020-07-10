String getError(String code) {
  switch (code) {
    case 'ERROR_WEAK_PASSWORD':
      return 'Sua senha é muito fraca';

    case 'ERROR_INVALID_EMAIL':
      return 'Email inválido';

    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return 'Email já está em uso';

    case 'ERROR_INVALID_CREDENTIAL':
      return 'Email ou senha incorretos';

    case 'ERROR_WRONG_PASSWORD':
      return 'Email ou senha incorretos';

    case 'ERROR_USER_NOT_FOUND':
      return 'Não há usuário com este email';

    case 'ERROR_USER_DISABLED':
      return 'Usuário desativado';

    case 'ERROR_TOO_MANY_REQUESTS':
      return 'Muitas solicitações. Tente mais tarde';

    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'Operação não permitida';

    default:
      return 'Um erro indefinido ocorreu';
  }
}
