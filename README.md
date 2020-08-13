# Count duplicated definitions in Nixpkgs

Finds the output of `yarn2nix` and `bundix` in Nixpkgs, counts the
package definitions and identifies duplicates (by using the hashes).
Prints a summary.

# Usage: 

```
$ nix-build
$ result/bin/count-nix-dups.lisp /path/to/nixpkgs
```



