function s = sphere_scaffold(n_az,n_el)
% sphere_scaffold
%   s = sphere_scaffold(n_az,n_el)
% DKS 2020

if nargin < 2
    n_el = n_az;
end

n_circ = 50;

theta = linspace(0,pi,n_az+1);
theta = theta(1:end-1);
phi = linspace(-pi/2,pi/2,n_el+1);
phi = phi(2:end-1);                 % do not draw the poles

s(length(theta)+length(phi),1) = struct();

x0 = [0,0,0];
%%% meridian
tv = NaN(1,3);
for ii = 1:length(theta)
    [tv(1),tv(2),tv(3)] = sph2cart(theta(ii),0,1);
    [tx,ty,tz] = circle3d(x0,tv,1,n_circ);
    s(ii).line = [tx;ty;tz];
end

%%% circle of latitude
vz = [0,0,1];
for ii = 1:length(phi)
    dx = [0,0,sin(phi(ii))];
    tr = cos(phi(ii));
    [tx,ty,tz] = circle3d(x0+dx,vz,tr,n_circ);
    s(n_az + ii).line = [tx;ty;tz];
end

end