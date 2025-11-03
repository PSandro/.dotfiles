# .dotfiles
This is where my dotfiles are stored.

## setup

```bash
# Install bombadil
pacman -S toml-bombadil

# Clone and install dotfiles
cd && git clone git@github.com:PSandro/.dotfiles.git && bombadil install .dotfiles

# Initialize git submodules (for nvim plugins)
cd ~/.dotfiles && git submodule update --init --recursive

# Link configuration
bombadil link -p [sway|i3]
```

## nvim

Modern config using native LSP (`vim.lsp.config`), built-in completion, and netrw. Only 1 plugin (tokyonight theme via git submodule).

### LSP servers

**Arch Linux:**
```bash
pacman -S clang python-lsp-server texlab gopls rust-analyzer bash-language-server
yay -S jdtls
```

**Debian 13:**
```bash
apt install clangd python3-pylsp texlab gopls rust-analyzer npm
npm install -g bash-language-server
```

### Keybindings

- `\e` - File explorer (netrw)
- `Ctrl+Space` - LSP completion (manual trigger)
- `Ctrl+N/P` - Navigate menu, `Ctrl+Y` - Accept
- `gd` - Definition, `K` - Hover, `gr` - References
- `Space+rn` - Rename, `Space+ca` - Code action, `Space+f` - Format
- `[d` / `]d` - Diagnostics
