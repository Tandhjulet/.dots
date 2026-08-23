{ username, ... }:

{
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "wireshark" "lp" "storage" "audio" "video" "networkmanager" "wheel" ];
  };
}
