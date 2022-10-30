.org 0024h

	;soma os mais significativos e add em 205CH
	LDA 2051h      ;carrega o número da memória para o acumulador.
	LXI H, 2053h   ;carrega os registradores.
	ADD M          ;soma do ac para B.
	STA 205Ch      ;Armazena o conteúdo do ac em 205Ch.
	JC L2          ;Pula para L2 se tiver carry

	;soma os menos significativos e add em 205BH
	LDA 2050h      ;carrega o número da memória para o acumulador.
	LXI H, 2052h   ;carrega os registradores.
	ADD M          ;soma do ac para B.
	STA 205Bh      ;Armazena o conteúdo do ac em 205Bh.

L2:   
	LXI H, 2053h   ;carrega os registradores;
	INR D          ;incrementador
	MOV M, D       ;transferência do conteúdo.
	HLT
