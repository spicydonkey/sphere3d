%% Demo for sphere_scaffold.m
% DKS

s = sphere_scaffold(6,6);


%%% PLOT
h_scaff = figure('name','sphere_scaffold');

l = plot_scaffold(s);

set(l,'Color','k');
set(l(1),'Color','r');
l(1).LineWidth = 10;
l(end).LineStyle = '--';

axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
view(3);