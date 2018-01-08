{ config, pkgs, ... }:

{
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
  system.keyboard.remapCapsLockToEscape = true;

  test = ''
    echo checking keyboard mappings in /activate >&2
    grep "hidutil property --set '{\"UserKeyMapping\":.*}'" ${config.out}/activate
    grep "\"HIDKeyboardModifierMappingSrc\":30064771129" ${config.out}/activate
    grep "\"HIDKeyboardModifierMappingDst\":30064771296" ${config.out}/activate
    grep "\"HIDKeyboardModifierMappingDst\":30064771113" ${config.out}/activate
  '';
}

