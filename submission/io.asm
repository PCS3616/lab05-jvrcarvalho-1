;-----------------------------------------------------------
; Laboratório 5 - IO
;-----------------------------------------------------------
; Nome: João Victor Carvalho
; NUSP: 10773102
;-----------------------------------------------------------
; Subrotina que lê dois números do teclado e imprime o sua soma
;-----------------------------------------------------------

@ /0
JP MAIN

DEBUG_OP        K /0000

Y               K /0000
X               K /0000
RAW_SUM         K /0000

D16A2           K /0100
D16A3           K /1000
MASK            K /FFF0
DEZ             K /000A
ASCII_CHAR      K /3030

DIGITO          K /0000


MAIN            GD /0000
                SC SUB_DEBUG
                SB ASCII_CHAR
                SC SUB_DEBUG
                MM X
                GD /0000
                SC SUB_DEBUG
                GD /0000
                ; PD /0100
                SB ASCII_CHAR
                MM Y
                SC SUB_DEBUG

                LD X

                AD Y
                MM RAW_SUM
                
                ML D16A3
                DV D16A3
                SB MASK
                
                SB DEZ 
                JZ NORMAL
                JN NORMAL

                LD RAW_SUM
                SB DEZ
                AD D16A2
                MM RAW_SUM

NORMAL          LD RAW_SUM
                AD ASCII_CHAR
                PD /100
                HM /644




; Subrotina que mostra AC na tela caso a DEBUG_OP seja diferente de 0
SUB_DEBUG       K /0000
                MM DEBUG_TEMP
                LD DEBUG_OP
                JZ VOLTA
                LD DEBUG_TEMP
                PD /0100
                JP VOLTA

VOLTA           LD DEBUG_TEMP
                RS SUB_DEBUG
DEBUG_TEMP      K /0000


                

