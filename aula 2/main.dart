void main() {
  Cliente cli = Cliente(
    nome: "Paulo Donini",
    cpf: "123.456.789-10",
    senha: "123",
    cep: "94410-530"
  );
  
  print(cli);
}


class Cliente {
  //Atributos
  String? _nome;
  String? _cpf;
  String? _nascimento;
  String? _cep;
  String? _senha;
  
  //Método construtor
  Cliente({
    required String nome,
    required String cpf,
    String nascimento = "",
    String cep = "",
    required String senha
  }) {
    this._nome = nome;
    this._cpf = cpf;
    this._nascimento = nascimento;
    this._cep = cep;
    this._senha = senha;
  }
  
  //Métodos
  bool fazerLogin() {
    return
      (this._cpf == "123.456.789-10") &&
      (this._senha == "123");
  }
  
  //Getters e Setters
  get nome => this._nome;
  get cpf => this._cpf;
  get nascimento => this._nascimento;
  get cep => this._cep;
  get senha => this._senha;
  
  set nome(valor) => this._nome = valor;
  set cpf(valor) => this._cpf = valor;
  set nascimento(valor) => this._nascimento = valor;
  set cep(valor) => this._cep = valor;
  set senha(valor) => this._senha = valor;

  //Método toString
  @override
  String toString() {
    return "Nome: ${this._nome}\n" +
           "CPF: ${this._cpf}\n" +
           "Data de nascimento: ${this._nascimento}\n" +
           "CEP: ${this._cep}\n";
    }
}
