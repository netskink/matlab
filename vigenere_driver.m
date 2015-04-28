% vigenere_driver.m

%ciphertext = 'LXFOPVEFRNHR';
plaintext = 'ATTACKATDAWN';
key= 'LEMON';
ciphertext = myvigenere(plaintext, key,'enc');
disp(['ciphertext = ',ciphertext]);
plaintext = myvigenere(ciphertext, key,'dec');
disp(['plaintext = ',plaintext]);
