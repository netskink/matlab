% This was someones homework problem on reddit.

function result_text = myvigenere(in_text, key, mode)

    key = int8(key) - int8('A') + 1;
    in_text = int8(in_text) - int8('A') + 1;

    key_to_size=repmat(key,1,ceil(length(in_text)/length(key)));
    key_to_size=key_to_size(1:length(in_text));
    if strcmp('enc',mode)
        result_text = mod(in_text+key_to_size,26)-1;
    else
        result_text = mod(in_text-key_to_size,26)+1;
    end
    result_text = result_text+int8('A')-1;
    result_text = char(result_text);
    

end
