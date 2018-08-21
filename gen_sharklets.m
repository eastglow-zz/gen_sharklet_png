numstack = 40;
nsground = 10;
nssharklet = 10;
fnamebase = 'shkstack';



nunits_x = 1;  % # of unit cells along x axis
nunits_y = 1;  % # of unit cells along y axis

lx_uc = 100;
ly_uc = 100;

Lymin = 20;  % minimum y-length of a single strip
sx = 5;
sy = sx*1.25;

xc = 0;
yc = 0;

sharklet_color = [1 1 1]; %white
blank_color = [0 0 0]; %black
fig_default_color = blank_color;
%========================================================================
nsblank = numstack - nsground - nssharklet;

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

fig = figure('Color',fig_default_color,'Position',[figleft figbottom figwidth figheight]);
for i=0:nunits_x-1
    for j=0:nunits_y-1
        rectangle_single_unit(xc+lx_uc*i, yc+ly_uc*j, lx_uc, ly_uc, xfmin, xfmax, yfmin, yfmax, blank_color);
    end
end
hold on;
xfmin = xc - lx_uc/2;
xfmax = xc + lx_uc/2 + (nunits_x-1) * lx_uc;
yfmin = yc - ly_uc/2;
yfmax = yc + ly_uc/2 + (nunits_y-1) * ly_uc;

for i=0:nunits_x-1
    for j=0:nunits_y-1
        sharklet_single_unit(xc+lx_uc*i, yc+ly_uc*j, Lx, Lymin, Lymax, sx, sy, xfmin, xfmax, yfmin, yfmax, sharklet_color);
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

fname_sharklet = sprintf("SU%dby%dRes%dW%dH",nunits_x,nunits_y,figwidth,figheight);
fs = char(fname_sharklet);
saveas(fig,fullfile([fs, '.png']));
% close(fig);

fig2 = figure('Color',fig_default_color,'Position',[figleft figbottom figwidth figheight]);
for i=0:nunits_x-1
    for j=0:nunits_y-1
        rectangle_single_unit(xc+lx_uc*i, yc+ly_uc*j, lx_uc, ly_uc, xfmin, xfmax, yfmin, yfmax, blank_color);
    end
end
fname_blank = sprintf("BU%dby%dRes%dW%dH",nunits_x,nunits_y,figwidth,figheight);
fb = char(fname_blank);
saveas(fig2,fullfile([fb,'.png']));
% close(fig2);

fig3 = figure('Color',fig_default_color,'Position',[figleft figbottom figwidth figheight]);
for i=0:nunits_x-1
    for j=0:nunits_y-1
        rectangle_single_unit(xc+lx_uc*i, yc+ly_uc*j, lx_uc, ly_uc, xfmin, xfmax, yfmin, yfmax, sharklet_color);
    end
end
fname_ground = sprintf("GU%dby%dRes%dW%dH",nunits_x,nunits_y,figwidth,figheight);
fg = char(fname_ground);
saveas(fig3,fullfile([fg,'.png']));
% close(fig3);

% Generating a bunch of the stacked image
for i = 0:numstack-1
    fnamework = [fnamebase,num2str(i,'%03d'),'.png'];
    % The ground region
    if (i <= nsground-1)
        figwork = fig3;
        saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
    % The sharklet region
    if (i > nsground-1 && i <= nsground+nssharklet-1)
        figwork = fig;
        saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
    % The blank region
    if (i > nsground+nssharklet-1)
        figwork = fig2;
        saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
end

