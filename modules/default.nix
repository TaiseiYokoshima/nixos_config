{}: {
   imports = 
      let
         dir = ./.;
         contents = builtins.readDir dir;
         paths = 
            builtins.filter 
               (name: name != "default.nix")
               (builtins.attrNames contents);

      in
      map (name: "/${name}") paths;
}
