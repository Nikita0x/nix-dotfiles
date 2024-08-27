alias rebuild='sudo nixos-rebuild switch'
alias config='sudoedit nvim /etc/nixos/configuration.nix'
alias open='xdg-open'
alias dotfiles="cd ~/github/dotfiles && code ."
alias update-dotfiles='cp -u /etc/nixos/* ~/github/dotfiles/'
alias 180score_web="cd ~/work/score_web && code . && npm run dev "
alias 180score="cd ~/work/score_mob && code . && npm run dev"

export CAPACITOR_ANDROID_STUDIO_PATH="/nix/store/rgqq4nnp8mi8ax07rqa3i6mnm28vwipb-android-studio-stable-2023.3.1.19-unwrapped/bin/studio.sh"