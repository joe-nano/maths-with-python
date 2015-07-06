FirstYearComputing_Master.pdf: FirstYearComputing_Master.tex \
	00-first-steps.tex 01-python-basics.tex 02-programs.tex \
	03-loops-control-flow.tex 04-basic-plotting.tex \
	05-classes-oop.tex 06-exceptions-debugging-testing.tex 07-numpy-plotting.tex \
	08-sympy.tex 09-statistics.tex
	pdflatex $<
	pdflatex $<



%.pdf: %.tex %.ipynb
	pdflatex $<
	pdflatex $<

%.tex: %.ipynb chapter-base.tplx
	ipython nbconvert --to latex --template=chapter-ipython.tplx $<

Exercises.tex: Exercises.ipynb
	ipython nbconvert --to latex $<
ExercisesSolutions.tex: ExercisesSolutions.ipynb
	ipython nbconvert --to latex $<

clean:
	rm *.{out,log,aux}
	rm -rf auto
	rm 0*tex
	rm -rf 0*files
	rm Exercises*tex
