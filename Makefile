# Makefile simples para gerar os pdfs a partir do cadernos com as notas de aula.

# Pdfs
PDFS=00a_Introducao.pdf \
	00b_Configuracao_Julia.pdf \
	01_Computacao_com_Precisao_Finita.pdf \
	02_Formula_de_Taylor_e_Aproximacao_de_Derivadas.pdf \
	03_Equacoes_Nao-Lineares.pdf \
	04_Sistemas_Lineares.pdf \
	05_Quadrados_Minimos.pdf \
	06_Interpolacao_Polinomial.pdf \
	07_Integracao_Numerica.pdf \
	08_Problemas_de_Valor_Inicial.pdf \
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
%.pdf : %.ipynb
	jupyter nbconvert $(NBFLAGS) $^
	jupyter nbconvert --clear-output --inplace $^
	touch $@
