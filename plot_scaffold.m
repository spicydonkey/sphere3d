function l = plot_scaffold(s)
% PLOT_SCAFFOLD
%   l = plot_scaffold(s)
%
%   l is an array of line objects
%   s is scaffold: struct array with "line" being 3D scaffold element
%
%
% SEE: sphere_scaffold.m, demo_sphere_scaffold.m
% DKS 2020

if ~isfield(s,'line')
    error('No "line" in struct.');
end

hold on;
l = gobjects(size(s));
for ii = 1:numel(s)
    tX = s(ii).line;
    l(ii) = line(tX(1,:),tX(2,:),tX(3,:));
end

end