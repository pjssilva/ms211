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

# Regra para gerar o pdf a partir de um caderno
%.pdf : %.ipynb
	python converte_para_pdf.py $<
