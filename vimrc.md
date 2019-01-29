# Notes
macos: rename to `.vimrc`

# Setup
1. [Vim Plugin Manager](https://github.com/VundleVim/Vundle.vim)
    ```bash
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```
2. Copy [vimrc sample config](dotfiles/vimrc.md) đến file `vimrc`:
    - **alpine**: `etc/vim/vimrc`
    - **ubuntu**: chú ý: có thể xoá hết nhưng k dc xoá dòng `runtime! debian.vim` và phải để dòng này trên cùng, gán sample config sau dòng này
3. run `vim +PluginInstall +qall`