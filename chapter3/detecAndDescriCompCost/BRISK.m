clc
clear


imageFile1=imread('E:\MyResearch\paper\image\detector\Chaos\view\1.PNG');
imageFile2=imread('E:\MyResearch\paper\image\detector\Fossa\view\1.PNG');
imageFile3=imread('E:\MyResearch\paper\image\detector\Crater\view\1.PNG');
imageFile4=imread('E:\MyResearch\paper\image\detector\Colles\view\1.PNG');
    if length(size(imageFile1))==3
        image1= (rgb2gray(imageFile1));
    else
        image1= (imageFile1);
    end
    
    
    if length(size(imageFile2))==3
        image2= (rgb2gray(imageFile2));
    else
        image2= (imageFile2);
    end

    if length(size(imageFile3))==3
        image3= (rgb2gray(imageFile3));
    else
        image3= (imageFile3);
    end
    
    if length(size(imageFile4))==3
        image4= (rgb2gray(imageFile4));
    else
        image4= (imageFile4);
    end
        
        
tic        
points1=detectBRISKFeatures(image1);
t1=toc

tic
points2=detectBRISKFeatures(image2);
t2=toc

tic
points3=detectBRISKFeatures(image3);
t3=toc

tic
points4=detectBRISKFeatures(image4);
t4=toc


% tic
% extractFeatures(image1,points1,'Method','FREAK');
% extractFeatures(image1,points2,'Method','BRISK');
% extractFeatures(image1,points3);
% extractFeatures(image1,points4);
% toc/4