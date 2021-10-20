import sympy as sp
import numpy as np

# from sympy import cos, sin, exp
# CC: is this above line useful here ?
t = sp.Symbol("t")


class Boundary:
    """
    Defines the class Boundary, that contains geometric features of a boundary
    
    Attributes
    ==========
    param: parametrization of a boundary
    veloc: derivative of the parametrization
    accel: second derivative of the parametrization
    normal: normal vector to the boundary
    tangent: tangent vectors to the boundary
    curvature: signed curvature of the boundary
    jacobian: Jacobian of the boundary
    """

    def __init__(self, b):
        self.y = b

    @property
    def yp(self):
        return [sp.diff(p, t) for p in self.y]

    @property
    def ypp(self):
        return [sp.diff(p, t) for p in self.yp]

    @property
    def J(self):
        v2 = [i ** 2 for i in self.yp]
        sv2 = sum(v2)
        return sp.sqrt(sv2).simplify()

    @property
    def τ(self):
        return [p / self.J for p in self.yp]

    @property
    def ν(self):
        if len(self.y) == 2:
            tmp = (self.yp[1] / self.J, -self.yp[0] / self.J)
            return tmp
        else:
            raise ValueError("Need to define the normal vector for higher dimensions")

    @property
    def κ(self):  # curvature kappa
        if len(self.y) == 2:
            tmp = (self.yp[0] * self.ypp[1] - self.yp[1] * self.ypp[0]) / self.J ** 3
            return tmp.simplify()
        else:
            raise ValueError("Need to define the mean curvature for higher dimensions")

    def items(self):  # all elements of the class
        list_elem = ["y", "yp", "ypp", "J", "τ", "ν", "κ"]
        return [getattr(self, p) for p in list_elem]

    def items_lambdified(self):  # lambdified all elements
        return [sp.lambdify(t, p) for p in self.items()]


def lclassB(B):
    """
    Lambdify the Boundary class with specific attributes
    
    Parameters
    ==========
    cls: Boundary class
    
    Returns
    ==========
    cls: Boundary class lambdified   
    """
    attributes = ["y", "yp", "ypp", "J", "τ", "ν", "κ"]
    for a in attributes:
        symbolic = getattr(B, a)
        lam = np.vectorize(sp.lambdify(t, symbolic))
        setattr(B, a + "_l", lam)
    return B
