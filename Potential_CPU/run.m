clear all; clc;

Z = 79; Dim = 3; RMSPro = 0.0; sigma = sqrt(RMSPro^2/3); IntTyp = 0;

rmin = 1e-02; rmax = 5.0; nr = 128;
dlnr = log(rmax/rmin)/(nr-1); r = rmin*exp((0:1:(nr-1))*dlnr);

tic;
[f1, df1] = get_Potential_CPU(1, Z, sigma, IntTyp, Dim, r);
[f2, df2] = get_Potential_CPU(2, Z, sigma, IntTyp, Dim, r);
[f3, df3] = get_Potential_CPU(3, Z, sigma, IntTyp, Dim, r);
[f4, df4] = get_Potential_CPU(4, Z, sigma, IntTyp, Dim, r);
[f5, df5] = get_Potential_CPU(5, Z, sigma, IntTyp, Dim, r);
[f6, df6] = get_Potential_CPU(6, Z, sigma, IntTyp, Dim, r);
toc;

figure(1);

subplot(1, 2, 1);
plot(r, f1, '-k', r, f2, '-b', r, f3, '-c', r, f4, '-m', r, f5, '-r', r, f6, '-g');
set(gca,'FontSize',12,'LineWidth',1,'PlotBoxAspectRatio',[1.25 1 1]);
title('Atomic potential');
ylabel('$\displaystyle V(r)$','interpreter','latex','FontSize',14);
xlabel('$\mathbf{r}$','interpreter','latex','FontSize',12);
xlim([0 rmax]);
legend('Doyle [0-4]', 'Peng [0-4]', 'Peng [0-12]', 'Kirkland [0-12]', 'Weickenmeier [0-12]', 'Lobato [0-12]');

subplot(1, 2, 2);
plot(r, df1, '-k', r, df2, '-b', r, df3, '-c', r, df4, '-m', r, df5, '-r', r, df6, '-g');
set(gca,'FontSize',12,'LineWidth',1,'PlotBoxAspectRatio',[1.25 1 1]);
title('Derivative of the Atomic potential');
ylabel('$\displaystyle \frac{d V(r)}{dr}$','interpreter','latex','FontSize',14);
xlabel('$\mathbf{r}$','interpreter','latex','FontSize',12);
xlim([0 rmax]);
legend('Doyle [0-4]', 'Peng [0-4]', 'Peng [0-12]', 'Kirkland [0-12]', 'Weickenmeier [0-12]', 'Lobato [0-12]');

set(gcf,'units','normalized','outerposition',[0 0 1 1]);