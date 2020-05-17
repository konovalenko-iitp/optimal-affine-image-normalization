
clc;
clear;
close all;

frame = imread('pic/frame.png');

M_a = [0.7690 0.2092 17.66; -0.0979 1.1143 109.1623; 0 0 1];
M_p = [1.0695 0.7075 -194.1203; -0.0885 1.8013 -16.7545; 0.0001 0.0006 1];
tform = affine2d(M_a');
tic;
N = 1000;
for i = 1:N
    B = imwarp(frame,tform);
end
t_a = toc;
figure;
imshow(B);
axis on equal;
imwrite(B,'full_affine.png');

tform = projective2d(M_a');
tic;
for i = 1:N
    B = imwarp(frame,tform);
end
t_p = toc;
figure;
imshow(B);
axis on equal;
imwrite(B,'projective.png')

t_a = t_a / N
t_p = t_p / N
t_p / t_a