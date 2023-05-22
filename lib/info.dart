import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do Aplicativo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BuildFlow',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Versão: 1.0.0',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Desenvolvedor: Rafael Ramos e Gustavo Prehl',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Termos de Uso:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                  'Termos de Uso do aplicativo BuildFlow. Bem-vindo ao nosso aplicativo móvel! Antes de utilizá-lo, por favor, leia atentamente estes Termos de Uso, pois eles regem o seu acesso e uso do nosso aplicativo.'
                  '1. Aceitação dos Termos de Uso ao utilizar nosso aplicativo, você concorda em cumprir estes Termos de Uso. Se você não concorda com eles, por favor, não utilize o aplicativo.'
                  '2. Uso do AplicativoNosso aplicativo destina-se a fornecer informações, recursos e funcionalidades específicas relacionadas aos nossos produtos/serviços. Você concorda em utilizar o aplicativo apenas para fins legítimos e de acordo com todas as leis e regulamentos aplicáveis.'
                  '3. Propriedade IntelectualTodo o conteúdo presente no aplicativo, incluindo textos, imagens, gráficos, logotipos, ícones e software, é de propriedade exclusiva nossa ou de nossos parceiros. Você concorda em não copiar, modificar, distribuir, transmitir, exibir, vender, licenciar ou explorar qualquer conteúdo do aplicativo sem nossa autorização prévia por escrito.'
                  '4. PrivacidadeNossa política de privacidade explica como coletamos, usamos e protegemos suas informações pessoais ao utilizar o aplicativo. Ao utilizar o aplicativo, você concorda com a nossa política de privacidade.'
                  '5. Limitação de ResponsabilidadeO uso do aplicativo é por sua própria conta e risco. Não garantimos que o aplicativo estará livre de erros, interrupções, vírus ou outros componentes prejudiciais. Não seremos responsáveis por quaisquer danos diretos, indiretos, incidentais, consequenciais ou punitivos resultantes do seu acesso ou uso do aplicativo.'
                  '6. Modificações nos Termos de UsoPodemos modificar estes Termos de Uso a qualquer momento, a nosso critério. Quaisquer alterações entrarão em vigor imediatamente após a publicação dos termos atualizados no aplicativo. Recomendamos que você verifique regularmente os Termos de Uso para estar ciente de quaisquer alterações.'),
            ],
          ),
        ),
      ),
    );
  }
}
