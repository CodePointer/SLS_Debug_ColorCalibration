CAMERA_HEIGHT = 1024;
CAMERA_WIDTH = 1280;
viewport = [220, 720; 220, 720];

main_path = 'E:/Structured_Light_Data/20170630/1/';

x_gt = load([main_path, 'pro/', 'xpro_mat0.txt']);
y_gt = load([main_path, 'pro/', 'ypro_mat0.txt']);
pattern1 = double(imread('4RandDot0.png')) / 255.0;
pattern2 = double(imread('4RandDot1.png')) / 255.0;
pattern3 = double(imread('4RandDot2.png')) / 255.0;
pattern4 = double(imread('4RandDot3.png')) / 255.0;
valid_mat = zeros(CAMERA_HEIGHT, CAMERA_WIDTH);
% valid_mat(viewport(2,1):viewport(2,2), viewport(1,1):viewport(1,2)) = 1;
for h = viewport(2,1):viewport(2,2)
    for w = viewport(1,1):viewport(1,2)
        x_p = x_gt(h, w);
        y_p = y_gt(h, w);
        if x_p <= 0 || y_p <= 0
            valid_mat(h, w) = 0;
        else
            valid_mat(h, w) = 1;
        end
    end
end

pic_path = [main_path, 'other/'];
pure_color_mat = cell(4, 5);
for i_idx = 1:4
    for j_idx = 1:5
        pure_color_mat{i_idx, j_idx} = imread([pic_path, 'PureColor_', ...
            num2str(i_idx - 1), '_', num2str(j_idx - 1), '.png']);
        pure_color_mat{i_idx, j_idx} = double(pure_color_mat{i_idx, j_idx}) / 255.0;
    end
end
pure_color_set = cell(CAMERA_HEIGHT, CAMERA_WIDTH);
for h = viewport(2,1):viewport(2,2)
    for w = viewport(1,1):viewport(1,2)
        if valid_mat(h, w) == 1
            pure_color_set{h, w} = zeros(5, 4);
            for i_idx = 1:4
                for j_idx = 1:5
                    pure_color_set{h, w}(j_idx, i_idx) = pure_color_mat{i_idx, j_idx}(h, w);
                end
            end
        end
    end
end

mix_color_mat = cell(4, 5);
for i_idx = 1:4
    for j_idx = 1:5
        mix_color_mat{i_idx, j_idx} = imread([pic_path, 'RandColor_', ...
            num2str(i_idx - 1), '_', num2str(j_idx - 1), '.png']);
        mix_color_mat{i_idx, j_idx} = double(mix_color_mat{i_idx, j_idx}) / 255.0;
    end
end
mix_color_set = cell(CAMERA_HEIGHT, CAMERA_WIDTH);
for h = viewport(2,1):viewport(2,2)
    for w = viewport(1,1):viewport(1,2)
        if valid_mat(h, w) == 1
            mix_color_set{h, w} = zeros(5, 4);
            for i_idx = 1:4
                for j_idx = 1:5
                    mix_color_set{h, w}(j_idx, i_idx) = mix_color_mat{i_idx, j_idx}(h, w);
                end
            end
        end
    end
end

% For 0630/1/:
%     h = 404, w = 394: mix_color_set have problem. 
%     y_gt = 374.86, x_gt = 882.24
%     h = 404, w = 398: mix_color_set have problem.

