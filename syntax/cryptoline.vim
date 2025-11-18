if exists("b:current_syntax")
  finish
endif

" =============================
" Comments
" =============================
syntax match cryptolineCommentSlash "//.*$"
syntax match cryptolineCommentHash "#.*$"
syntax region cryptolineCommentCStyle start="/\*" end="\*/"
syntax region cryptolineCommentMLStyle start="(\*" end="\*)"
highlight def link cryptolineCommentSlash cryptolineComment
highlight def link cryptolineCommentHash cryptolineComment
highlight def link cryptolineCommentCStyle cryptolineComment
highlight def link cryptolineCommentMLStyle cryptolineComment

" =============================
" Numbers
" =============================
syntax match cryptolineNumberDecimal "\<[0-9]\+\>"
syntax match cryptolineNumberHex "\<0x[0-9a-fA-F]\+\>"
highlight def link cryptolineNumberDecimal cryptolineNumber
highlight def link cryptolineNumberHex cryptolineNumber

" =============================
" Constants / Variables
" =============================
syntax keyword cryptolineConstKeyword const
syntax match cryptolineVariable "\<[a-zA-Z_][a-zA-Z0-9_]*\>"
highlight def link cryptolineConstKeyword cryptolineKeyword

" =============================
" Proc declarations
" =============================
syntax keyword cryptolineProcKeyword proc
syntax region cryptolineProcDecl start="proc" end=")" contains=cryptolineVariable,cryptolineNumber,cryptolineCommentSlash
highlight def link cryptolineProcKeyword cryptolineKeyword

" =============================
" Operators
" =============================
syntax match cryptolineOperatorArithmetic "[+\-*]\|\*\*"
syntax match cryptolineOperatorCompare "=\|[<>]=\?[su]\?"
syntax match cryptolineOperatorLogic "!\|~\|\<neg\>"
highlight def link cryptolineOperatorArithmetic cryptolineOperator
highlight def link cryptolineOperatorCompare cryptolineOperator
highlight def link cryptolineOperatorLogic cryptolineOperator

" =============================
" Specification & Keywords
" =============================
syntax keyword cryptolineKeyword true false prove with all cuts assumes ghosts precondition
syntax keyword cryptolineKeyword add mul sq and or eq eqmod eqsrem const sext uext slimbs ulimbs
syntax match cryptolineOperatorOther "&&\|/\\\|\\/"
highlight def link cryptolineOperatorOther cryptolineOperator

" =============================
" Instructions
" =============================
syntax keyword cryptolineInstr assert assume cut ecut rcut ghost
syntax keyword cryptolineInstr call cast vpc join
syntax keyword cryptolineInstr mov cmov shl lsl shls shr sars set clear nop
syntax keyword cryptolineInstr add adc sub sbc sbb mul split spl
syntax keyword cryptolineInstr seteq setne and or not

" =============================
" Deref and Type
" =============================
syntax match cryptolineDeref "\$[0-9a-zA-Z_]*"
syntax match cryptolineType "@[su]\?int[0-9]\+\|@bit"

" =============================
" Groupings / braces
" =============================
syntax region cryptolineSpecBlock start="{" end="}" contains=ALLBUT,cryptolineCommentSlash

" =============================
" Final highlight links
" =============================
highlight def link cryptolineComment Comment
highlight def link cryptolineNumber Number
highlight def link cryptolineKeyword Keyword
highlight def link cryptolineInstr Statement
highlight def link cryptolineOperator Operator
highlight def link cryptolineKeyword Keyword
highlight def link cryptolineDeref Identifier
highlight def link cryptolineType Type
highlight def link cryptolineSpecBlock Structure
