# Introduction
Text indentation functions for the editor VIM.
You may want to use shortcuts like `Tab` or `Shift+Tab` to indent/unindent
your current lines while in normal or visual mode.

# Installation
## Linux/MacOS
```
git clone https://github.com/hweickert/indentify.git ~/.vim/pack/external/opt/indentify
```

In your `~/.vimrc` add the following

```
packadd indentify

noremap <tab> :call IndentNormal()<cr>
noremap <s-tab> :call UnindentNormal()<cr>
vnoremap <tab> :<bs><bs><bs><bs><bs>call IndentVisual()<cr>
vnoremap <s-tab> :<bs><bs><bs><bs><bs>call UnindentVisual()<cr>
```

## Windows
```
git clone https://github.com/hweickert/indentify.git ~/vimfiles/pack/external/opt/indentify
```

In your `$USERPROFILE/_vimrc` add the following

```
packadd indentify

noremap <tab> :call IndentNormal()<cr>
noremap <s-tab> :call UnindentNormal()<cr>
vnoremap <tab> :<bs><bs><bs><bs><bs>call IndentVisual()<cr>
vnoremap <s-tab> :<bs><bs><bs><bs><bs>call UnindentVisual()<cr>
```
