%im_ground = imread('SharkletRef000.png');
im_ground = imread('Rods000.png');
[sizexbase sizeybase sizezbase]= size(im_ground);

%im_pattern = imread('periodic_shift_pic.png');
im_pattern = imread('Rods035.png');
[sizexmain sizeymain sizezmain]= size(im_pattern);

%im_blank = imread('SharkletRef255.png');
im_blank = imread('Rods255.png');
[sizexbg sizeybg sizezbg]= size(im_blank);

xlen = 4.8;
ylen = 4.8;
zlen = 5.12;

h_ground = 0.56;
h_pattern = 0.70;

numstack = 128;
% directory = 'shift_89_110';
%fnamebase = 'ShkletShft';
fnamebase = 'RodsRef';

nsground = round(h_ground/zlen*numstack,0);
nssharklet = round(h_pattern/zlen*numstack,0);
nsblank = numstack - nsground - nssharklet;

% Generating a bunch of the stacked image
for i = 0:numstack-1
    fnamework = [fnamebase,num2str(i,'%03d'),'.png'];
    % The ground region
    if (i <= nsground-1)
%         figwork = fig3;
        imwork = im_ground;
        imwrite(imwork, fnamework);
%         saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
    % The sharklet region
    if (i > nsground-1 && i <= nsground+nssharklet-1)
%         figwork = fig;
        imwork = im_pattern;
        imwrite(imwork, fnamework);
%         saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
    % The blank region
    if (i > nsground+nssharklet-1)
%         figwork = fig2;
        imwork = im_blank;
        imwrite(imwork, fnamework);
%         saveas(figwork,fnamework);
%         hgexport(figwork, fnamework, hgexport('factorystyle'), 'Format', 'png');
    end
end