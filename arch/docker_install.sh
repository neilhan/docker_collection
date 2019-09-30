# refresh pacman db
rm -R /etc/pacman.d/gnupg
rm -R /root/.gnupg
dirmngr </dev/null
pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
# update system
pacman -Syu --noconfirm

echo "en_CA.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_CA.UTF-8 > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Canada/Pacific /etc/localtime
# hwclock --systohc --utc

# loadkeys dvorak
# localectl set-keymap --no-convert dvorak
# echo "KEYMAP=dvorak" >> /etc/vconsole.conf

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

pacman -Sy --noconfirm grub efibootmgr os-prober dosfstools mtools reflector
pacman -Sy --noconfirm coreutils tar less findutils diffutils grep sed gawk util-linux procps-ng
pacman -Sy --noconfirm git zsh sudo curl wget tmux unzip base-devel openssh make htop
pacman -Sy --noconfirm adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts
pacman -Sy --noconfirm vim emacs aspell aspell-en ack # silversearch-ag is installed after creating user
pacman -Sy --noconfirm nodejs npm
npm install -g yarn
npm install -g js-beautify
npm install -g eslint eslint-plugin-jest tern jsonlint standard

pacman -Sy --noconfirm firefox

# --------------------------------------------------------
# simulate for mac home directory
ln -s /home /Users

# assuming appuser exists
su appuser <<'EOF'
    cd /home/appuser
    git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm
    # install ag for emacs search
    yay -Syu --noconfirm the_silver_searcher

    # ----------------------------------
    # 32 bit app support
    # ---------------------------------
    yay -Sy --noconfirm lib32-glibc lib32-ncurses lib32-libstdc++5
EOF

# su appuser <<'EOF'
#     cd /home/nhan2
#     # -----------------------------------
#     # python needed for machine learning
#     # -----------------------------------
#     yay -Sy --noconfirm python python-pip python-virtualenv python-opengl tensorflow
# EOF
# # python-dev python-tk
# pip3 install --upgrade pip
# pip3 install pudb numpy matplotlib
# pip3 install gym
# pip3 install gym[atari]

# # -----------------------------------
# # Lumo for clojurescript
# # -----------------------------------
# npm install -g lumo-cljs --unsafe-perm
# # clojurescript source mapping support
# npm install -g source-map-support

# -------------------------------------------------------
# VS code install
# -------------------------------------------------------
pacman -Sy --noconfirm code
