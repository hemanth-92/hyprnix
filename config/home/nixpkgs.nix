{
  nixpkgs.config = {
    permittedInsecurePackages = [ "jitsi-meet-1.0.8043" ];
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = _: true;
  };
}
