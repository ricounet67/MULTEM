function [Crys3D, lx, ly, lz, a, b, c, dz] = Al001Crystal(na, nb, nc, ncu, sigma)
CrysPar.na = na;
CrysPar.nb = nb;
CrysPar.nc = nc;
a = 4.0493; 
b = 4.0493; 
c = 4.0493;
CrysPar.a = a;
CrysPar.b = b;
CrysPar.c = c;
CrysPar.nuLayer = 2;
% x y z Z sigma occupancy
CrysPar.uLayer(1).Atoms = [0.0, 0.0, 0.0, 13, sigma, 1; 0.5, 0.5, 0.0, 13, sigma, 1];
CrysPar.uLayer(2).Atoms = [0.0, 0.5, 0.5, 13, sigma, 1; 0.5, 0.0, 0.5, 13, sigma, 1];
Crys3D = get_CrystalbyLayers_CPU(CrysPar);

dz = CrysPar.c/ncu;
lx = na*CrysPar.a; ly = nb*CrysPar.b; lz = nc*CrysPar.c;