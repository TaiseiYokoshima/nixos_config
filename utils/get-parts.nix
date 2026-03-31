{}: let
  getDir = path: builtins.readDir path;

  getList = path: let
    dir = getDir path;
  in
    map
    (name: {
      inherit name;
      type = dir.${name};
    })
    (builtins.attrNames dir);

  filterNonNix = list:
    builtins.filter
    (
      {type, ...}:
        (type == "regular")
        && (builtins.match ".*\\.nix" != null)
    )
    list;

  func = path: let
    mapToNestedList = (
      list:
        map (
          {
            type,
            name,
          }:
            if type == "regular"
            then [(path + "/${name}")]
            else func (path + name)
        )
        list
    );

    list = getList path;
    filtered = filterNonNix list;
    mappedNested = mapToNestedList filtered;
  in
    builtins.concatLists mappedNested;

  collect = pathList:
    builtins.concatLists (
      map
      (path: func path)
      pathList
    );
in
  collect
