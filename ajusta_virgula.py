# -*- coding: UTF8
'''
Script simples para ajustar todas as ocorrências de virgula antes usadas para
separar as casas decimais.

Note que isso também vai trocar virgulas em algo como (1.2,1.3) que pode estar
na saída de algum código. Por isso é bom rodar depois todos os códigos para
ajustar as saídas de novo.
'''

import re
import sys

# Expressao regular representado numeros com virgula.
virgula_regex = re.compile(r'(\d+)(,)(\d+)', re.UNICODE)

# Le arquivo, faz a troca e guarda e o resultado.
nome_arquivo = sys.argv[1]
conteudo = file(nome_arquivo).read()
conteudo = virgula_regex.sub(r'\1{\2}\3', conteudo)
file(nome_arquivo, 'w').write(conteudo)
