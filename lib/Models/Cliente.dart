class Cliente {
  dynamic cliCodigo;
  dynamic cliNome;
  dynamic cliEndereco;
  dynamic cliBairro;
  dynamic cliCidade;
  dynamic cliCep;
  dynamic cliUf;
  dynamic cliFone;
  dynamic cliEmail;
  dynamic cliDatac;
  dynamic cliTipo;
  dynamic cliCelular;
  dynamic cliEndcorresp;
  dynamic cliObs;
  dynamic cliCpfCgc;
  dynamic cliSituacao;
  dynamic cliRg;
  dynamic cliDatanasc;
  dynamic cliPai;
  dynamic cliMae;
  dynamic cliSpc;
  dynamic cliEstcivil;
  dynamic cliConjuge;
  dynamic cliInclusaospc;
  dynamic cliDatainclusao;
  dynamic cliCheque;
  dynamic cliCarteira;
  dynamic cliAvalista;
  dynamic cliCpfa;
  dynamic cliFonea;
  dynamic cliRga;

  Cliente(
      {this.cliCodigo,
      this.cliNome,
      this.cliEndereco,
      this.cliBairro,
      this.cliCidade,
      this.cliCep,
      this.cliUf,
      this.cliFone,
      this.cliEmail,
      this.cliDatac,
      this.cliTipo,
      this.cliCelular,
      this.cliEndcorresp,
      this.cliObs,
      this.cliCpfCgc,
      this.cliSituacao,
      this.cliRg,
      this.cliDatanasc,
      this.cliPai,
      this.cliMae,
      this.cliSpc,
      this.cliEstcivil,
      this.cliConjuge,
      this.cliInclusaospc,
      this.cliDatainclusao,
      this.cliCheque,
      this.cliCarteira,
      this.cliAvalista,
      this.cliCpfa,
      this.cliFonea,
      this.cliRga});

  Cliente.fromJson(Map<dynamic, dynamic> json) {
    cliCodigo = json['cliCodigo'];
    cliNome = json['cliNome'];
    cliEndereco = json['cliEndereco'];
    cliBairro = json['cliBairro'];
    cliCidade = json['cliCidade'];
    cliCep = json['cliCep'];
    cliUf = json['cliUf'];
    cliFone = json['cliFone'];
    cliEmail = json['cliEmail'];
    cliDatac = json['cliDatac'];
    cliTipo = json['cliTipo'];
    cliCelular = json['cliCelular'];
    cliEndcorresp = json['cliEndcorresp'];
    cliObs = json['cliObs'];
    cliCpfCgc = json['cliCpfCgc'];
    cliSituacao = json['cliSituacao'];
    cliRg = json['cliRg'];
    cliDatanasc = json['cliDatanasc'];
    cliPai = json['cliPai'];
    cliMae = json['cliMae'];
    cliSpc = json['cliSpc'];
    cliEstcivil = json['cliEstcivil'];
    cliConjuge = json['cliConjuge'];
    cliInclusaospc = json['cliInclusaospc'];
    cliDatainclusao = json['cliDatainclusao'];
    cliCheque = json['cliCheque'];
    cliCarteira = json['cliCarteira'];
    cliAvalista = json['cliAvalista'];
    cliCpfa = json['cliCpfa'];
    cliFonea = json['cliFonea'];
    cliRga = json['cliRga'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['cliCodigo'] = this.cliCodigo;
    data['cliNome'] = this.cliNome;
    data['cliEndereco'] = this.cliEndereco;
    data['cliBairro'] = this.cliBairro;
    data['cliCidade'] = this.cliCidade;
    data['cliCep'] = this.cliCep;
    data['cliUf'] = this.cliUf;
    data['cliFone'] = this.cliFone;
    data['cliEmail'] = this.cliEmail;
    data['cliDatac'] = this.cliDatac;
    data['cliTipo'] = this.cliTipo;
    data['cliCelular'] = this.cliCelular;
    data['cliEndcorresp'] = this.cliEndcorresp;
    data['cliObs'] = this.cliObs;
    data['cliCpfCgc'] = this.cliCpfCgc;
    data['cliSituacao'] = this.cliSituacao;
    data['cliRg'] = this.cliRg;
    data['cliDatanasc'] = this.cliDatanasc;
    data['cliPai'] = this.cliPai;
    data['cliMae'] = this.cliMae;
    data['cliSpc'] = this.cliSpc;
    data['cliEstcivil'] = this.cliEstcivil;
    data['cliConjuge'] = this.cliConjuge;
    data['cliInclusaospc'] = this.cliInclusaospc;
    data['cliDatainclusao'] = this.cliDatainclusao;
    data['cliCheque'] = this.cliCheque;
    data['cliCarteira'] = this.cliCarteira;
    data['cliAvalista'] = this.cliAvalista;
    data['cliCpfa'] = this.cliCpfa;
    data['cliFonea'] = this.cliFonea;
    data['cliRga'] = this.cliRga;
    return data;
  }
}