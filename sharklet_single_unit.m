
function sharklet_single_unit(xc, yc, Lx, Lymin, Lymax, sx, sy, xfmin, xfmax, yfmin, yfmax)

fprintf(2,"Center position: %d, %d\n", xc, yc);

% Unit cell at the center
x0 = xc - 3 * (Lx + sx);
y0 = yc;
fprintf(2,"--The 1st strip position: %d, %d\n", x0, y0);

xn = zeros(7,1);
xn(1) = x0;
for i=2:7
    xn(i) = xn(i-1) + Lx + sx;
end

Lyn = zeros(7,1);
for i=1:7
    slope = (Lymax - Lymin)/(xn(4)-xn(1));
    if (i <= 4)
        Lyn(i) = Lymin + slope*(xn(i) - xn(1));
    else
        Lyn(i) = Lymin + slope*(xn(7) - xn(i));
    end
end

for i=1:7
    width = Lx; % whatever
    height = Lyn(i); % whatever...
    xCenter = xn(i); % Wherever...
    yCenter = y0; % Wherever...
    xLeft = xCenter - width/2;
    yBottom = yCenter - height/2;
    rectangle('Position', [xLeft, yBottom, width, height], 'EdgeColor', 'b', 'FaceColor', 'b', 'LineWidth', 1);axis equal;
    %     axis off;
    set(gca,'xlim',[xfmin, xfmax]);
    set(gca,'ylim',[yfmin, yfmax]);
    set(gca,'position',[0 0 1 1]);
    hold on;
end


% Unit cell at the left top
x0 = xc - 3 * (Lx + sx) - 3 * (Lx + sx);
y0 = yc + (Lymin/2 + sy + Lymax/2);
fprintf(2,"Top Left--The 1st strip position: %d, %d\n", x0, y0);

xn = zeros(7,1);
xn(1) = x0;
for i=2:7
    xn(i) = xn(i-1) + Lx + sx;
end

Lyn = zeros(7,1);
for i=1:7
    slope = (Lymax - Lymin)/(xn(4)-xn(1));
    if (i <= 4)
        Lyn(i) = Lymin + slope*(xn(i) - xn(1));
    else
        Lyn(i) = Lymin + slope*(xn(7) - xn(i));
    end
end

for i=1:7
    width = Lx; % whatever
    height = Lyn(i); % whatever...
    xCenter = xn(i); % Wherever...
    yCenter = y0; % Wherever...
    xLeft = xCenter - width/2;
    yBottom = yCenter - height/2;
    rectangle('Position', [xLeft, yBottom, width, height], 'EdgeColor', 'b', 'FaceColor', 'b', 'LineWidth', 1);axis equal;
    set(gca,'xlim',[xfmin, xfmax]);
    set(gca,'ylim',[yfmin, yfmax]);
    set(gca,'position',[0 0 1 1]);
    hold on;
    %     axis off;
end

% Unit cell at the right top
x0 = xc - 3 * (Lx + sx) + 3 * (Lx + sx);
y0 = yc + (Lymin/2 + sy + Lymax/2);
fprintf(2,"Top Right--The 1st strip position: %d, %d\n", x0, y0);

xn = zeros(7,1);
xn(1) = x0;
for i=2:7
    xn(i) = xn(i-1) + Lx + sx;
end

Lyn = zeros(7,1);
for i=1:7
    slope = (Lymax - Lymin)/(xn(4)-xn(1));
    if (i <= 4)
        Lyn(i) = Lymin + slope*(xn(i) - xn(1));
    else
        Lyn(i) = Lymin + slope*(xn(7) - xn(i));
    end
end

for i=1:7
    width = Lx; % whatever
    height = Lyn(i); % whatever...
    xCenter = xn(i); % Wherever...
    yCenter = y0; % Wherever...
    xLeft = xCenter - width/2;
    yBottom = yCenter - height/2;
    rectangle('Position', [xLeft, yBottom, width, height], 'EdgeColor', 'b', 'FaceColor', 'b', 'LineWidth', 1);axis equal;
    set(gca,'xlim',[xfmin, xfmax]);
    set(gca,'ylim',[yfmin, yfmax]);
    set(gca,'position',[0 0 1 1]);
    hold on;
    %     axis off;
end

% Unit cell at the right bottom
x0 = xc + 3 * (Lx + sx) - 3 * (Lx + sx);
y0 = yc - (Lymin/2 + sy + Lymax/2);

fprintf(2,"Bottom Right--The 1st strip position: %d, %d\n", x0, y0);


xn = zeros(7,1);
xn(1) = x0;
for i=2:7
    xn(i) = xn(i-1) + Lx + sx;
end

Lyn = zeros(7,1);
for i=1:7
    slope = (Lymax - Lymin)/(xn(4)-xn(1));
    if (i <= 4)
        Lyn(i) = Lymin + slope*(xn(i) - xn(1));
    else
        Lyn(i) = Lymin + slope*(xn(7) - xn(i));
    end
end

for i=1:7
    width = Lx; % whatever
    height = Lyn(i); % whatever...
    xCenter = xn(i); % Wherever...
    yCenter = y0; % Wherever...
    xLeft = xCenter - width/2;
    yBottom = yCenter - height/2;
    rectangle('Position', [xLeft, yBottom, width, height], 'EdgeColor', 'b', 'FaceColor', 'b', 'LineWidth', 1);axis equal;
    set(gca,'xlim',[xfmin, xfmax]);
    set(gca,'ylim',[yfmin, yfmax]);
    set(gca,'position',[0 0 1 1]);
    hold on;
    %     axis off;
end

% Unit cell at the left bottom
x0 = xc - 3 * (Lx + sx) - 3 * (Lx + sx);
y0 = yc - (Lymin/2 + sy + Lymax/2);

fprintf(2,"Bottom Left--The 1st strip position: %d, %d\n", x0, y0);

xn = zeros(7,1);
xn(1) = x0;
for i=2:7
    xn(i) = xn(i-1) + Lx + sx;
end

Lyn = zeros(7,1);
for i=1:7
    slope = (Lymax - Lymin)/(xn(4)-xn(1));
    if (i <= 4)
        Lyn(i) = Lymin + slope*(xn(i) - xn(1));
    else
        Lyn(i) = Lymin + slope*(xn(7) - xn(i));
    end
end

for i=1:7
    width = Lx; % whatever
    height = Lyn(i); % whatever...
    xCenter = xn(i); % Wherever...
    yCenter = y0; % Wherever...
    xLeft = xCenter - width/2;
    yBottom = yCenter - height/2;
    rectangle('Position', [xLeft, yBottom, width, height], 'EdgeColor', 'b', 'FaceColor', 'b', 'LineWidth', 1);axis equal;
    set(gca,'xlim',[xfmin, xfmax]);
    set(gca,'ylim',[yfmin, yfmax]);
    set(gca,'position',[0 0 1 1]);
    hold on;
    %     axis off;
end

end  %end of function shrklet_single_unit(xc, yc, Lx, Lymin, Lymax, sx, sy)


