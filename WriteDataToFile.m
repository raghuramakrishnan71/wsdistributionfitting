function WriteDataToFile(filename, L, mode)

fileID = fopen(filename, mode);

if (fileID <= 2)
   fprintf('File not found %s\n', filename); 
else
    fprintf(fileID, '%s', L);
    fclose(fileID);
end

end