Mesh.MshFileVersion = 2.2;


//Parameters
h = 0.1;
l = 0;
L = 2;
delta = 0.5;
LL = L+ delta;
Angle1 = Pi/4;
Angle2 = Pi/6;
C = Cos(Angle1);
S = Sin(Angle1);
Cp = Cos(Angle1 + Angle2);
Cm = Cos(Angle1 - Angle2);
Sp = Sin(Angle1 + Angle2);
Sm = Sin(Angle1 - Angle2);
Cph = Cos(Angle1 + 0.5 * Angle2);
Cmh = Cos(Angle1 - 0.5 * Angle2);
Sph = Sin(Angle1 + 0.5 * Angle2);
Smh = Sin(Angle1 - 0.5 * Angle2);
Rx = Abs(L*Cp - 0.5*L*(Cp+0.5*(Cp+Cm)));
Ry = Abs(L*Sp - 0.5*L*(Sp+0.5*(Sp+Sm)));
R = Sqrt(Rx^2 + Ry^2);
//Points
Point(1) = {l*Cp, l*Sp, 0, h};
Point(2) = {L*Cp, L*Sp, 0, h};
Point(3) = {0.5* L* (Cp+Cm), 0.5* L* (Sp+Sm), 0, h};
//Point(4) = {l*Cm, l*Sm, 0, h};
Point(5) = {L*Cm, L*Sm, 0, h};
Point(6) = {0.5*L*(Cp+0.5*(Cp+Cm)), 0.5*L*(Sp+0.5*(Sp+Sm)), 0, h};
Point(7) = {0.5*L*(Cm+0.5*(Cp+Cm)), 0.5*L*(Sm+0.5*(Sp+Sm)), 0, h};
Point(8) = {0.5*L*(Cp+0.5*(Cp+Cm))+R*Cos(Pi/4), 0.5*L*(Sp+0.5*(Sp+Sm))+R*Sin(Pi/4), 0, h};
Point(9) = {0.5*L*(Cm+0.5*(Cp+Cm))+R*Cos(Pi/4), 0.5*L*(Sm+0.5*(Sp+Sm))+R*Sin(Pi/4), 0, h};

//Lines
Line(1) = {1,2};
Line(2) = {1,5};

//Circles
Circle(3) = {2,6,8};
Circle(4) = {8,6,3};
Circle(5) = {3,7,9};
Circle(6) = {9,7,5};

//Contour
Line Loop(1) = {1,3,4,5,6,-2};
Plane Surface(1) = {1};