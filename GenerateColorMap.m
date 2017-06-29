rand_dot_mat = imread('4RandDot0.png');
rand_dot_mat = double(rand_dot_mat) / 255.0;
color_0_mat = ones(size(rand_dot_mat)) * 0;
color_1_mat = ones(size(rand_dot_mat)) * 0.33;
color_2_mat = ones(size(rand_dot_mat)) * 0.67;
color_3_mat = ones(size(rand_dot_mat)) * 1.0;

imwrite(color_0_mat, 'ColorDot0.png');
imwrite(color_1_mat, 'ColorDot1.png');
imwrite(color_2_mat, 'ColorDot2.png');
imwrite(color_3_mat, 'ColorDot3.png');

rand_dot_mat1 = zeros(size(rand_dot_mat));
rand_dot_mat2 = zeros(size(rand_dot_mat));
rand_dot_mat3 = zeros(size(rand_dot_mat));
for h = 1:800
    for w = 1:1280
        if abs(rand_dot_mat(h, w)) < 0.03
            rand_dot_mat1(h, w) = 0.33;
            rand_dot_mat2(h, w) = 0.67;
            rand_dot_mat3(h, w) = 1.0;
        elseif abs(rand_dot_mat(h, w) - 0.33) < 0.03
            rand_dot_mat1(h, w) = 0.67;
            rand_dot_mat2(h, w) = 1.0;
            rand_dot_mat3(h, w) = 0;
        elseif abs(rand_dot_mat(h, w) - 0.67) < 0.03
            rand_dot_mat1(h, w) = 1.0;
            rand_dot_mat2(h, w) = 0;
            rand_dot_mat3(h, w) = 0.33;
        elseif abs(rand_dot_mat(h, w) - 1.0) < 0.03
            rand_dot_mat1(h, w) = 0;
            rand_dot_mat2(h, w) = 0.33;
            rand_dot_mat3(h, w) = 0.67;
        end
    end
end
imwrite(rand_dot_mat1, '4RandDot1.png');
imwrite(rand_dot_mat2, '4RandDot2.png');
imwrite(rand_dot_mat3, '4RandDot3.png');