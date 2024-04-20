redMask = uint8(img(:,:,1) > 190 & % Rosso
                img(:,:,2) < 180 & % Verde
                img(:,:,3) < 140); % Blu
img = rgb2gray(img);
img = img .* redMask;
img = ~imbinarize(img);