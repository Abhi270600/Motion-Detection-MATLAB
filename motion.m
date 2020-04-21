 %videoReader function reads the video data
 vid=VideoReader('Sequence_03.mp4');
 %here we are converting the video to its image frames and storing the
 %images in a .jpg format
 numFrames = vid.NumFrames;
 n=numFrames;
 for i = 1:n    
 frames = read(vid,i);
 imwrite(frames,['Image' int2str(i), '.jpg']);
 %we are changing the names of each frame
 img(i)=image(frames);
 %we are storing all the images in another array called img
 end
 
 %once we have all the images frames we are checking for any motion in the
 %video. Here we are detecting a change in the position of an object 
 %relative to its surroundings or a change in the surroundings relative to
 %an object.
 
 %we are comparing only 2 simultaneous frames to detect motion.
 
     images='F:\Abhishek\4th sem\MATLAB\project\FINAL2';
     %we are reading all the jpg files to an array called jpgfiles.
     jpgfiles=dir(fullfile(images,'\*.jpg*'));
     im=jpgfiles(1).name;
     im1=imread(fullfile(images,im));
     imshow(im1);
     pause(2);
     im2=jpgfiles(2).name;
     im3=imread(fullfile(images,im2));
     imshow(im3);
     pause(2);
     
     %we are now subtracting the two image matrices and converting it to a
     %binary matrix.
     M=im3-im1;
     imshow(M);
     pause(2);
     M=im2bw(M);
     imshow(M);
     [a, b]=size(M);
     x=0;
     
     %we are iterating through the matrix M and checking for intensity
     %values. Where the values are 1 that means its white and where values
     %are 0 it means its black.
     
     for m=1:a
        for n=1:b
            if M(m,n)==1
                x=x+1;
            end
        end
     end
     
     %we are checking if there is a considerable amount of white in the
     %binary image. (here we are checking for atleast 1000 pixel values)
     %If yes then motion is detected else there is no motion.
     
     if(x>1000)
        disp('Motion Detected');
     else
        disp('No motion');
     end