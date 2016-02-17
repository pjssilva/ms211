from __future__ import print_function, absolute_import
from IPython.nbconvert.preprocessors.base import Preprocessor

class MyLatexPreprocessor(Preprocessor):

    def preprocess(self, nb, resources):
        # Generate Pygments definitions for Latex
        from pygments.formatters import LatexFormatter

        resources["latex"]["formatter"] = LatexFormatter(linenos=True)
        return nb, resources
