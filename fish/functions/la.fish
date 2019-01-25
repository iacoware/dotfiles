# Defined in /usr/local/Cellar/fish/2.7.1/share/fish/functions/la.fish @ line 4
function la --description 'List contents of directory, including hidden files in directory using long format'
  ls -lah --group-directories-first $argv
end