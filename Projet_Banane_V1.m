%%%%%%%%%%%%%%%%%%% LABELLING OUR DATA SET %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Loading our data base

% Create the list of the different label

Labels = {'Chicken','Fries'};%,'Lettuce','Rice','Salmon','Steak',};
AllImages ={};
l = length(AllImages);

%Load the image and store them in our data base.

for j = 1 : length (Labels)
    folder = Labels{1,j};
    filePattern = fullfile('images',folder, '*.jpg');
    f=dir(filePattern);
    files={f.name};
    for k=1:numel(files)
        fullFileName = fullfile('images',folder, files{k});
        cellArrayOfImages{k}=imread(fullFileName);
        cellArrayOfNames{k}= files{k};
        AllImages{l+k} = files{k}(1:end-4);
        Allimread{l+k} = cellArrayOfImages{k};
    end
    l = length(AllImages);
    Images{j} = cellArrayOfImages;
    Names{j} = cellArrayOfNames;
    clearvars cellArrayOfImages;
    clearvars cellArrayOfNames;
end

% Create the structure with all the images of a given label
%Labels_images = cell2struct(Images, Labels, 2);
%Labels_names = cell2struct(Allimread, AllImages, 2);


%% Labelling images
% First version going only once through our data set but if an images has
% severals labels it creates severals entries.
Label_struc = struct('name',{},'rect',{});
Test = struct('labels',{},'id',{});
l = length (Label_struc);
for i = 1 : length(Labels)
    for j = 1 : length(Images{i})
        imshow(Images{i}{j});
        title(sprintf('%s', Labels{i}) );
        id = getrect;
        Label_struc(1,j+l).name = Names{i}{j};
        Test(1,1).labels = Labels{i};
        Test(1,1).id = id;
        Label_struc(1,j+l).rect = Test;
    end
    Test = struct('labels',{},'id',{});
    l = length (Label_struc);
end

save('structfile.mat','Label_struc');

Test bite
%%
%Second version going as many times as there are labels but creating only
%one entry per images
Label_Steackstruc2 = struct('name',{},'rect',{});
Test2 = struct('labels',{},'id',{});
for j = 1 : length(Allimread)
    for i = 1 : length(Labels)
        imshow(Allimread{j});
        title(sprintf('%s', Labels{i}) );
        id = getrect;
        Test2(1,i).labels = Labels{i};
        Test2(1,i).id = id;
    end
    Label_Steackstruc2(1,j).name = AllImages{j};
    Label_Steackstruc2(1,j).rect = Test2;
end


% for i = 1 : length(Labels)
%     for j = 1 : length(Images{i})
%         imshow(Images{i}{j});
%         id = getrect;
%         cellArrayOfRectangle{j}= id;
%     end
%     LabelsId{i} = cellArrayOfRectangle;
%     clearvars cellArrayOfRectangle;
% end

% Create a structure with all the rectangle id of a given label
% Labels_Id = cell2struct(LabelsId, Labels, 2);
%
%
%
%
%
% Label_Steackstruc = struct('name',{},'rect',{});
%
% for i = 1 : 2
%     imshow(Images{1}{i});
%     id = getrect;
%     Label_Steackstruc(1,i).name = files{i};
%     Label_Steackstruc(1,i).rect = id;
% end
%
% id_steack = getrectangle('img_7977.jpg', Label_Steackstruc);
%
%
%
%
%
% %im1 = imread('img_7977.jpg');
% %imshow(im1);
% %id_steack  = getrect;
% %im2 = imcrop(im1, id_steack);
%
%
%
% % Label_Steack = zeros(5,2)
% % for i = 1 : 2
% %     imshow(IMDB{i});
% %     id = getrect;
% %     for j = 1 : length(id)
% %         Label_Steack(j+1,i) = id(j);
% %     end
% % end
