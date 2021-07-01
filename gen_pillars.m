xlen = 4.8;
ylen = 4.8;
zlen = 5.12;

h_ground = 0.56;
h_pattern = 0.70;

pattern_shift_x = 0;
pattern_shift_y = 0;

rod_xlen = 0.01/2;
rod_ylen = rod_xlen;

symmetry_cut = "none"; % none: for full unit cells, x: symmetry for x-plane, y: symmetry for y-plane, xy: symmetry for xy plane
%Periodic shift only works if symmetry_cut = "none"
periodic_shift_center_x = 0.5; % Relative coorinate. 0.5: default
periodic_shift_center_y = 0.5; % Relative coorinate. 0.5: default

numpixel_x = 384;
numpixel_y = 384;

numstack = 256;
fnamebase = 'Rods';

nunits_x = 2;  % # of unit cells along x axis
nunits_y = 2;  % # of unit cells along y axis

%========================================================================

nsground = round(h_ground/zlen*numstack,0);
nssharklet = round(h_pattern/zlen*numstack,0);

lx_uc = numpixel_x/nunits_x;
ly_uc = numpixel_y/nunits_y;

%Lymin = round(sharklet_minyLen/ylen * numpixel_y,0);  % minimum y-length of a single strip
Lymin = rod_ylen;
sx = round(rod_xlen/xlen * numpixel_x,0);
sy = round(rod_ylen/ylen * numpixel_y,0);

xc = round(pattern_shift_x/xlen * numpixel_x,0);
yc = round(pattern_shift_y/ylen * numpixel_y,0);

sharklet_color = [1 1 1]; %white
blank_color = [0 0 0]; %black
fig_default_color = blank_color;
%========================================================================
nsblank = numstack - nsground - nssharklet;

%Lx = lx_uc/6 - sx;  % x-length of a single strip
Lx = rod_xlen - sx;

if (Lx <=0)
    disp("!!Negative or zero Lx; Increase lx_uc or decrease sx.");
end
Lymax = ly_uc - 2*sy - Lymin;
if (Lymax <=0)
    disp("!!Negative or zero Lymax; Increase ly_uc or decrease sy.");
end
if (Lymax <= Lymin)
    disp("!!Lymax < Lymin; Decrease Lymin or increase ly_uc or decrease sy.");
end

% txt = sprintf("Lx = %d, Lymax = %d\n",Lx, Lymax);

% fprintf(2,txt);

%Lymax = 700;  % maximum y-length of a single strip

figleft = 0;
figbottom = 0;
figwidth = lx_uc * nunits_x; % # of pixels
figheight = ly_uc * nunits_y; % # of pixels
    
xfmin = xc - lx_uc/2;
xfmax = xc + lx_uc/2 + (nunits_x-1) * lx_uc;
yfmin = yc - ly_uc/2;
yfmax = yc + ly_uc/2 + (nunits_y-1) * ly_uc;

fig = figure('Color',fig_default_color,'Position',[figleft, figbottom, figwidth, figheight]);
hold on;
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
for i=0:nunits_x-1
    for j=0:nunits_y-1
        rectangle_single_unit(xc+lx_uc*i, yc+ly_uc*j, lx_uc, ly_uc, xfmin, xfmax, yfmin, yfmax, blank_color, figleft, figbottom, figwidth, figheight);
    end
end

% xfmin = xc - lx_uc/2;
% xfmax = xc + lx_uc/2 + (nunits_x-1) * lx_uc;
% yfmin = yc - ly_uc/2;
% yfmax = yc + ly_uc/2 + (nunits_y-1) * ly_uc;

for i=0:nunits_x-1
    for j=0:nunits_y-1
        %sharklet_single_unit(xc+lx_uc*i, yc+ly_uc*j, Lx, Lymin, Lymax, sx, sy, xfmin, xfmax, yfmin, yfmax, sharklet_color, figleft, figbottom, figwidth, figheight);
        rectangle_single_unit(xc+lx_uc*i, yc+ly_uc*j, rod_xlen, rod_ylen, xfmin, xfmax, yfmin, yfmax, sharklet_color, figleft, figbottom, figwidth, figheight);
    end
end

% grid off;
% axis equal;
% set(gca, 'DataAspectRatioMode', 'auto');
% axis tight;
% set(gcf, 'position', [figleft, figbottom, figwidth, figheight]);
% set(gca,'xtick',[]);
% set(gca,'xticklabel',[]);
% set(gca,'ytick',[]);
% set(gca,'yticklabel',[]);
% set(fig,'position', [100 100 400 400]);
hold off;


% Output structure parameters
txt1 = sprintf("Lx = %d, Lymin = %d, Lymax = %d\n",Lx, Lymin, Lymax);
txt2 = sprintf("sx = %d, sy = %d\n",sx, sy);
txt3 = sprintf("lx_uc = %d, ly_uc = %d\n",lx_uc, ly_uc);
txt4 = sprintf("figwidth = %d, figheight = %d\n",figwidth, figheight);
txt5 = sprintf("xc = %d, yc = %d\n", xc, yc);

