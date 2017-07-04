" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.ebnf		setfiletype ebnf
    au! BufRead,BufNewFile *.abnf		setfiletype ebnf
augroup END
