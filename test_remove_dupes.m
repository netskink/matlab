% test_remove_dupes.m

A=[1,2,2;
   2,2,1;
   1,2,3;
   1,2,4;
   3,2,7];
B=remove_dupes(A,[2,1],'avg');
expected =[1,2,2.5;
           3,2,7];
if B ~= expected
    error('Test 1 failed.');
else
    disp('Test 1 passed.');
end


A=[2,2,2;
   2,2,1;
   1,2,3;
   1,2,4;
   3,2,7];
B=remove_dupes(A,[2,1],'avg');
expected =[1.8,2,3.4];
if B ~= expected
    error('Test 2 failed.');
else
    disp('Test 2 passed.');
end

A=[1,3,2;
   2,1,1;
   1,2,3;
   1,4,4;
   3,5,7];
B=remove_dupes(A,[1,2],'avg');
expected =[1,4.5,3;
           2,1,3;
           3,5,7];
if B ~= expected
    error('Test 3 failed.');
else
    disp('Test 3 passed.');
end


A=[1,3,2;
   2,1,1;
   1,2,3;
   1,4,4;
   3,5,7];
B=remove_dupes(A,[2,2],'avg');
expected =[1,4.5,3;
           2,1,3;
           3,5,7];
if B ~= expected
    error('Test 4 failed.');
else
    disp('Test 4 passed.');
end

A=[2,2,2;
   2,1,1;
   1,2,3;
   1,4,4;
   3,5,7];
B=remove_dupes(A,[2,2],'avg');
expected =[5/2, 5/2, 3;
           1,   4,   4;
           3,   5,   7];
if B ~= expected
    error('Test 5 failed.');
else
    disp('Test 5 passed.');
end

A=[2,2,2;
   2,1,1;
   1,2,3;
   4,1,4;
   3,5,7];
B=remove_dupes(A,[2,2],'avg');
expected =[5/2, 5/2, 3;
           1,   4,   4;
           3,   5,   7];
if B ~= expected
    error('Test 6 failed.');
else
    disp('Test 6 passed.');
end

A=[2,2,2;
   2,1,1;
   1,2,3;
   1,4,4;
   3,5,7];
B=remove_dupes(A,[2,3],'avg');
expected =[6/4, 9/4, 5;
           3,   5,   7];
if B ~= expected
    error('Test 7 failed.');
else
    disp('Test 7 passed.');
end

A=[2,2,2;
   2,1,1;
   1,2,3;
   1,4,4;
   3,5,7];
B=remove_dupes(A,[3,3],'avg');
expected =[6/4, 9/4, 5;
           3,   5,   7];
if B ~= expected
    error('Test 8 failed.');
else
    disp('Test 8 passed.');
end

A=[2,2,2;
   2,1,1;
   4,3,3;
   1,4,4;
   3,5,7];
B=remove_dupes(A,[2,2],'min');
expected =[2,  1,    1;
           4,  2,    3;
           1,  4,    4;
           3,   5,   7];
if B ~= expected
    error('Test 9 failed.');
else
    disp('Test 9 passed.');
end


A=[2,2,2;
   2,1,1;
   4,3,3;
   1,4,4;
   3,5,7];
B=remove_dupes(A,[3,3],'min');
expected =[2,  1,    1;
           3,   5,   7];
if B ~= expected
    error('Test 10 failed.');
else
    disp('Test 10 passed.');
end
