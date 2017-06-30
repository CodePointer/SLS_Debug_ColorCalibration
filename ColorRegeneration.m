rand_dot_old = imread('4RandDot0_old.png');
[PROJECTOR_HEIGHT, PROJECTOR_WIDTH] = size(rand_dot_old);
rand_dot_old = double(rand_dot_old) / 255.0;
rand_dot = zeros(PROJECTOR_HEIGHT, PROJECTOR_WIDTH);
rand_dot_2 = zeros(PROJECTOR_HEIGHT, PROJECTOR_WIDTH);

for h = 1:2:PROJECTOR_HEIGHT
    for w = 1:2:PROJECTOR_WIDTH
        rand_dot(h:h+1, w:w+1) = rand_dot_old((h+1)/2, (w+1)/2);
    end
end

rand_dot_2(rand_dot_old > 0.5) = 1;

imwrite(rand_dot_2, '2RandDot0.png');
imwrite(rand_dot, '4RandDot0.png');