fprintf(2,txt1);
fprintf(2,txt2);
fprintf(2,txt3);
fprintf(2,txt4);
fprintf(2,txt5);

fname_sharklet = sprintf("SU%dby%dRes%dW%dH",nunits_x,nunits_y,figwidth,figheight);
fs = char(fname_sharklet);
set(fig,'position',[figleft, figbottom, figwidth, figheight]);
saveas(fig,fullfile([fs, '.png']));
% close(fig);

fig2 = figure('Color',fig_default_color,'Position',[figleft, figbottom, figwidth, figheight]);
for i=0:nunits_x-1
    for j=0:nunits_y-1
        rectangle_single_unit(xc+lx_uc*i, yc+ly_uc*j, lx_uc, ly_uc, xfmin, xfmax, yfmin, yfmax, blank_color, figleft, figbottom, figwidth, figheight);
    end
end
hold on;
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
hold off;

fname_blank = sprintf("BU%dby%dRes%dW%dH",nunits_x,nunits_y,figwidth,figheight);
fb = char(fname_blank);
set(fig2,'position',[figleft, figbottom, figwidth, figheight]);
saveas(fig2,fullfile([fb,'.png']));
% close(fig2);

fig3 = figure('Color',fig_default_color,'Position',[figleft, figbottom, figwidth, figheight]);
for i=0:nunits_x-1
    for j=0:nunits_y-1
        rectangle_single_unit(xc+lx_uc*i, yc+ly_uc*j, lx_uc, ly_uc, xfmin, xfmax, yfmin, yfmax, sharklet_color, figleft, figbottom, figwidth, figheight);
    end
end
hold on;
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
hold off;

fname_ground = sprintf("GU%dby%dRes%dW%dH",nunits_x,nunits_y,figwidth,figheight);
fg = char(fname_ground);
set(fig3,'position',[figleft, figbottom, figwidth, figheight]);
saveas(fig3,fullfile([fg,'.png']));
% close(fig3);

% Crop the figure considering the symmetry setting
%default values
figleft_crpd = figleft;
figbottom_crpd = figbottom;
figwidth_crpd = figwidth;
figheight_crpd = figheight;

tmp = strcmp(symmetry_cut, "xy");
% x-symmetry
if (strcmp(symmetry_cut, "x"))
    disp("x symmetry");
    figleft_crpd = figleft + figwidth/2 + 1;
    figbottom_crpd = figbottom;
    figwidth_crpd = figwidth;
    figheight_crpd = figheight;
end
% y-symmetry
if (strcmp(symmetry_cut, "y"))
    disp("y symmetry");
    figleft_crpd = figleft;
    figbottom_crpd = figbottom + figheight/2 + 1;
    figwidth_crpd = figwidth;
    figheight_crpd = figheight;
end
% xy-symmetry
if (strcmp(symmetry_cut, "xy"))
    disp("xy symmetry");
%     figleft_crpd = figleft + figwidth/2 + 1;
    figleft_crpd = figleft;
    figbottom_crpd = figbottom;
    figwidth_crpd = figwidth/2;
    figheight_crpd = figheight/2;
end

Fgr = getframe(fig3);
im_gr = frame2im(Fgr);
im_gr = imresize(im_gr, [figwidth figheight]);
Fpatt = getframe(fig);
im_patt = frame2im(Fpatt);
im_patt = imresize(im_patt, [figwidth figheight]);
Fblank = getframe(fig2);
im_blank = frame2im(Fblank);
im_blank = imresize(im_blank, [figwidth figheight]);
im_ground_crpd = imcrop(im_gr, 'Position',[figleft_crpd, figbottom_crpd, figwidth_crpd, figheight_crpd]);
im_pattern_crpd = imcrop(im_patt, 'Position',[figleft_crpd, figbottom_crpd, figwidth_crpd, figheight_crpd]);
im_blank_crpd = imcrop(im_blank, 'Position',[figleft_crpd, figbottom_crpd, figwidth_crpd, figheight_crpd]);

% Generating a bunch of the stacked image
for i = 0:numstack-1
    fnamework = [fnamebase,num2str(i,'%03d'),'.png'];
    % The ground region
    if (i <= nsground-1)
%         figwork = fig3;
        imwork = im_ground_crpd;
        imwrite(imwork, fnamework);
%         saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
    % The sharklet region
    if (i > nsground-1 && i <= nsground+nssharklet-1)
%         figwork = fig;
        imwork = im_pattern_crpd;
        imwrite(imwork, fnamework);
%         saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
    % The blank region
    if (i > nsground+nssharklet-1)
%         figwork = fig2;
        imwork = im_blank_crpd;
        imwrite(imwork, fnamework);
%         saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
end

