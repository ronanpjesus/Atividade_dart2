/*import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;
void main() {
  // Mapa de nomes de alunos para suas notas
  Map<String, List<double>> alunosNotas = {
    'Ronan': [8.5, 7.0, 9.0],
    'Agis': [6.5, 7.5, 8.0],
    'Francisco': [9.0, 8.5, 8.0],
    'Samara': [7.0, 6.0, 7.5],
  };
  // Calcula a média de cada aluno
  for (var aluno in alunosNotas.keys) {
    List<double> notas = alunosNotas[aluno]!;
    double media = notas.reduce((a, b) => a + b) / notas.length;
    print('Média de $aluno: ${media.toStringAsFixed(2)}');
  }
}*/

import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  // busca os aluno no arquivo JSON
  String conteudo = await File('alunos_notas.json').readAsString();

  // Converte os dados para um Map
  Map<String, dynamic> alunosNotas = jsonDecode(conteudo);

  // Calcula a média de cada aluno

  for (var aluno in alunosNotas.keys) {
    List<dynamic> notasDinamicas = alunosNotas[aluno];

    // Converte cada elemento da lista para double e define o tipo como List<double>
    List<double> notas =
        notasDinamicas.map((nota) => (nota as num).toDouble()).toList();
    // exibe os resultados no terminal
    double media = notas.reduce((a, b) => a + b) / notas.length;
    print('Média de $aluno: ${media.toStringAsFixed(2)}');
  }
}
