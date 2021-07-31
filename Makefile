# Makefile simples para gerar os pdfs a partir do cadernos com as notas de aula.

# Pdfs
PDFS=00a_Introducao.pdf \
	00b_Configuracao_Julia.pdf \
	01_Computacao_com_Precisao_Finita.pdf \
	02_Formula_de_Taylor_e_Aproximacao_de_Derivadas.pdf \
	#03_Equações_Não-Lineares.pdf \
	#04_Sistemas_Lineares.pdf \
	#05_Quadrados_Mínimos.pdf \
	#06_Interpolação_Polinomial.pdf \
	#07_Integração_Numérica.pdf \
	#08_Problemas_de_Valor_Inicial.pdf \
	#09_Problemas_de_Valor_de_Contorno.pdf

# Alvo principal
all : $(PDFS)

# Alvos de limpeza
.PHONY : clean cleanall

clean :
	-rm -r *_files

cleanall : clean
	-rm -r $(PDFS)

NBFLAGS=--TagRemovePreprocessor.remove_cell_tags="remove_cell" \
    --TemplateExporter.extra_template_basedirs="." \
	--template notas_template --execute --to pdf

# Regra para gerar os pdfs a partir dos respectivos cadernos
00a_Introducao.pdf : 00a_Introducao.ipynb
	jupyter nbconvert $(NBFLAGS) $^

00b_Configuracao_Julia.pdf : 00b_Configuracao_Julia.ipynb
	jupyter nbconvert $(NBFLAGS) $^

01_Computacao_com_Precisao_Finita.pdf : 01_Computacao_com_Precisao_Finita.ipynb
	jupyter nbconvert $(NBFLAGS) $^

02_Formula_de_Taylor_e_Aproximacao_de_Derivadas.pdf : 02_Formula_de_Taylor_e_Aproximacao_de_Derivadas.ipynb
	jupyter nbconvert $(NBFLAGS) $^

# 03_Equações_Não-Lineares.pdf : 03_Equacoes_Nao-Lineares.ipynb
# 	python converte_para_pdf.py $@

# 04_Sistemas_Lineares.pdf : 04_Sistemas_Lineares.ipynb
# 	python converte_para_pdf.py $@

# 05_Quadrados_Mínimos.pdf : 05_Quadrados_Minimos.ipynb
# 	python converte_para_pdf.py $@

# 06_Interpolação_Polinomial.pdf : 06_Interpolacao_Polinomial.ipynb
# 	python converte_para_pdf.py $@

# 07_Integração_Numérica.pdf : 07_Integracao_Numerica.ipynb
# 	python converte_para_pdf.py $@

# 08_Problemas_de_Valor_Inicial.pdf : 08_Problemas_de_Valor_Inicial.ipynb
# 	python converte_para_pdf.py $@

# 09_Problemas_de_Valor_de_Contorno.pdf: 09_Problemas_de_Valor_de_Contorno.ipynb
# 	python converte_para_pdf.py $@
