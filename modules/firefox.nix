{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.zemy = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "https://google.com/";
        "browser.startup.page" = 3; # 0 = about:blank, 1 = home page, 2 = last visited page, 3 = resume previous session
      };
    };
  };
}
