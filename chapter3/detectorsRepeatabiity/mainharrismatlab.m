clc
clear

v_nb_of_corespondencesh=[];
v_repeatabilityh=[];
aa=1;
alpha=0.04;
 for i=2:6
    str=num2str(i);
    original=imread('E:\MyResearch\code\akaze\featureDetector\source\data\img1.ppm');
    distorted=imread(strcat('E:\MyResearch\code\akaze\featureDetector\source\data\img',str,'.ppm'));
% ptsoriginalmser  = detectMSERFeatures(rgb2gray(original));
% ptsdistortedmser = detectMSERFeatures(rgb2gray(distorted));
%  a=[ptsoriginalmser.Location ptsoriginalmser.Axes ptsoriginalmser.Orientation  ];
%  b=[ptsdistortedmser.Location ptsdistortedmser.Axes  ptsdistortedmser.Orientation];
% 
% aa=2.8;

region1=harris(original,alpha);
region2=harris(distorted,alpha);

img1harris=[region1(:,1) region1(:,2) ones(size(region1,1),1).*aa zeros(size(region1,1),1) ones(size(region1,1),1).*aa ];
img2harris=[region2(:,1) region2(:,2) ones(size(region2,1),1).*aa zeros(size(region2,1),1) ones(size(region2,1),1).*aa ];
p1 = [1.0;size(img1harris,1)];
p2 = [1.0;size(img2harris,1)];
q1 = img1harris;
q2 = img2harris;
save('img1harris.txt','p1','q1','-ascii')
save('img2harris.txt','p2','q2','-ascii')
H=importdata(sprintf('H1to%dp',i));

[v_overlap, v_repeatability, v_nb_of_corespondences,matching_score,nb_of_matches] = repeatability('img1harris.txt', 'img2harris.txt',H, 'E:\MyResearch\code\akaze\featureDetector\source\data\img1.ppm',strcat('E:\MyResearch\code\akaze\featureDetector\source\data\img',sprintf('%d.ppm',i)),1);
v_nb_of_corespondencesh=[v_nb_of_corespondencesh v_nb_of_corespondences];
v_repeatabilityh=[v_repeatabilityh v_repeatability];
% % [v_overlap,v_repeatability,v_nb_of_corespondences,matching_score,nb_of_matches,twi] = repeatability('img1.haraff.sift','img2.haraff.sift','H1to2p','img1.ppm','img2.ppm',0);
% % [correct_match_nn,total_match_nn,correct_match_sim,total_match_sim,correct_match_rn,total_match_rn] = descperf('img1.haraff.sift','img2.haraff.sift','H1to2p','img1.ppm','img2.ppm',v_nb_of_corespondences(5),twi);
% % figure 
% display_features('img1harris.txt', '30.png',1,1) 
% figure
% plot(v_overlap,v_repeatability);
 end
