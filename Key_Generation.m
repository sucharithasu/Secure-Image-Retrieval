function key = generateEncryptionKey(keymatrix,I)
    % Generate a key for encryption
    
    [r,l]=size(I);
    key=zeros(r,l);
    for i=1:r
        for j=1;l
            x=I(i,j);
            for k=1:size(keymatrix,1)
                if (x==keymatrix(k))
                    x_k=keymatrix(k,2)
                end
            end 
            key(i,j)= x_k;
        end
    end
            
    
    disp('Encryption Key:');
    disp(key);
end







