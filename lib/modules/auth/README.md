# Módulo de Autenticação

Este módulo implementa autenticação usando Firebase Auth seguindo os princípios de Clean
Architecture.

## Estrutura

### Domain Layer

- **Entities**: `Usuario.dart` - Entidade de domínio
- **Repositories**: `IAuthRepository.dart` - Interface do repositório de autenticação
- **Use Cases**:
    - `LoginComEmailESenha.dart`
    - `RegistrarComEmailESenha.dart`
    - `Logout.dart`
    - `ObterUsuarioAtual.dart`
    - `EnviarEmailRedefinicaoSenha.dart`

### Data Layer

- **Data Sources**: `FirebaseAuthDataSource.dart` - Implementação usando Firebase Auth
- **Repositories**: `AuthRepository.dart` - Implementação do repositório

### Presentation Layer

- **Controllers**: `AuthController.dart` - Controller GetX para gerenciar estado
- **Bindings**: `AuthBinding.dart` - Injeção de dependências

## Configuração do Firebase

### 1. Configuração Automática (Recomendado)

Este projeto utiliza o `flutterfire configure` para gerar o arquivo `firebase_options.dart`.

1. Instale a CLI do Firebase:

```bash
npm install -g firebase-tools
firebase login
```

2. Configure o projeto Flutter:

```bash
flutterfire configure
```

Selecione o projeto Firebase e as plataformas desejadas. Isso irá gerar/atualizar o arquivo
`lib/firebase_options.dart`.

3. Certifique-se que a inicialização no `main.dart` está usando as opções geradas:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

### 2. Habilitar métodos de autenticação no Firebase Console

1. Acesse o Firebase Console
2. Vá em Authentication > Sign-in method
3. Habilite "Email/Password"

## Uso

### Exemplo de Login

```dart
final authController = Get.find<AuthController>();

// Login
final sucesso = await authController.fazerLogin(
  'usuario@email.com',
  'senha123',
);

if (sucesso) {
  // Usuário autenticado
  final usuario = authController.usuarioAutenticado.value;
}
```

### Exemplo de Registro

```dart
final sucesso = await authController.fazerRegistro(
  'usuario@email.com',
  'senha123',
  'Nome do Usuário',
);
```

### Exemplo de Logout

```dart
await authController.fazerLogout();
```

### Observar estado de autenticação

```dart
Obx(() {
  if (authController.isAuthenticated.value) {
    return Text('Usuário autenticado');
  } else {
    return Text('Não autenticado');
  }
})
```

## Observáveis disponíveis

- `usuarioAutenticado`: Usuário atual autenticado
- `isAuthenticated`: Boolean indicando se há usuário autenticado
- `isLoading`: Boolean indicando se há operação em andamento
- `errorMessage`: String com mensagem de erro (se houver)

