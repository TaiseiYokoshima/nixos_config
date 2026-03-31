{}: {
   imports = 
      let
         dir = ./.;
         contents = builtins.readDir dir;
         path = 
            builtins.filter 
               (name: name != "default.nix")
               (builtins.attrNames contents);

      in
      map (name: "/${name}") path;
}
