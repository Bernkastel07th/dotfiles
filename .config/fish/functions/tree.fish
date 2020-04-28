# Defined in - @ line 1
function tree --wraps=tree\ -a\ -I\ \"\\.DS_Store\|\\.git\|node_modules\|vendor\\/bundle\"\ -N --description alias\ tree=tree\ -a\ -I\ \"\\.DS_Store\|\\.git\|node_modules\|vendor\\/bundle\"\ -N
 command tree -a -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N $argv;
end
