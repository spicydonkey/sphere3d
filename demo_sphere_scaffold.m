%% Demo for sphere_scaffold.m
% DKS

%% set up
n_interp = 200;


%%% Bloch sphere
% torque vector
urot.th = pi/2;
urot.phi = -0.15*pi/2;
urot.r = 1;
th = linspace(0,2*pi,n_interp);

% state vector
v = [0,0,-1]';


%% set up sphere data
% create scaffold
s = sphere_scaffold(2,2,n_interp);

% create surface
[ss.x,ss.y,ss.z] = sphere(n_interp);


%% PLOT
h_scaff = figure('name','sphere_scaffold');

% scaffold
ls = plot_scaffold(s);

set(ls,'Color','k');
% set(ls(1),'Color','r');
% ls(1).LineWidth = 10;
% ls(end).LineStyle = '--';


% surface
p_surf = surf(ss.x,ss.y,ss.z,'LineStyle','none');
p_surf.FaceAlpha = 0.8;
p_surf.FaceColor = 0.8*ones(1,3);
p_surf.AmbientStrength = 0.7;
p_surf.FaceLighting = "gouraud";

% view
view([-225,25]);        % conventional way to orient xyz-cartesian
% set(gca,'Projection',"perspective");

% camera/lighting
c = camlight('right');


%%% Bloch vector graphics
% torque vector
urot.xyz = (sph2xyz(urot.th,urot.phi,urot.r))';
p_torque = arrow3([0,0,0],1.5*urot.xyz','r-1.5',1.5);

% state trajectory
Vth = rot3theta(urot.xyz,v,th);

l = line(Vth(1,:),Vth(2,:),Vth(3,:));
l.Color = 'r';
l.LineStyle = '--';
l.LineWidth = 1.5;

% states
ket_logic = scatter3([0,0],[0,0],[1,-1],'ko','filled');
ket_logic.MarkerEdgeColor = 'none';
ket_logic.SizeData = 50;

%%% axis annotations
% axes arrows
p_x = arrow3([0,0,0],1.5*[1,0,0],'k-1',1);
p_y = arrow3([0,0,0],1.5*[0,1,0],'k-1',1);
p_z = arrow3([0,0,0],1.5*[0,0,1],'k-1',1);

axis tight;
axis equal;
xlabel('x');
ylabel('y');
zlabel('z');