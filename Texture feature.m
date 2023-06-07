clear all
close all
clc
clk=1;
M=1;
for i=1:M
   str=strcat(int2str(i),'.tiff');  
    eval('img=imread(str);');
  %  img=imread('1.tiff');
%  img=rgb2gray(img);
    figure(1)
     imshow(img)
%      title("Original Image");
    I2= imresize(img,[208,208]);  
        m=size(I2,1);
    n=size(I2,2);
    I3=[]; I31=[];I32=[]; I4=[];I41=[];BPIE1=[];
    c1=1;
    for i=3:m-3
        for j=3:n-3
        J0=I2(i,j);
        I3(1,c1)=I2(i,j+1)-J0;
        I3(2,c1)=I2(i-1,j+1)-J0;
        I3(3,c1)=I2(i-1,j)-J0; 
        I3(4,c1)=I2(i-1,j-1)-J0;
        I3(5,c1)=I2(i,j-1)-J0;
        I3(6,c1)=I2(i+1,j-1)-J0;
        I3(7,c1)=I2(i+1,j)-J0;
        I3(8,c1)=I2(i+1,j+1)-J0;
       
        I31(1,c1)= (J0-I2(i,j+2));
        I31(2,c1)=(J0-I2(i-2,j+2));
        I31(3,c1)=(J0-I2(i-2,j));
        I31(4,c1)=(J0-I2(i-2,j-2));
        I31(5,c1)=(J0-I2(i,j-2)); 
        I31(6,c1)=(J0-I2(i+2,j-2));
        I31(7,c1)=(J0-I2(i+2,j));
        I31(8,c1)=(J0-I2(i+2,j+2));    
        
        I32(1,c1)=(J0-I2(i-1,j-2));
        I32(2,c1)=(J0-I2(i+1,j-2));
        I32(3,c1)=(J0-I2(i+2,j-1));
        I32(4,c1)=(J0-I2(i+2,j+1));
        I32(5,c1)=(J0-I2(i+1,j+2));
        I32(6,c1)=(J0-I2(i-1,j+2));
        I32(7,c1)=(J0-I2(i-2,j+1));
        I32(8,c1)=(J0-I2(i-2,j-1));
        
              c1=c1+1;
            end 
end

            for i=1:41209
                for j=1:7
                    if(I3(j,i)<=I3(j+1,i))
                        I4(j,i)=1;
                    else
                        I4(j,i)=0;
                    end
                    
                end
                
            end
            for i=1:41209
                BPIE1(1,i)=I3(1,i)*1+I3(2,i)*2+I3(3,i)*4+I3(4,i)*8+I3(5,i)*16+I3(6,i)*32+I3(7,i)*64;
            end           
            BP1=reshape(BPIE1,[203,203]);
            figure(2)
            subplot(3,2,1)
            imshow(BP1')
             title("Inner Edge IE1");
             for i=1:41209
                for j=1:7
                    if(I31(j,i)<=I31(j+1,i))
                        I41(j,i)=1;
                    else
                        I41(j,i)=0;
                    end
                    
                end
                
             end
             for i=1:41209
                BPOE1(1,i)=I31(1,i)*1+I31(2,i)*2+I31(3,i)*4+I31(4,i)*8+I31(5,i)*16+I31(6,i)*32+I31(7,i)*64;
            end
             BP2=reshape(BPOE1,[203,203]);
             figure(2)
             subplot(3,2,2)
             imshow(BP2')
             title("Outer Edge OE1");
               
      for i=1:41209
          c1=8;
          for j=2:8
            I3(j,i)=I3(c1,i);
            c1=c1-1;
          end 
      end
      for i=1:41209
                BPIE2(1,i)=I3(1,i)*1+I3(2,i)*2+I3(3,i)*3+I3(4,i)*4+I3(5,i)*5+I3(6,i)*6+I3(7,i)*7;
            end
             BP3=reshape(BPIE2,[203,203]);
             figure(2)
             subplot(3,2,3)
             imshow(BP3')
             title("Inner Edge IE2");
       for i=1:41209
          c1=8;
          for j=2:8
            I31(j,i)=I31(c1,i);
            c1=c1-1;
          end 
      end
       for i=1:41209
                BPOE2(1,i)=I31(1,i)*1+I31(2,i)*2+I31(3,i)*3+I31(4,i)*4+I31(5,i)*5+I31(6,i)*6+I31(7,i)*7;
            end
             BP4=reshape(BPOE2,[203,203]);
             figure(2)
             subplot(3,2,4)
             imshow(BP4')  
             title("Outer Edge OE2");
             
       for i=1:41209
                BPOE3(1,i)=I32(1,i)*1+I32(2,i)*2+I32(3,i)*4+I32(4,i)*8+I32(5,i)*16+I32(6,i)*32+I32(7,i)*64;
            end
             BP5=reshape(BPOE3,[203,203]);
             figure(2)
             subplot(3,2,5)
             imshow(BP5')  
             title("Outer Edge OE3");
        for i=1:41209
                BPOE4(1,i)=I32(1,i)*1+I32(2,i)*2+I32(3,i)*3+I32(4,i)*4+I32(5,i)*5+I32(6,i)*6+I32(7,i)*7;
            end
             BP6=reshape(BPOE4,[203,203]);
             figure(2)
             subplot(3,2,6)
             imshow(BP6')  
             title("Outer Edge OE4");
%  h1=hist(BPIE1,128);
%  h2=hist(BPOE1,128);
%  h3=hist(BPIE2,128);
%  h4=hist(BPOE2,128);
%  fist1=[h1(:);h2(:);h3(:);h4(:)];
%  fhist(:,clk)=fist1;
%  clk=clk+1;
end 
%              
%              