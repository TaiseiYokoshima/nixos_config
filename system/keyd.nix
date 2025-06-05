{ config, pkgs, ... }:
{

  systemd.services.keyd = {
    description = "keyd keyboard remapping daemon";
    wantedBy = [ "multi-user.target"];

    serviceConfig = {
        ExecStart = "${pkgs.keyd}/bin/keyd";
        Restart = "on-failure";
    };
  };


  environment.etc."keyd/default.conf".source = ./default.conf;

}
