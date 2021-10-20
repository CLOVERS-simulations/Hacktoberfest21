# Hacktoberfest21
The CLOVERS members are attempting Hacktoberfest this year ! This repo contains codes to compute the scattering by a clover (penetrable or not), using the Finite Element Method (FEM) or Boundary Integral Method (BIE).


## Requirements

- GMSH version:
	-GMSH 4.8.4

- Python version:

  - Tested on Python 3.8;
  - Should works on Python 3.7 but not tested.

- Require the following libraries:

  - For msh generate: [gmsh-api](https://pypi.org/project/gmsh-api/)
  
  - For Finite Element computations: [NGSolve](https://ngsolve.org/downloads)

  - For numerical computations: [NumPy](https://github.com/numpy/numpy), and [SciPy](https://github.com/scipy/scipy);

  - For symbolic computations: [SymPy](https://github.com/sympy/sympy);

  - For visualization: [Matplotlib](https://github.com/matplotlib/matplotlib);

  - For Jupyter notebook: [IPython](https://github.com/ipython/ipython), [ipywidgets](https://github.com/jupyter-widgets/ipywidgets), and [JupyterLab](https://github.com/jupyterlab/jupyterlab).

Might works with previous versions of the libraries but if it does not works try to update the libraries for example through pip

```bash
python3 -m pip install --user --upgrade -r requirements.txt
```

Scripts to run: codes are provided in python and NGSolve.

```
$ example script.
```
