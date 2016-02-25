# Makefile simples para gerar os pdfs a partir do cadernos com as notas de aula.

# Pdfs
PDFS=Introdução.pdf \
	Computação_com_Precisão_Finita.pdf \
	Sistemas_Lineares.pdf \
	Equações_Não-Lineares.pdf \
	Quadrados_Mínimos.pdf \
	Interpolação_Polinomial.pdf \
	Integração_Numérica.pdf \
	Problemas_de_Valor_Inicial.pdf \
	Problemas_de_Valor_de_Contorno.pdf

# Alvo principal
all : $(PDFS)

# Alvos de limpeza
.PHONY : clean cleanall

clean :
	-rm -r *_files

cleanall : clean
	-rm -r $(PDFS)

# Regra para gerar os pdfs a partir dos respectivos cadernos
Introdução.pdf : Introducao.ipynb
	python converte_para_pdf.py $@

Computação_com_Precisão_Finita.pdf : Computacao_com_Precisao_Finita.ipynb
	python converte_para_pdf.py $@

Sistemas_Lineares.pdf : Sistemas_Lineares.ipynb
	python converte_para_pdf.py $@

Equações_Não-Lineares.pdf : Equacoes_Nao-Lineares.ipynb
	python converte_para_pdf.py $@

Quadrados_Mínimos.pdf : Quadrados_Minimos.ipynb
	python converte_para_pdf.py $@

Interpolação_Polinomial.pdf : Interpolacao_Polinomial.ipynb
	python converte_para_pdf.py $@

Integração_Numérica.pdf : Integracao_Numerica.ipynb
	python converte_para_pdf.py $@

Problemas_de_Valor_Inicial.pdf : Problemas_de_Valor_Inicial.ipynb
	python converte_para_pdf.py $@

Problemas_de_Valor_de_Contorno.pdf: Problemas_de_Valor_de_Contorno.ipynb
	python converte_para_pdf.py $@
