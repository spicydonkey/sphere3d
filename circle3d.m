function [x,y,z] = circle3d(cent,normvec,radius,n)
% CIRCLE3D
%   [x,y,z] = circle3d(cent,normvec,radius,n)
% Creates an x,y,z (1 x n+1) vector around a circle.
%   
% NOTE: vector is n+1 length since the circle wraps around.
%
% CREDIT for the elegant solution by
%   Christian Reinbacher (2020). Plot Circle in 3D (https://www.mathworks.com/matlabcentral/fileexchange/26588-plot-circle-in-3d), MATLAB Central File Exchange. Retrieved May 30, 2020. 
%
% DKS 2020

theta = linspace(0,2*pi,n+1);

v = null(normvec);
xyz = repmat(cent',1,n+1) + radius*(v(:,1)*cos(theta)+v(:,2)*sin(theta));

x = xyz(1,:);
y = xyz(2,:);
z = xyz(3,:);
end