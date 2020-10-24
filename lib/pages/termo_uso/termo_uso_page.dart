import 'package:flutter/material.dart';

class TermoUsoPage extends StatefulWidget {
  @override
  _TermoUsoPageState createState() => _TermoUsoPageState();
}

class _TermoUsoPageState extends State<TermoUsoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Termos de uso'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                'https://www.gstatic.com/android/market_images/web/play_prism_hlock_2x.png'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: '1. Introdução\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                    TextSpan(
                      text:
                          'Termos aplicáveis. Agradecemos por usar o Google Play. O Google Play é um serviço fornecido pela Google LLC ("Google", ou "nós"), localizada em 1600 Amphitheatre Parkway, Mountain View Califórnia 94043, EUA. O uso que você faz do Google Play e dos apps (incluindo os Instant Apps Android), jogos, músicas, filmes, livros, revistas ou outros conteúdos ou serviços digitais (denominados "Conteúdo") disponíveis no Google Play está sujeito aos Termos de Serviço do Google Play e aos Termos de Serviço do Google ("TdS do Google") (conjuntamente denominados os "Termos"). O Google Play é um "Serviço" conforme descrito nos TdS do Google. Se houver algum conflito entre os Termos de Serviço do Google Play e os TdS do Google, os Termos de Serviço do Google Play prevalecerão.',
                    ),
                    TextSpan(
                        text: '\n\n2. Seu uso do Google Play\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                    TextSpan(
                      text:
                          'Acesso e uso do Conteúdo. Você pode utilizar o Google Play para procurar, localizar, visualizar e fazer streaming e/ou download de Conteúdo para seu dispositivo móvel, computador, TV, smartwatch ou outro dispositivo compatível ("Dispositivo"). Para utilizar o Google Play, você necessita de um Dispositivo que atenda aos requisitos de sistema e de compatibilidade do Conteúdo relevante, tenha acesso à Internet e use software compatível. A disponibilidade de Conteúdo e de recursos varia entre os países. Nem todos os recursos e Conteúdos podem estar disponíveis no seu país. Alguns Conteúdos podem estar disponíveis para compartilhamento com membros da família. O Conteúdo pode ser oferecido pelo Google ou disponibilizado por terceiros não afiliados ao Google. O Google não é responsável nem endossa o Conteúdo disponibilizado por meio do Google Play quando a origem do material não é o próprio Google.\n\n',
                    ),
                    TextSpan(
                      text:
                          'Restrições de idade. Para usar o Google Play, você precisa ter uma conta do Google válida ("Conta do Google"), sujeita às seguintes restrições de idade. Se for considerado menor de idade no seu país, você precisará da permissão de um pai ou responsável legal para usar o Google Play e para aceitar os Termos. É necessário obedecer a todas as restrições de idade adicionais que se aplicam ao uso de Conteúdo ou recursos específicos no Google Play. Os administradores e os membros da família também precisam atender aos requisitos adicionais a seguir.\n',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
