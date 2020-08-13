let
  fetcher = { owner, repo, rev, sha256 }: builtins.fetchTarball {
    inherit sha256;
    url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
  };
in fetcher {
  owner  = "NixOS";
  repo   = "nixpkgs";
  rev    = "f4f39fc8248ea89f50c08259154f48a7ceda9216";  # Nixpkgs unstable 02/06/20
  sha256 = "092lzfnixf8dv9gx1sc5fgm8hw3v5gcqncrwkyadd5p4n3rqdja0";
}
