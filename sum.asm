.org 0024h

	;soma os menos significativos e add em 205CH
	LDA 2050h      ;carrega o número da memória para o acumulador.
	LXI H, 2052h   ;carrega os registradores.
	ADD M          ;soma do ac para B.
	STA 205Bh      ;Armazena o conteúdo do ac em 205Ch.
	MVI D,00H      ;Zera o registrador D
	JC L2          ;Pula para L2 se tiver carry

L1:
	;soma os mais significativos e add em 205BH
	LDA 2051h      ;carrega o número da memória para o acumulador
	ADD D
	LXI H, 2053h   ;carrega os registradores.
	ADD M          ;soma do ac para B.
	STA 205Ch      ;Armazena o conteúdo do ac em 205Bh.
	JMP L3         ;pule para L3

L2:   INR D          ;incrementa 1 em D
      JMP L1         ;pule para L1

L3:
	LXI H, 2053h   ;carrega os registradores;
	INR D          ;incrementador
	MOV M, D       ;transferência do conteúdo.
	HLT
