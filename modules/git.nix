{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "David Ruiz";
        email = "ruiz.6789@gmail.com";
      };

      init.defaultBranch = "main";

      alias = {
        l = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        ss = "status --short";
        cc = "shortlog -sn --all";
      };
    };
  };
}
