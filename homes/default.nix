_: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      "ath" = import ./ath;
    };
  };
}