imageSize = [400, 400];
img = ones(imageSize);
img_binary = zeros(imageSize);

% Primo subplot
subplot(1,2,1);
imshow(img);
hold on;
for i = 1:NumSegmenti
    % Genera casualmente gil estremi del segmento
    x1 = randi(imageSize(2)); y1 = randi(imageSize(1));
    x2 = randi(imageSize(2)); y2 = randi(imageSize(1));
    
    % Disegna il segmento sull'immagine
    line([x1 x2], [y1 y2], 'Color', 'black', 
                           'LineWidth', lineWidth);
    img_binary = insertShape(img_binary, 
                        'Line', [x1 y1 x2 y2], 'Color', 
                        'white', 'LineWidth', lineWidth);
end
hold off;

img_binary = imbinarize(rgb2gray(img_binary));

% Calcola la trasformata di Hough
[H,theta,rho] = hough(img_binary);

% Calcola le coordinate y
y = 1:imageSize(1);

% Calcola le coordinate theta e y_grid
theta_deg = theta - 90; theta_rad = deg2rad(theta_deg);
y_grid = linspace(1, imageSize(1), size(H, 1));
theta_grid = linspace(theta_rad(1), theta_rad(end), size(H, 2));

% Secondo subplot
subplot(1,2,2);
surf(theta_grid, y_grid, H, 'EdgeColor', 'none');