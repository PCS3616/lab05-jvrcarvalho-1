; -------------------------------------------------------------------
; Laboratório 5 - Fatorial
; -------------------------------------------------------------------
; João Victor Araujo e Rocha de Carvalho
; 10773102
; -------------------------------------------------------------------
; executa o cálculo do fatorial de um número N (maior ou igual a 0), 
; O programa principal armazena o valor de N na posição 0x100 e o 
; resultado do fatorial na posição 0x102 usando uma sub-rotina para 
; o cálculo. 
; -------------------------------------------------------------------



@ /0100 ; Sessão de dados
IN      K /0003         ; Entrada de N
OUT     K /0000         ; Saída de N!

SUB     K /0000         ; Subproduto atual do loop
MUL     K /0000         ; Multiplicando do fatorial e indice do Loop
UM      K /0001         ; Constante de decremento


@ /0000 ; Inicialização do programa
        LD IN           ; Lê entrada N para AC

        SC TZ           ; Pula para o tratamento de zero
        MM MUL          ; Prepara multiplicando

        LV /0001        ; Prepara subproduto
        MM SUB                  
        JP LOOP         ; Pula para o Loop de Fatorial


@ /0200; Loop principal do programa
LOOP    LD MUL          ; Verifica se MUL==1 (se for pula pra finalização)
        SB UM           
        JZ FIM          
        AD UM           

        ML SUB          ; Atualiza Subproduto usando o multiplicando que já estava em AC
        MM SUB

        LD MUL          ; Atualiza Multiplicando decremento em 1
        SB UM           
        MM MUL          

        JP LOOP         ; Volta para o começo do LOOP
         


@ /0300; Finalização do programa
FIM     LD SUB          ; Escreve multiplicando na saída do Programa
        MM OUT          

        HM /0000        ; Para a máquina


@ /0400 ; SR - Trata o caso N=0
TZ      K /0000         ; Ponto de entrada da subrotina
        JZ ZERO         ; Verifica se N em AC é 0 e pula pra correção
        JP PRONTO       ; Se N!=0, matem N em AC e pula pro fim
ZERO    LV /0001        ; Se N=0, escreve 1 em AC e pula pro fim
PRONTO  RS TZ           ; Volta pro programa


