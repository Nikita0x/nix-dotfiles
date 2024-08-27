alias rebuild='sudo nixos-rebuild switch'
alias config='sudoedit nvim /etc/nixos/configuration.nix'
alias open='xdg-open'
alias dotfiles="cd ~/github/dotfiles && code ."
alias update-dotfiles='cp -u /etc/nixos/* ~/github/dotfiles/'
alias 180score_web="cd ~/work/score_web && code . && npm run dev "
alias 180score="cd ~/work/score_mob && code . && npm run dev"