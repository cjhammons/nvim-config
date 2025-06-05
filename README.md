# Neovim Configuration

A Neovim configuration with Go and Python autocomplete support, syntax highlighting, and useful plugins.

## Prerequisites

- Neovim (>= 0.8.0)
- Node.js and npm (for some language servers)
- Go (for Go development)
- Python (for Python development)

## Setup Instructions

### 1. Install Language Servers

#### Go Language Server (gopls)
```bash
go install golang.org/x/tools/gopls@latest
```

#### Python Language Server (pyright)
```bash
npm install -g pyright
```

### 2. Install Neovim Plugins

Open Neovim and run:
```vim
:PlugInstall
```

### 3. Restart Neovim

After installation, restart Neovim for all changes to take effect.

## Features

### Autocomplete
- **Go**: Full autocomplete with `gopls` including function signatures, imports, and documentation
- **Python**: Intelligent autocomplete with `pyright` including type hints and library suggestions
- **Buffer**: Autocomplete from open buffers
- **Path**: File path autocomplete

### Key Mappings

#### Autocomplete
- `Tab` - Navigate to next completion item
- `Shift+Tab` - Navigate to previous completion item
- `Enter` - Confirm selection
- `Ctrl+Space` - Manually trigger completion
- `Ctrl+e` - Abort completion

#### File Navigation
- `Ctrl+n` - Open NERDTree
- `Ctrl+t` - Toggle NERDTree
- `Ctrl+f` - Focus NERDTree
- `F8` - Toggle Tagbar

#### Terminal
- `F12` - Toggle integrated terminal

### Installed Plugins

- **vim-plug** - Plugin manager
- **nvim-lspconfig** - LSP configuration
- **nvim-cmp** - Autocompletion engine
- **nvim-treesitter** - Syntax highlighting
- **go.nvim** - Go development tools
- **NERDTree** - File explorer
- **vim-airline** - Status bar
- **tokyonight.nvim** - Color scheme
- **lazygit.nvim** - Git integration
- **toggleterm.nvim** - Terminal integration

## Language Server Features

### Go (gopls)
- Code completion
- Go to definition
- Find references
- Code formatting with gofumpt
- Static analysis
- Unused parameter detection

### Python (pyright)
- Type checking
- Code completion
- Import suggestions
- Workspace-wide analysis
- Library code type information

## Troubleshooting

### Language Servers Not Working
1. Verify language servers are installed:
   ```bash
   gopls version
   pyright --version
   ```

2. Check LSP status in Neovim:
   ```vim
   :LspInfo
   ```

### Plugin Issues
1. Update plugins:
   ```vim
   :PlugUpdate
   ```

2. Clean and reinstall:
   ```vim
   :PlugClean
   :PlugInstall
   ```

## Configuration Location

This configuration is located at `~/.config/nvim/init.vim`