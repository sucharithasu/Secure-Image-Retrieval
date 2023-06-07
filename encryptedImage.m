function EncI=encryptedImage(key,I)
EncI = bitxor(image, key);
end