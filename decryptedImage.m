function DecI=decryptedImage(encrypted_image,key)
DecI = bitxor(encrypted_image,key);
end