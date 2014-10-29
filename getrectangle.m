function[rect] = getrectangle(im, Struct)
    for i = 1 : length(Struct)
        if strcmp(Struct(1,i).name,im)
            rect = Struct(1,i).rect
        end
    end
end
