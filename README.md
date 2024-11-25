NixOS quirks:

1. During installation, select GNOME! <---- IMPROTANT
2. Before rebuilding, do `nix-shell -p git`;
3. Add email - user.email = "<YOUR-EMAIL>"

You also need to generate new SSH key for Github (after fresh install)

1. `ssh-keygen -t ed25519 -C "email@gmail.com"` //generate new key
2. Enter
3. Enter
4. Enter
5. `cd ~/.ssh && cat id_ed25519.pub | xclip -selection clipboard` //enter directory and copy the insides of the key

6) Github -> Profile -> Settings -> SSH and GPG keys -> New SSH key

#Neovim config
drop files into `/home/nikita/.config/nvim`
