
function rectangle_single_unit(xc, yc, Lx, Ly, xfmin, xfmax, yfmin, yfmax, col)

% fprintf(2,"Center position: %d, %d\n", xc, yc);

width = Lx; % whatever
height = Ly; % whatever...
xCenter = xc; % Wherever...
yCenter = yc; % Wherever...
xLeft = xCenter - width/2;
yBottom = yCenter - height/2;
rectangle('Position', [xLeft, yBottom, width, height], 'EdgeColor', col, 'FaceColor', col, 'LineWidth', 1);axis equal;
%     axis off;
set(gca,'xlim',[xfmin, xfmax]);
set(gca,'ylim',[yfmin, yfmax]);
set(gca,'position',[0 0 1 1]);
hold on;

end  %end of function shrklet_single_unit(xc, yc, Lx, Lymin, Lymax, sx, sy)


