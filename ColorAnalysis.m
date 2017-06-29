CAMERA_HEIGHT = 1024;
CAMERA_WIDTH = 1280;
viewport = [500, 700; 200, 400];

x_gt = zeros(CAMERA_HEIGHT, CAMERA_WIDTH);
y_gt = zeros(CAMERA_HEIGHT, CAMERA_WIDTH);
valid_mat = zeros(CAMERA_HEIGHT, CAMERA_WIDTH);
valid_mat(viewport(2,1):viewport(2,2), viewport(1,1):viewport(1,2)) = 1;
for h = viewport(2,1):viewport(2,2)
    for w = viewport(1,1):viewport(1,2)
        x_p = x_gt(h, w);
        y_p = y_gt(h, w);
        if x_p <= 0 || y_p <= 0
            valid_mat(h, w) = 0;
        end
    end
end

pure_color_mat = cell(4, 5);
for i_idx = 1:4
    for j_idx = 1:5
        pure_color_mat{i_idx, j_idx} = imread(['ColorDot', ...
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
        mix_color_mat{i_idx, j_idx} = imread(['ColorDot', ...
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
