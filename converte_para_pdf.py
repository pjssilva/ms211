'''
Converte para pdf usando nbconvert.

Esse script existe para contornar as deficiencias do make que nao lida
bem com nomes de arquivo que contem espaco.
'''

import sys
import shutil
import subprocess
import os
import unicodedata


def remove_acentos(s):
    return ''.join(c for c in unicodedata.normalize('NFD', s)
                   if unicodedata.category(c) != 'Mn')

# Pega o nome de arquivo e troca sublinha por espaco.
nome_base = sys.argv[1].decode("utf-8")[:-4]
nome_sem_acentos = remove_acentos(nome_base)
nome_com_espacos = nome_base.replace('_', ' ')

# Executa o comando usando um arquivo com nome adequado
# Comando para chamar nbconvert e suas opcoes.
comando = u"jupyter nbconvert --execute --allow-errors --config custom_cfg.py"
comando += u" --template notas.tplx --to pdf"
shutil.copy(nome_sem_acentos + ".ipynb", nome_com_espacos + ".ipynb")
comando += u' "%s"' % (nome_com_espacos + ".ipynb")
print comando
subprocess.call(comando, shell=True)
comando = u"jupyter nbconvert --template notas.tplx --to pdf"
comando += u' "%s"' % (nome_com_espacos + ".ipynb")
print comando
subprocess.call(comando, shell=True)

os.unlink(nome_com_espacos + ".ipynb")
os.rename(nome_com_espacos + ".pdf", nome_base + ".pdf")
