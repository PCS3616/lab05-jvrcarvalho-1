; -------------------------------------------------------------------
; Laboratório 5 - Quadrados Perfeitos
; -------------------------------------------------------------------
; João Victor Araujo e Rocha de Carvalho
; 10773102
; -------------------------------------------------------------------
; Programa que calcula e tabela, a partir da posição de memória 0x100,
; os quadrados perfeitos dos 64 primeiros números naturais ;(0x0, 0x1, 
; 0x2, ..., 0x3F).
; -------------------------------------------------------------------



@ /0000 ; Prepara programa
        JP MAIN
        
MAIN    LV /0000
        MM RES_I
        MM SUM
        LD RES_P
        MM BASE_W_VEC
        JP LOOP         ; Pula para o Loop principal (001C)


; Variáveis
RES_P   K /0102         ; Ponteiro para vetor de Resultados
RES_I   K /0000         ; Indice do vetor de Resultados
ARG     K /0000
DOIS    K /0002         ; Constante 2
UM      K /0001         ; Constante 1
SUM     k /0000
LIM     K =63           ; Limite de Quadrados a serem calculados (002E)
        
; Loop principal do programa
LOOP    LD LIM          ; Verifica se chegou no Limite
        SB RES_I
        JN FIM

        LD RES_I        ; calcula número
        MM I_W_VEC
        SC SUB_ODD
        AD SUM
        MM SUM

        SC SUB_W_VEC    ; Escreve número

        LD RES_I        ; Atualiza índice
        AD UM
        MM RES_I

        JP LOOP         ; Volta pro loop


; Finalização do programa
FIM     HM =314         ; FIM


; Subrotina - Incrementa Vetor com AC e retorna novo tamanho
SUB_W_VEC       K /0000

                MM TEMP_W_VEC           ; Guarda AC

                LD BASE_W_VEC           ; Prepara Escrita
                AD I_W_VEC
                AD I_W_VEC
                MM ARG
                LD TEMP_W_VEC

                SC SUB_W                ; Executa Escrita
   
                RS SUB_W_VEC            ; Retorna

TEMP_W_VEC      K /0000
BASE_W_VEC      K /0000
I_W_VEC         K /0000



; Subrotina - Escreve AC em ARG
SUB_W           K /0000
                
                MM TEMP_W       ; Guarda AC temporáriamente

                LD ARG          ; Prepara Escrita
                AD OP_W
                MM W_EXEC
                LD TEMP_W

W_EXEC          K /0000         ; Executa Escrita

                RS SUB_W        ; Retorna da subrotina

OP_W            K /9000         ; Operando de escrita
TEMP_W          K /0000         ; Espaço temporário para AC




; Subrotina - Lê do endereço ARG para AC
SUB_R           K /0000

                LD ARG          ; Prepara Leitura
                AD OP_R
                MM R_EXEC

R_EXEC          K /0000         ; Executa Leitura

                RS SUB_R        ; Retorna da subrotina

OP_R            K /8000


; Subrotina - Coloca em AC ímpar equivalente
SUB_ODD         K /0000
                ML DOIS
                AD UM
                RS SUB_ODD
                
; Subrotina - AC ao quadrado para AC
SUB_SQ          K /0000
                MM TEMP_SQ
                ML TEMP_SQ
                RS SUB_SQ
TEMP_SQ         K /0000
