Run :checkhealth to see how your nvim is doing.

`:bd!` will delete the current file buffer (close the file without saving).

`_` goes to the beginning of the text on a line.
`$` goes to the end of the text on a line.
`0` goes to the zeroeth column of a line (i.e. the very beginning).

`f<character>` goes forward and put the cursor on that character.
`t<character>` goes forward and puts the curspor before that character.
Using capitals `F<chacacter>` and `T<character>` will do the same thing going backwards.
Pressing `;` will walk in the same direction through further matches and `,` will walk in the opposite direction.

`o` will make a newline below your cursor and go into insert mode.
`O` will make a newline above your cursor and go into insert mode.

`ctrl + u` and `ctrl + d` move resp. up and down a half page.

`gg` goes to the top of the file.
`G` goes to the bottom of the file.

Press `/` to search forward for a word. Once you are on it, press `Enter` and then press `n` to go to the next match and `N` to go to the previous.
Press `?` to search backward for a word. Once you are on it, press `Enter` and then press `n` to go to the next match and `N` to go to the previous.
If your cursor is on a word, then press `*` to load it as a search term. 

The difference between `c` and `d`, as far as I know, is that `c` will put you in `INSERT` mode.

TODO: 
1. How to make nvim always add spaces when I press tab.
2. How to move cursor to end of word.
3. Blinking cursor on insert mode

`ctrl + w + v` will open a new vim window. You can move between windows with `ctrl + v + <key>` where `<key>` signifies the direction (can use arrow keys or `hjkl` or maybe even other stuff).

`:on` will make the current window the only one on the screen. All other windows are closed.

