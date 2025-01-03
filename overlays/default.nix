_:

{
  #nixpkgs.overlays = [
  # (self: super: {
  #   dmraid = super.dmraid.overrideAttrs (oA: {
  #     patches = (oA.patches or [ ]) ++ [
  #       (super.fetchpatch {
  #         url = "https://raw.githubusercontent.com/NixOS/nixpkgs/f298cd74e67a841289fd0f10ef4ee85cfbbc4133/pkgs/os-specific/linux/dmraid/fix-dmevent_tool.patch";
  #         sha256 = "MmAzpdM3UNRdOk66CnBxVGgbJTzJK43E8EVBfuCFppc=";
  #       })
  #     ];
  #   });
  # })
  #
  #] 
}
