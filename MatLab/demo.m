
% demo

clc;
clear;
close all;

h = 600; 
w = (86/54)*h;
shift = 200;
goal = shift + [0 w w 0; 0 0 h h];
markup = [326 1313 1299 94; 183 247 757 623];
fields{1} = goal;
fields{2} = shift + [0.09*w 0.92*w 0.92*w 0.09*w; 0.54*h 0.54*h 0.66*h 0.66*h];
fields{3} = shift + [0.43*w 0.59*w 0.59*w 0.43*w; 0.73*h 0.73*h 0.8*h 0.8*h];
fields{4} = shift + [0.08*w 0.55*w 0.55*w 0.08*w; 0.8*h 0.8*h 0.88*h 0.88*h];
H = calc_Homography(markup, goal)

rect.x_min = min(fields{2}(1, :));
rect.x_max = max(fields{2}(1, :));
rect.y_min = min(fields{2}(2, :));
rect.y_max = max(fields{2}(2, :));
rect.U = [1 0; 0 1];

isVerticesOnly = false;
L_2_optimal_transforms = get_L_2_optimal_transforms(H, rect, isVerticesOnly);
for i = 1:size(L_2_optimal_transforms, 2)
    disp(L_2_optimal_transforms{i}.transform_family);
    disp(L_2_optimal_transforms{i}.A);
    disp(['L_2   = ', num2str(L_2_optimal_transforms{i}.L_2_loss)]);
    disp(['L_inf = ', num2str(L_2_optimal_transforms{i}.L_inf_loss)]);
    disp(newline);
end

%% visualization

FontSize = 20;

A = [L_2_optimal_transforms{6}.A; 0 0 1];
V = A*H^(-1);
frame_input = imread('pic/frame.png');
tic
for iii = 1:1
    frame_proj        = projectTransformImage(frame_input, H^(-1));
end
toc
frame_affin =  affineTransformImage(frame_input, A^(-1));
ax_lim.x = [0 size(frame_input,2)];
ax_lim.y = [0 size(frame_input,1)];
Ticks = -2000:200:+2000;

fig = figure();
hold on;
set(gca,'YDir', 'reverse','FontSize',15);
% title('Source image');
set(gca,'YDir', 'reverse');
image(frame_input);
axis equal;
xlim(ax_lim.x);
ylim(ax_lim.y);
set(gca,'xTick',Ticks);
set(gca,'yTick',Ticks);
xlabel('pixels','FontSize', FontSize);
ylabel('pixels','FontSize', FontSize);
save_plot(fig,'pic/fig_input.png');
imwrite(frame_input, 'pic/frame_input.png');

fig = figure();
hold on;
set(gca,'YDir', 'reverse','FontSize',15);
% title('Perspective correction');
set(gca,'YDir', 'reverse');
for i = 1:size(fields, 2)
    frame_proj = add_quad2image(frame_proj, fields{i}, 255*[0 0 0], 3);
end
image(frame_proj);
axis equal;
axis equal;
xlim(ax_lim.x);
ylim(ax_lim.y);
set(gca,'xTick',Ticks);
set(gca,'yTick',Ticks);
xlabel('pixels','FontSize', FontSize);
ylabel('pixels','FontSize', FontSize);
save_plot(fig,'pic/fig_proj.png');
imwrite(frame_proj, 'pic/frame_proj.png');

fig = figure();
hold on;
grid on;
set(gca,'YDir', 'reverse','FontSize',15);
% title('Approximation of perspective correction');
set(gca,'YDir', 'reverse');
for i = 1:size(fields, 2)
    frame_affin = add_quad2image(frame_affin, fields{i}, 255*[0 0 0], 3);
end
image(frame_affin);
axis equal;
xlim(ax_lim.x);
ylim(ax_lim.y);
set(gca,'xTick',Ticks);
set(gca,'yTick',Ticks);
xlabel('pixels','FontSize', FontSize);
ylabel('pixels','FontSize', FontSize);
save_plot(fig,'pic/fig_affin.png');
imwrite(frame_affin, 'pic/frame_affin.png');

fig = figure();
hold on;
set(gca,'YDir', 'reverse','FontSize',15);
set(gca,'YDir', 'reverse');
plot_all(V, goal);
axis equal;
xlim(ax_lim.x);
ylim(ax_lim.y);
set(gca,'xTick',Ticks);
set(gca,'yTick',Ticks);
xlabel('pixels','FontSize', FontSize);
ylabel('pixels','FontSize', FontSize);
save_plot(fig,'pic/fig_d.png');




