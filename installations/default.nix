{}: {
   imports = 
      let
         dir = ./.;
         contents = builtins.readDir dir;
         dirs = builtins.filter 
            (name: contents.${name} == "directory")
            (builtins.attrNames contents);
      in
      map (name: "/${name}") dirs;
}
