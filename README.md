<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=F74C00&height=180&section=header&text=ConfigVim&fontSize=60&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=Vim%20isolado%20para%20Rust&descAlignY=58&descSize=18" alt="ConfigVim" />

<a href="https://github.com/Proozz321/ConfigVim">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=500&size=20&pause=1200&color=F74C00&center=true&vCenter=true&width=520&lines=Vim+isolado+para+Rust;Dashboard+proprio+em+3+colunas;Colorscheme+para+fundo+transparente;LSP+%2B+Discord+Rich+Presence;Pao+e+Bom" alt="Typing SVG" />
</a>


![Vim](https://img.shields.io/badge/Vim-019733?style=for-the-badge&logo=vim&logoColor=white)
![Rust](https://img.shields.io/badge/Rust-000000?style=for-the-badge&logo=rust&logoColor=white)
![Arch](https://img.shields.io/badge/Arch%20%2F%20CachyOS-1793D1?style=for-the-badge&logo=archlinux&logoColor=white)
![Discord](https://img.shields.io/badge/Discord-RPC-5865F2?style=for-the-badge&logo=discord&logoColor=white)
![Last commit](https://img.shields.io/github/last-commit/Proozz321/ConfigVim?style=for-the-badge&color=F74C00)
![Stars](https://img.shields.io/github/stars/Proozz321/ConfigVim?style=for-the-badge&color=F74C00)

</div>

---

## 🦀 O que é

Um ambiente de Vim feito só para **Rust**, que vive inteiro dentro de `~/.vim-rust`. O `~/.vimrc` e o `~/.vim` normais ficam intactos: a config só é carregada quando o Vim abre com `-u`.

## Recursos

| | |
|---|---|
| **Isolamento total** | `runtimepath`, `packpath`, backup, swap, undo e viminfo separados |
| **Dashboard próprio** | Três colunas (Projects, Keybinds, Recent) com título ASCII |
| **Colorscheme `proozz`** | Feito para fundo transparente, com cor própria por categoria de sintaxe |
| **Rust de verdade** | rust-analyzer via vim-lsp, rustfmt, autocomplete e snippets |
| **Navegação** | NERDTree, fzf, ripgrep e terminal flutuante |
| **Git** | vim-fugitive |
| **Discord Rich Presence** | Mostra o que você está editando, via vimsence |
| **Autoinstalável** | O vim-plug se baixa sozinho na primeira abertura |

## Requisitos

| Item | Para quê |
|---|---|
| Vim com `+python3` | Rich Presence (vimsence) |
| `git` e `curl` | Instalar o vim-plug e os plugins |
| Nerd Font no terminal | Ícones do NERDTree e do airline |
| `ripgrep` | Busca de texto (`:Rg`) |
| `rust-analyzer` e `rustfmt` | LSP e formatação |
| Terminal com truecolor | `termguicolors` e transparência |

```bash
vim --version | grep -o '[+-]python3[^ ]*'
```

No Arch/CachyOS:

```bash
sudo pacman -S vim ripgrep rust-analyzer git curl
rustup component add rustfmt
```

## Instalação

```bash
git clone https://github.com/Proozz321/ConfigVim.git ~/.vim-rust
mkdir -p ~/.vim-rust/{backup,swap,undo,session}
vim -u ~/.vim-rust/vimrc
```

Na primeira abertura o vim-plug é baixado e roda o `PlugInstall`. Se faltar algum plugin, roda `:PlugInstall` dentro do Vim.

<details>
<summary><b> Atalho no terminal (Fish, Bash e Zsh)</b></summary>

<br>

Fish:

```fish
function rvim
    vim -u ~/.vim-rust/vimrc $argv
end
funcsave rvim
```

Bash e Zsh:

```bash
alias rvim='vim -u ~/.vim-rust/vimrc'
```

</details>

## Estrutura

```
~/.vim-rust/
├── vimrc               configuração principal
├── colors/proozz.vim   colorscheme
├── projects.txt        projetos mostrados no dashboard
├── README.md
└── .gitignore
```

`plugged/`, `autoload/`, `backup/`, `swap/`, `undo/`, `session/` e o `viminfo` são gerados e não entram no repositório.

## Dashboard

Abre sozinho quando o Vim inicia sem arquivo. De qualquer lugar, `<Space>h` volta para ele.

| Coluna | Conteúdo |
|---|---|
| **Projects** | Lê o `projects.txt` (um caminho por linha). Teclas `1` a `8` |
| **Keybinds** | Ações rápidas, na tabela abaixo |
| **Recent** | Arquivos recentes. Teclas `a s d w u i o n` |

| Tecla | Ação |
|---|---|
| `e` | Explorer (NERDTree) |
| `f` | Buscar arquivo |
| `g` | Buscar texto (ripgrep) |
| `r` | Arquivos recentes |
| `p` | Projetos (`~/Projectos`) |
| `c` | Editar o vimrc |
| `l` | Atualizar plugins |
| `q` | Sair |

Exemplo de `projects.txt`:

```
~/Rs/Rust/Epub
~/Projectos/outro-projeto
```

## Atalhos

O `<leader>` é a tecla **Espaço**.

<details open>
<summary><b>Geral</b></summary>

<br>

| Atalho | Ação |
|---|---|
| `<Space>h` | Voltar ao dashboard |
| `<Space>e` | Abrir ou fechar o NERDTree |
| `<Space>E` | NERDTree no arquivo atual |
| `<Space>t` | Terminal flutuante |
| `<Space>gs` | Status do Git |
| `<Space>fm` | Formatar com rustfmt |
| `Ctrl+d` / `Ctrl+u` | Rolagem suave |

</details>

<details>
<summary><b>🦀 LSP (em arquivos Rust)</b></summary>

<br>

| Atalho | Ação |
|---|---|
| `gd` | Ir para a definição |
| `K` | Documentação (hover) |
| `gr` | Referências |
| `<Space>rn` | Renomear símbolo |

</details>

<details>
<summary><b>Autocomplete e snippets</b></summary>

<br>

| Atalho | Ação |
|---|---|
| `Enter` | Confirma a sugestão |
| `Tab` | Expande o snippet |
| `Ctrl+b` / `Ctrl+z` | Próximo e anterior campo do snippet |

</details>

## Colorscheme

O `colors/proozz.vim` guarda a paleta num bloco no topo, entre os marcadores `NOCTALIA-START` e `NOCTALIA-END`. Para mudar as cores, edita só esse bloco. O fundo é sempre transparente, então o wallpaper aparece por trás do terminal.

| Elemento | Cor |
|---|---|
| Keywords | Roxo |
| Funções | Azul |
| Tipos | Amarelo |
| Strings | Verde |
| Números e constantes | Laranja |
| Macros (`println!`) | Ciano, em negrito |
| `self` | Vermelho, em itálico |
| Comentários | Cinza, em itálico |

## Plugins

| Categoria | Plugins |
|---|---|
| Interface | vim-airline, vim-airline-themes, indentLine, comfortable-motion, vim-notification, vim-devicons |
| Navegação | NERDTree, fzf, fzf.vim, vim-which-key |
| Git e sessões | vim-fugitive, vim-obsession |
| Rust e LSP | rust.vim, vim-lsp, asyncomplete, asyncomplete-lsp |
| Edição | vim-autoformat, ultisnips, vim-snippets, vim-floaterm |
| Debug | vimspector |
| Outros | vim-instant-markdown, vimsence (Discord) |

## Discord Rich Presence

Usa o [vimsence](https://github.com/vimsence/vimsence), que precisa de Vim com Python 3. Com o Discord ou Vesktop nativos funciona direto. Se o Discord for Flatpak, adiciona `let g:vimsence_discord_flatpak = 1` no vimrc.

Se o status não aparecer, confere o socket:

```bash
ls $XDG_RUNTIME_DIR/discord-ipc-*
```

Comandos úteis: `:DiscordReconnect` e `:DiscordDisconnect`.

## Solução de problemas

| Problema | Solução |
|---|---|
| `E185: Cannot find color scheme` | Abre o Vim do zero em vez de usar `:source`, e roda `:PlugInstall` |
| `E117: Unknown function: plug#begin` | Abriu com `vim` puro. Usa `vim -u ~/.vim-rust/vimrc` |
| Ícones viram quadrados | Falta uma Nerd Font no terminal |
| `:Rg` não funciona | Instala o `ripgrep` |
| `gd` e `K` não funcionam | Instala o `rust-analyzer` e abre um arquivo `.rs` |
| Rich Presence não aparece | Confere o `+python3` e o socket do Discord |

---

<div align="center">

🦀 *Pão é Bom*

<img src="https://capsule-render.vercel.app/api?type=waving&color=F74C00&height=100&section=footer" alt="" />

</div>
