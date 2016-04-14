# Makefile simples para gerar os pdfs a partir do cadernos com as notas de aula.

# Pdfs
PDFS=Configuração_JuliaBox.pdf \
	Introdução.pdf \
	Computação_com_Precisão_Finita.pdf \
	Sistemas_Lineares.pdf \
	Fórmula_de_Taylor_e_Aproximação_de_Derivadas.pdf \
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
Configuração_JuliaBox.pdf : Configuracao_JuliaBox.ipynb
	python converte_para_pdf.py $@

Introdução.pdf : Introducao.ipynb
	python converte_para_pdf.py $@

Computação_com_Precisão_Finita.pdf : Computacao_com_Precisao_Finita.ipynb
	python converte_para_pdf.py $@

Sistemas_Lineares.pdf : Sistemas_Lineares.ipynb
	python converte_para_pdf.py $@

Fórmula_de_Taylor_e_Aproximação_de_Derivadas.pdf : Formula_de_Taylor_e_Aproximacao_de_Derivadas.ipynb
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
