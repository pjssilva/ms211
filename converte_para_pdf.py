'''
Converte para pdf usando nbconvert.

Esse script existe para contornar as deficiencias do make que nao lida
bem com nomes de arquivo que contem espaco.
'''

import sys
import shutil
import os

# Comando para chamar nbconvert e suas opcoes.
opcoes = " --execute --config custom_cfg.py --template notas.tplx"
opcoes += " --to pdf"
comando = "jupyter nbconvert" + opcoes

# Pega o nome de arquivo e troca sublinha por espaco.
nome_arquivo = sys.argv[1][:-6]
nome_com_espacos = nome_arquivo.replace('_', ' ')

# Executa o comando usando um arquivo com nome adequado
shutil.copy(nome_arquivo + ".ipynb", nome_com_espacos + ".ipynb")
comando += ' "%s"' % (nome_com_espacos + ".ipynb")
print comando
os.system(comando)
os.unlink(nome_com_espacos + ".ipynb")
os.rename(nome_com_espacos + ".pdf", nome_arquivo + ".pdf")
