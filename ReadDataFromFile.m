function [X] = ReadDataFromFile(filename)

fileID = fopen(filename, 'r');

if (fileID <= 2)
   fprintf('File not found %s\n', filename); 
else
   fseek(fileID, 6, 'bof');
 
   formatSpec = '%f';
   X = fscanf(fileID, formatSpec);
   fclose(fileID);   
end

end

