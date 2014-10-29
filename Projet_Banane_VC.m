% setup MATLAB to use our software
setup ;

%% Labelling of an image
%Load the image
f=dir('*.jpg');
files={f.name};
for k=1:numel(files)
  IMDB{k}=imread(files{k})
end

for i = 1 : numel(files)
    imshow(IMDB{i});
    values_Steak{i}  = getrect;
    Label_Steak(i).image = files{i}
    Label_Steak(i).value = values_Steak{i}
    imshow(imcrop(IMDB{i},values_Steak{i}))
end




