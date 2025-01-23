# vsc-dash

Make developing performant, highly interactive, scalable [Dash](https://dash.plotly.com/) 
applications 10x less painful by adding zero-effort support for inline syntax highlighting of 
`clientside_callback`s!

This project is a fork of [`tree-sitter-vscode`](https://github.com/AlecGhost/tree-sitter-vscode) by @AlecGhost, but it ships
wasm binaries for [`tree-sitter-python`](https://github.com/tree-sitter/tree-sitter-python) and [`tree-sitter-javascript`](https://github.com/tree-sitter/tree-sitter-javascript),
as well as some mildly adjusted highlights and injections. It is based on my [neovim plugin](https://github.com/ctdunc/nvim-dash)
which provides similar functionality.

I also don't really use VS Code. I am packaging this for the benefit of my coworkers who do, and would
welcome contributions/support from anyone who does end up using 

- [Why not just use `assets/**/*.js`?](#why-not-just-use-assetsjs)
- [Installation](#installation)
- [Configuration Gotchas](#configuration-gotchas)
    - [Color Schemes](#color-schemes)
    - [Pylance](#pylance)


## Why not just use `assets/**/*.js`?
I wrote about this in a [blog post](https://www.connorduncan.xyz/blog/dash-clientside-treesitter.html).
TL;DR, having more than tens of callbacks in a second location makes it very annoying 
to be confident that the signature of your javascript function matches your `Input/Output/State`s.

## Installation
I am working on getting this published in the extension marketplace---stay tuned.
Until such a time, you can clone this repository, and run [`$ vsce package`](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)
to create a binary that can be installed via the right-click menu in the file tree.

## Configuration Gotchas
If none of these sound like you, please open an issue with a list of the plugins you 
have installed, as well as any relevant configuration.

- [nothing happened after I installed this plugin!](#color-schemes)
- [the inline highlights disappeared after a few seconds](#pylance)

### Color Schemes
This plugin works by providing a `DocumentSemanticTokensProvider`. In order to use it,
you must be using a color scheme that supports semantic token highlighting by default, or enable it.

You can enable semantic token highlighting by searching for `semantic highlighting` in the preferences
menu, and setting the value of the dropdown to `true`.

### Pylance
This plugin doesn't work with `pylance` right now, and might never.
`pylance` is also a semantic tokens provider, and Microsoft, in their infinite 
wisdom, does not provide an option to [disable semantic highlighting in pylance](https://github.com/microsoft/pylance-release/issues/2495),
or to specify [precedence for conflicting providers in VS Code](https://github.com/microsoft/vscode/issues/145530).
Since `pylance` is a large extension, it usually takes longer to load, it will generally override 
any provisions of this extension.

If you can live without pylance's implementation of semantic token highlighting (if you can't,
why are you here?), I would recommend [`pyright`](https://github.com/microsoft/pyright) the `chromium`
to `pylance`'s `chrome`. It is missing a few other features surrounding module-level renames, but I use it daily
and find it quite feature complete.
Worst case, you can always disable pyright when you're working on clientside callbacks, and enable it at all other times.
