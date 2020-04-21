%we are getting the video input from the webcam.
v=videoinput('winvideo');

%now we are taking two snapshots from the videoinput which has a time
%difference of two seconds between them.
%we are converting both the snapshots to grey scale so that subtraction can
%be done easily.
    i=getsnapshot(v);
    imshow(i);
    i=rgb2gray(i);
    pause(2);
    
    j=getsnapshot(v);
    imshow(j);
    j=rgb2gray(j);
    pause(2);
    
    %we are now subtracting the two image matrices and converting it to a
    %binary matrix.
    z=imabsdiff(i,j);
    imshow(z);
    pause(2);
    z=im2bw(z);
    imshow(z);
    pause(2);
    [a b]=size(z);
    x=0;
    
    %we are iterating through the matrix z and checking for intensity
    %values. Where the values are 1 that means its white and where values
    %are 0 it means its black.
    
    for m=1:a
        for n=1:b
            if z(m,n)==1
                x=x+1;
            end
        end
    end
    
    %we are checking if there is a considerable amount of white in the
    %binary image. (here we are checking for atleast 1000 pixel values
    %that are white).If yes then motion is detected else there is no
    %motion.
    
    if(x>1000)
        disp('Motion Detected');
    else
        disp('No motion');
        
    end   