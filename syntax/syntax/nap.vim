" Vim syntax file
" Language: Nap


if exists("b:current_syntax")
  finish
endif

syn keyword NapTypes Tile Cell Bool Int Unit ->
syn keyword NapBools true false
syn keyword NapConditional if then else
syn keyword NapTuples fst snd

syn keyword NapTileFunctions rotate scale hstick vstick Hrepeat Vrepeat Hreflect

syn keyword NapTileCreators import full blank


syn keyword NapAssignement let in


syn match napParens /[()]/
syn match napColon /:/


hi def link NapTypes Type
hi def link NapBools Boolean
hi def link NapConditional Conditional
hi def link NapTuples Function
hi def link NapTileFunctions Function
hi def link NapTileCreators Function

hi def link NapAssignement Statement


hi def link NapParens Delimiter
hi def link NapColon Delimiter


