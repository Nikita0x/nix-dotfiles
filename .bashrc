# Aliases
alias rebuild='sudo nixos-rebuild switch'
alias config='sudo hx /etc/nixos/configuration.nix'
alias config-update='sudo cp -ur /etc/nixos/* ~/github/nix-dotfiles/'
alias open='xdg-open'
alias nvim-update='cp -ur ~/.config/nvim/* ~/github/nix-dotfiles/nvim/'
alias 180score_web='cd ~/work/score_web && nvim . && npm run dev'
alias 180score='cd ~/work/score_mob && nvim . && npm run dev'
alias config-nvim='cd ~/.config/nvim && nvim ~/.config/nvim'
alias dotfiles='nvim ~/github/nix-dotfiles/'
alias work='code ~/work/score_mob'
alias c='cd'
alias lg='lazygit'
alias config-hyperland='nvim ~/.config/hypr/hyprland.conf'
alias memes='cd ~/github/unhinged_memes && node index.js'
alias sublime-merge='/nix/store/lwyag77m1pvy0a8wg272f5kskrjwbwcx-sublime-merge-2095/bin/sublime_merge'
alias clipboard='xclip -selection clipboard'

# Environment Variables
export TERM="alacritty"
export CAPACITOR_ANDROID_STUDIO_PATH="/nix/store/nbicf5qzrfgj8wl16rf2bmwn12wah6n4-android-studio-stable-2024.2.1.9/bin/android-studio"
export PATH=$PATH:/nix/store/admr669giq6ffk2yygm7ijq7vyikvyx9-vue-language-server-2.0.29/bin
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export HELIX_RUNTIME="/home/nikita/.config/helix/runtime"
export CHROME_EXECUTABLE="/nix/store/rdr1lhbisclbmadkg9b8frmyzs82q0lj-google-chrome-130.0.6723.58/bin/google-chrome-stable"

# old
# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
#
#new

export CXX=$(which g++)
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
