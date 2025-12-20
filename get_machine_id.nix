{}:
let 
  machineId = builtins.readFile "/etc/machine-id";
in
builtins.replaceStrings ["\n"] [""] machineId

