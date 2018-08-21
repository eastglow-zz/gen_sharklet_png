
nunits_x = 1;  % # of unit cells along x axis
nunits_y = 1;  % # of unit cells along y axis

lx_uc = 100;
ly_uc = 100;

Lymin = 20;  % minimum y-length of a single strip
sx = 5;
sy = sx*1.25;

xc = 0;
yc = 0;

Lx = lx_uc/6 - sx;  % x-length of a single strip

if (Lx <=0)
    dist("!!Negative or zero Lx; Increase lx_uc or decrease sx.");
end
Lymax = ly_uc - 2*sy - Lymin;
if (Lymax <=0)
    dist("!!Negative or zero Lymax; Increase ly_uc or decrease sy.");
end
if (Lymax <= Lymin)
    dist("!!Lymax < Lymin; Decrease Lymin or increase ly_uc or decrease sy.");
end

% txt = sprintf("Lx = %d, Lymax = %d\n",Lx, Lymax);

% fprintf(2,txt);

%Lymax = 700;  % maximum y-length of a single strip

figleft = 0;
figbottom = 0;
figwidth = lx_uc * nunits_x;
figheight = ly_uc * nunits_y;

fig = figure('Color',[1 1 1],'Position',[figleft figbottom figwidth figheight]);
hold on;
xfmin = xc - lx_uc/2;
xfmax = xc + lx_uc/2 + (nunits_x-1) * lx_uc;
yfmin = yc - ly_uc/2;
yfmax = yc + ly_uc/2 + (nunits_y-1) * ly_uc;

for i=0:nunits_x-1
    for j=0:nunits_y-1
        sharklet_single_unit(xc+lx_uc*i, yc+ly_uc*j, Lx, Lymin, Lymax, sx, sy, xfmin, xfmax, yfmin, yfmax);
    end
end

grid off;
% axis equal;
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);


% Output structure parameters
txt1 = sprintf("Lx = %d, Lymin = %d, Lymax = %d\n",Lx, Lymin, Lymax);
txt2 = sprintf("sx = %d, sy = %d\n",sx, sy);
txt3 = sprintf("lx_uc = %d, ly_uc = %d\n",lx_uc, ly_uc);
txt4 = sprintf("figwidth = %d, figheight = %d\n",figwidth, figheight);

fprintf(2,txt1);
fprintf(2,txt2);
fprintf(2,txt3);
fprintf(2,txt4);

saveas(fig,'test.png');
