
;Miguel Angel Licea Cespedes
;Diego Javier Reyes Medranda
;Sopa de Letras

.model small
.data 
bienv db 'Bienvenido al juego: Sopa de letras', 10 ,13, '$'
cate db 'Seleccione su categoria: ', 10, 13, '$'
cate1 db '1.- Animales', 10, 13, '$'
cate2 db '2.- Vehiculos de transporte', 10, 13, '$'
cate3 db '3.- Lenguajes de programacion', 10, 13, '$'
salida db 'Presione cualquier otra tecla para salir', 10, 13, '$'  
salto db 10,13, '$'   
continuar db '->Desea rendirse? (y/n) $'
ingresar_palabra db 'Ingrese la palabra que encuentre: $'
palabra_c db 'Encontro una palabra', 10, 13, '$' 
palabra_no db 'Palabra no encontrada', 10, 13, '$'
despedida db 'Gracias por jugar!!$'
win db 'Has ganado!', 10, 13, '$'
;vector con los valores del usuario
user db 20 DUP('$')

;definiendo las palabras
;Palabras de animales 
animal_1 db 'gato$'
animal_2 db 'iguana$'
animal_3 db 'mono$'
animal_4 db 'cuy$'
animal_5 db 'pez$'

;Palabras de Vehiculos de Transporte
vehiculo_1 db 'bote$'
vehiculo_2 db 'camion$'
vehiculo_3 db 'moto$'
vehiculo_4 db 'jet$'
vehiculo_5 db 'bus$'

;Palabras lenguajes
lenguaje_1 db 'ruby$'
lenguaje_2 db 'python$'
lenguaje_3 db 'java$'
lenguaje_4 db 'php$'
lenguaje_5 db 'sql$'

;Guardando las palabras en variables
palabra1 db 'ruby$' 
lenp1 dw 0005h
palabra2 db 'python$' 
lenp2 dw 0007h 
palabra3 db 'java$'
lenp3 dw 0005h
palabra4 db 'php$'
lenp4 dw 0004h  
palabra5 db 'c++$'  
lenp5 dw 0004h

var db ? 
cnt db ?

;sopa de letras de un solo vector
sopa_letras           db 'a','b','p','h','e','f','g','h','i','j','k','l','z','x','p'        
                      db 'a','b','c','d','e','f','g','h','h','d','k','y','o','v','l'
                      db 'r','u','b','y','j','k','l','z','x','d','k','p','o','v','a'
                      db 'a','b','c','d','e','f','g','h','i','j','k','y','l','m','r'
                      db 'g','h','i','j','p','d','e','f','k','l','z','t','k','p','v'
                      db 'g','h','i','a','h','k','l','z','x','u','o','h','p','q','z'
                      db 'j','k','l','v','p','a','b','c','d','e','f','o','f','x','p'
                      db 'j','k','y','a','m','h','i','a','j','k','l','n','c','b','y'
                      db 'g','h','i','j','j','d','e','f','k','l','z','t','c','p','g'
                      db 'g','h','i','a','j','k','l','z','x','u','o','h','p','+','b'
                      db 'r','u','b','t','j','k','l','z','k','l','z','t','t','p','+'
                      db 'g','h','i','k','l','z','l','z','t','k','p','c','m','a','c'
                      db 'g','h','c','t','j','d','e','f','k','l','z','t','k','p','d'
                      db 'a','b','c','d','e','f','g','h','i','j','k','l','z','x','y'
                      db 'g','x','a','b','f','k','l','z','t','k','p','l','z','x','r'
                      
sopa_letras_lenguajes_1 db 'a','b','p','h','e','f','g','h','i','j','k','l','z','x','p'        
                      db 'a','b','t','d','e','f','g','h','h','d','k','y','o','v','l'
                      db 'r','u','b','y','j','k','l','z','x','d','k','p','o','v','a'
                      db 'a','b','r','d','e','f','g','h','i','j','k','y','l','m','r'
                      db 'g','h','i','j','p','d','e','f','k','l','z','t','k','p','v'
                      db 'g','h','i','a','h','k','l','z','x','u','o','h','p','q','z'
                      db 'j','k','l','v','p','a','b','r','d','e','f','o','f','x','p'
                      db 'j','k','y','a','m','h','i','a','j','k','l','n','t','b','y'
                      db 'g','h','i','j','j','d','e','f','k','l','z','t','s','p','g'
                      db 'g','h','i','a','j','k','l','z','x','u','o','h','p','q','b'
                      db 't','u','b','t','j','k','l','z','k','l','z','t','t','p','l'
                      db 'g','h','i','k','l','z','l','z','t','k','p','t','m','a','t'
                      db 'g','h','t','t','j','d','e','f','k','l','z','t','k','p','d'
                      db 'a','b','t','d','e','f','g','h','i','j','k','l','z','x','y'
                      db 'g','x','a','b','f','k','l','z','t','k','p','l','z','x','t' 
                      
sopa_letras_lenguajes_2 db 'q','t','f','p','h','j','x','x','b','v','o','t','v','m','p'        
                        db 'a','b','t','d','e','f','g','h','h','d','k','y','o','v','d'
                        db 'r','u','b','y','j','k','l','z','x','a','m','p','o','y','a'
                        db 'a','b','t','d','e','f','g','h','i','j','k','y','l','m','t'
                        db 'z','h','i','j','p','d','e','f','k','l','z','t','k','p','d'
                        db 'g','o','i','a','h','k','l','z','x','u','o','h','p','a','z'
                        db 'j','k','l','v','p','a','b','t','d','e','f','o','f','x','p'
                        db 'a','j','j','a','b','q','t','t','j','k','l','n','t','b','y'
                        db 'g','h','i','j','j','d','e','f','k','l','z','t','s','p','g'
                        db 'g','p','i','a','w','k','l','z','x','u','o','t','a','q','b'
                        db 't','u','b','t','j','k','l','o','k','l','z','t','t','p','l'
                        db 'g','h','i','k','l','z','l','z','t','k','p','t','m','a','t'
                        db 'q','t','f','t','h','j','x','x','b','v','o','a','v','m','p'
                        db 'a','b','t','d','e','f','g','h','i','j','k','z','z','x','t'
                        db 'g','x','a','b','f','k','l','z','t','k','p','l','z','x','t'                       
            
sopa_letras_animales_1 db 'a','b','p','h','e','f','g','h','i','j','k','l','z','x','p'        
                       db 'a','b','t','d','e','f','g','h','h','d','k','y','o','v','l'
                       db 'g','a','t','o','j','k','l','z','x','d','k','i','o','v','a'
                       db 'a','b','t','d','e','f','g','h','i','j','k','g','l','m','r'
                       db 'g','h','i','m','c','d','e','f','k','l','z','u','k','p','v'
                       db 'g','h','i','o','u','k','l','z','x','u','o','a','p','q','z'
                       db 'j','k','l','n','y','a','b','t','d','e','f','n','f','x','p'
                       db 'j','k','y','o','m','h','i','a','j','k','l','a','t','b','y'
                       db 'g','h','i','j','j','d','e','f','k','l','z','t','p','p','g'
                       db 'g','h','i','a','j','k','l','z','x','u','o','h','p','e','b'
                       db 't','u','b','t','j','k','l','z','k','l','z','t','t','p','z'
                       db 'g','h','i','k','l','z','l','z','t','k','p','t','m','a','t'
                       db 'g','h','t','t','j','d','e','f','k','l','z','t','k','p','d'
                       db 'a','b','t','d','e','f','g','h','i','j','k','l','z','x','y'
                       db 'g','x','a','b','f','k','l','z','t','k','p','l','z','x','t'   
                       
                        
sopa_letras_animales_2  db 'q','t','f','p','h','j','x','x','b','v','o','t','v','m','p'        
                        db 'a','b','t','d','e','f','g','h','h','d','k','y','o','v','d'
                        db 'g','a','t','o','j','k','l','z','x','a','m','i','o','y','a'
                        db 'a','b','t','d','e','f','g','h','i','j','k','g','l','m','r'
                        db 'z','h','i','m','c','d','e','f','k','l','z','u','k','p','d'
                        db 'g','o','i','o','u','k','l','z','x','u','o','a','p','a','z'
                        db 'j','k','l','n','y','a','b','c','d','e','f','n','f','x','p'
                        db 'a','j','j','o','b','q','t','r','j','k','l','a','c','b','y'
                        db 'g','h','i','j','j','d','e','f','k','l','z','t','p','p','g'
                        db 'g','p','i','a','w','k','l','z','x','u','o','r','a','e','b'
                        db 'r','u','b','t','j','k','l','o','k','l','z','t','t','p','z'
                        db 'g','h','i','k','l','z','l','z','t','k','p','c','m','a','c'
                        db 'q','r','f','t','h','j','x','x','b','v','o','a','v','m','p'
                        db 'a','b','c','d','e','f','g','h','i','j','k','z','z','x','r'
                        db 'g','x','a','b','f','k','l','z','t','k','p','l','z','x','r'                       
                         

sopa_letras_vehiculos_1 db 'a','b','p','h','e','f','g','h','i','j','k','l','z','x','p'        
                        db 'a','b','c','d','e','f','g','h','h','d','k','y','o','v','l'
                        db 'b','o','t','e','j','k','l','z','x','d','k','c','o','v','a'
                        db 'a','b','c','d','e','f','g','h','i','j','k','a','l','m','r'
                        db 'g','h','i','m','j','d','e','f','k','l','z','m','k','p','v'
                        db 'g','h','i','o','e','k','l','z','x','u','o','i','p','q','z'
                        db 'j','k','l','t','t','a','b','c','d','e','f','o','f','x','p'
                        db 'j','k','y','o','m','h','i','a','j','k','l','n','c','b','y'
                        db 'g','h','i','j','j','d','e','f','k','l','z','t','b','p','g'
                        db 'g','h','i','a','j','k','l','z','x','u','o','h','p','u','b'
                        db 'r','u','b','t','j','k','l','z','k','l','z','t','t','p','s'
                        db 'g','h','i','k','l','z','l','z','t','k','p','c','m','a','c'
                        db 'g','h','c','t','j','d','e','f','k','l','z','t','k','p','d'
                        db 'a','b','c','d','e','f','g','h','i','j','k','l','z','x','y'
                        db 'g','x','a','b','f','k','l','z','t','k','p','l','z','x','r' 
                        
sopa_letras_vehiculos_2 db 'q','r','f','p','h','j','x','x','b','v','o','r','v','m','p'        
                        db 'a','b','c','d','e','f','g','h','h','d','k','y','o','v','d'
                        db 'b','o','t','e','j','k','l','z','x','a','m','c','o','y','a'
                        db 'a','b','c','d','e','f','g','h','i','j','k','a','l','m','r'
                        db 'z','h','i','m','j','d','e','f','k','l','z','m','k','p','d'
                        db 'g','o','i','o','e','k','l','z','x','u','o','i','p','a','z'
                        db 'j','k','l','t','t','a','b','c','d','e','f','o','f','x','p'
                        db 'a','j','j','o','b','q','t','r','j','k','l','n','c','b','y'
                        db 'g','h','i','j','j','d','e','f','k','l','z','t','b','p','g'
                        db 'g','p','i','a','w','k','l','z','x','u','o','r','a','u','b'
                        db 'r','u','b','t','j','k','l','o','k','l','z','t','t','p','s'
                        db 'g','h','i','k','l','z','l','z','t','k','p','c','m','a','c'
                        db 'q','r','f','t','h','j','x','x','b','v','o','a','v','m','p'
                        db 'a','b','c','d','e','f','g','h','i','j','k','z','z','x','r'
                        db 'g','x','a','b','f','k','l','z','t','k','p','l','z','x','r'
tiempo db 1  
.code
.start 
mov cx, 0000h
mov ah,0
int 1ah

cmp cx,000Ch
jna menu
mov si,offset tiempo
mov [si],2
mov si,0000h

menu: ;Desplega el menu de opciones a escoger
mov ax, 0000h
mov bx, 0000h
mov cx, 0000h
mov ah, 09h
lea dx, bienv
int 21h
lea dx, cate
int 21h
lea dx, cate1
int 21h
lea dx, cate2
int 21h
lea dx, cate3 
int 21h
lea dx, salida
int 21h

_pedirOpcion: ;Permite al usuario escoger su opcion
mov ah, 01h
int 21h
sub al, 30h
cmp al, 1
je _opcion1
cmp al, 2
je _opcion2
cmp al, 3
je _opcion3
jnz salir


_opcion1:    ; si la opcion escogida es la 1 realizamos se cargan las palabras a las variables generales de cada palabra
mov ah, 09h
lea dx, salto
int 21h
;Inicializando los valores de las palabras
mov di,offset palabra1
lea si,animal_1
mov cx,lenp1

animal_p1:lodsb ;cargando la primera palabra secreta de la opcion de animales
mov [di],al
inc di
loop animal_p1

mov di,offset palabra2
lea si,animal_2
mov cx,lenp2

animal_p2:lodsb ;cargando la segunda palabra secreta de la opcion de animales
mov [di],al
inc di
loop animal_p2 

mov di,offset palabra3  
lea si,animal_3
mov cx,lenp3

animal_p3:lodsb  ; ;cargando la tercera palabra secreta de la opcion de animales
mov [di],al
inc di
loop animal_p3

mov di,offset palabra4 
lea si,animal_4
mov cx,lenp4

animal_p4:lodsb ; cargando la cuarta palabra secreta de la opcion de animales
mov [di],al
inc di
loop animal_p4

mov di,offset palabra5
lea si,animal_5
mov cx,lenp5

animal_p5:lodsb  ;cargando la quinta palabra secreta de la opcion de animales
mov [di],al
inc di
loop animal_p5

mov bl, tiempo
cmp bl, 1
je cargar_sopa_animales_1
jne cargar_sopa_animales_2

;Inicializando los valores de la sopa 
cargar_sopa_animales_1:  ; guardando los valores de la sopa_animales 1 en la variable sopa_letras
mov di,offset sopa_letras 
lea si,sopa_letras_animales_1
mov cx,225
jmp sopa_animal
          
cargar_sopa_animales_2:   ;guardando los valores de la primera matriz de animales en sopa_letras
mov di,offset sopa_letras 
lea si,sopa_letras_animales_2
mov cx,225
jmp sopa_animal
          
sopa_animal: lodsb   ; guardando los valores de la segunda matriz de animales en sopa_letras
mov [di],al
inc di
loop sopa_animal

jmp _inicializarImpresion

;////////////////////////Termina la Opcion 1////////////////////////////
_opcion2:   ; si la opcion escogida es la 2 se realiza lo siguiente
mov ah, 09h
lea dx, salto
int 21h

;Inicializando los valores de las palabras
mov di,offset palabra1
lea si,vehiculo_1
mov cx,lenp1

vehiculo_p1:lodsb  ; cargando la primera palabra secreta de la opcion de vehiculos
mov [di],al
inc di
loop vehiculo_p1

mov di,offset palabra2
lea si,vehiculo_2
mov cx,lenp2

vehiculo_p2:lodsb   ; cargando la segunda palabra secreta de la opcion de vehiculos
mov [di],al
inc di
loop vehiculo_p2 

mov di,offset palabra3
lea si,vehiculo_3
mov cx,lenp3

vehiculo_p3:lodsb   ; cargando la tercera palabra secreta de la opcion de vehiculos
mov [di],al
inc di
loop vehiculo_p3

mov di,offset palabra4
lea si,vehiculo_4
mov cx,lenp4

vehiculo_p4:lodsb  ; cargando la cuarta palabra secreta de la opcion de vehiculos
mov [di],al
inc di
loop vehiculo_p4

mov di,offset palabra5
lea si,vehiculo_5
mov cx,lenp5

vehiculo_p5:lodsb  ; cargando la quinta palabra secreta de la opcion de vehiculos
mov [di],al
inc di
loop vehiculo_p5


mov bl, tiempo
cmp bl, 1
je cargar_sopa_vehiculos_1
jne cargar_sopa_vehiculos_2

;Inicializando los valores de la sopa 
cargar_sopa_vehiculos_1:     ; guardando los valores de la primera matriz de vehiculos en sopa_letras
mov di,offset sopa_letras 
lea si,sopa_letras_vehiculos_1
mov cx,225
jmp sopa_animal
          
cargar_sopa_vehiculos_2:     ; guardando los valores de la segunda matriz de vehiculos en sopa_letras
mov di,offset sopa_letras 
lea si,sopa_letras_vehiculos_2
mov cx,225
jmp sopa_animal


;////////////////////////Termina la Opcion 2////////////////////////////


_opcion3:    ; si la opcion escogida es la 3 entonces se hace lo siguiente
mov ah, 09h
lea dx, salto
int 21h
mov ch,0 

;Inicializando los valores de las palabras
mov di,offset palabra1
lea si,lenguaje_1
mov cx,lenp1

lenguaje_p1:lodsb ; cargando la primera palabra secreta de la opcion de lenguajes
mov [di],al
inc di
loop lenguaje_p1

mov di,offset palabra2
lea si,lenguaje_2
mov cx,lenp2

lenguaje_p2:lodsb  ; cargando la segunda palabra secreta de la opcion de lenguajes
mov [di],al
inc di
loop lenguaje_p2 

mov di,offset palabra3
lea si,lenguaje_3
mov cx,lenp3

lenguaje_p3:lodsb  ; cargando la tercera palabra secreta de la opcion de lenguajes
mov [di],al
inc di
loop lenguaje_p3

mov di,offset palabra4
lea si,lenguaje_4
mov cx,lenp4

lenguaje_p4:lodsb   ; cargando la cuarta palabra secreta de la opcion de lenguajes
mov [di],al
inc di
loop lenguaje_p4

mov di,offset palabra5
lea si,lenguaje_5
mov cx,lenp5

lenguaje_p5:lodsb    ; cargando la quinta palabra secreta de la opcion de lenguajes
mov [di],al
inc di
loop lenguaje_p5
                  
                  
mov bl, tiempo
cmp bl, 1
je cargar_sopa_lenguajes_1
jne cargar_sopa_lenguajes_2

;Inicializando los valores de la sopa 
cargar_sopa_lenguajes_1:   ; guardando los valores de la primera matriz de lenguajes en sopa_letras
mov di,offset sopa_letras 
lea si,sopa_letras_lenguajes_1
mov cx,225
jmp sopa_animal
          
cargar_sopa_lenguajes_2:   ; guardando los valores de la primera matriz de lenguajes en sopa_letras
mov di,offset sopa_letras 
lea si,sopa_letras_lenguajes_2
mov cx,225
jmp sopa_animal

;////////////////////////Termina la Opcion 3////////////////////////////


;Imprimir la sopa de letras
_inicializarImpresion:
mov bx, 0000h
mov cl,15;cantidad de caracteres por linea
mov ch,0;cantidad de caracteres en total
mov si,offset sopa_letras
jmp _imprimirSopaLetraP1 

;Parte 1 para imprimir las letras
_imprimirSopaLetraP1:    ; imprime valor por valor de la sopa de letras adem[as de el espacio entre los valores de la matriz
mov dl,[si]
mov ah,02h
int 21h
mov var,dl
mov dl,0h
int 21h
mov dl,var
inc si
sub cl,1
add ch,1
cmp cl,0
je _imprimirSalto
jmp _imprimirSopaLetraP2

;Parte 2 para imprimir las letras
_imprimirSopaLetraP2:            ; imprime un salto de linea si ha llegado al final de la sopa de letras o sigue con impresion 
                                ; saltando a la etiqueta _imprimirSopaLetraP1
cmp ch,225
je _imprimirSalto
jne _imprimirSopaLetraP1

_imprimirSalto:           ; imprime un salto de linea
mov ah,09h
lea dx,salto
int 21h
cmp ch,225
je _verificarWin
mov cl,15
jmp _imprimirSopaLetraP1

_verificarWin:         ; luego de imprimir la sopa de letras por completo verifica si ya el jugador ha ganado para terminar el juego
mov al,cnt
cmp al,5
je salir
jmp _seguir


_seguir:         ; si al imprimir la sopa de letras el jugador no ha ganado esta etiqueta ayuda a inicializar los valores para 
                 ; que el usuario pueda luego ingresar una palabra
mov ax,0000h
mov bx,0000h
mov dx,0000h

mov ah, 09h
lea dx, salto
int 21h
lea dx, ingresar_palabra 
int 21h

_leer_pantalla:   ; la palabra ingresada por el usuario es leida por esta etiqueta para luego transformarla
mov ax, 0000h
mov bx, 0000h
mov dx, 0000h
mov ax, @data
mov ds, ax 
mov es, ax
 
mov ah, 0ah
lea dx, user  ;ingresar string en vector
mov user, 15
int 21h  
mov ah, 09h
lea dx, salto
int 21h
mov si, 0
mov ax, 0000h
mov al, user[1]
jmp _transformar_M

_transformar_M:  ;Transformar a minusculas todos los caracteres que ingrese el usuario por pantalla
;SI LA TECLA PRESIONADA ESTA ENTRE EL RANGO 'A' Y 'Z'
mov bl, user[2+si]  
cmp bl,41H ;SE COMPARA CON A 
jb _verificar_M ;SI ES MENOR REGRESA A LA ETIQUETA INICIO
cmp bl,5AH ;SE COMPARA CON Z 
ja _verificar_M ;SI ES MAYOR SALTA A INICIO
add bl,20H ;SE SUMA 20H A EL CARACTER ALMACENADO EN 'AL' PARA LLEVARLO A MINUSCULA

mov user[2+si], bl
jmp _verificar_M

_verificar_M:   ; verificar si todos los elementos de lo que ingresa el usuario este en minusculas
                ; si no transformarlo a minuscula
inc si 
cmp ax, si
jne _transformar_M

_Comp1:       ; Comparar la palabra ingresada por el usuario con la primera que hemos cargado segun la opcion y si son iguales
              ; cambiar el valor de la matriz por su valor en Mayuscula. si son iguales aumentamos el contador de palabras encontradas
mov si,0000h
mov di,0000h
mov cx,0000h
mov cx, lenp1
sub cx, 1
cmp ax, cx
jne _Comp2    
lea si,palabra1;[si]
lea di,user+2
repe cmpsb
jne _Comp2
mov si,offset sopa_letras
mov bx, [si+30]
sub bx, 20h
mov [si+30], bx 
mov bx, [si+31]
sub bx, 20h
mov [si+31], bx
mov bx, [si+32]
sub bx, 20h
mov [si+32], bx
mov bx, [si+33]
sub bx, 20h
mov [si+33], bx

mov di,offset palabra1
mov [di],'-'
jmp contar

;jne _leer_pantalla   

_Comp2:        ; Comparar la palabra ingresada por el usuario con la segunda que hemos cargado segun la opcion y si son iguales
              ; cambiar el valor de la matriz por su valor en Mayuscula. si son iguales aumentamos el contador de palabras encontradas
mov si,0000h
mov di,0000h
mov cx,0000h
mov cx, lenp2
sub cx, 1 
cmp ax, cx
jne _Comp3 

lea si,palabra2;[si]
lea di,user+2
repe cmpsb
jne _Comp3
mov si,offset sopa_letras 
mov bx, [si+41]
sub bx, 20h
mov [si+41], bx
mov bx, [si+56]
sub bx, 20h
mov [si+56], bx
mov bx, [si+71]
sub bx, 20h
mov [si+71], bx
mov bx, [si+86]
sub bx, 20h
mov [si+86], bx
mov bx, [si+101]
sub bx, 20h
mov [si+101], bx
mov bx, [si+116]
sub bx, 20h
mov [si+116], bx

mov di,offset palabra2
mov [di],'-'
jmp contar  

;jne _leer_pantalla 

_Comp3:           ; Comparar la palabra ingresada por el usuario con la tercera que hemos cargado segun la opcion y si son iguales
              ; cambiar el valor de la matriz por su valor en Mayuscula. si son iguales aumentamos el contador de palabras encontradas
mov si,0000h
mov di,0000h
mov cx,0000h
mov cx, lenp3
sub cx, 1
cmp ax, cx
jne _Comp4 

lea si,palabra3;[si]
lea di,user+2
repe cmpsb
jne _Comp4
mov si,offset sopa_letras
mov bx, [si+63]
sub bx, 20h
mov [si+63], bx
mov bx, [si+78]
sub bx, 20h
mov [si+78], bx
mov bx, [si+93]
sub bx, 20h
mov [si+93], bx
mov bx, [si+108]
sub bx, 20h
mov [si+108], bx

mov di,offset palabra3
mov [di],'-'
jmp contar

;jne _leer_pantalla   

_Comp4:        ; Comparar la palabra ingresada por el usuario con la cuarta que hemos cargado segun la opcion y si son iguales
              ; cambiar el valor de la matriz por su valor en Mayuscula. si son iguales aumentamos el contador de palabras encontradas
mov si,0000h
mov di,0000h
mov cx,0000h
mov cx, lenp4
sub cx, 1  
cmp ax, cx
jne _Comp5 

lea si,palabra4;[si]
lea di,user+2
repe cmpsb
jne _Comp5
mov si,offset sopa_letras 
mov bx, [si+64]
sub bx, 20h
mov [si+64], bx
mov bx, [si+79]
sub bx, 20h
mov [si+79], bx
mov bx, [si+94]
sub bx, 20h
mov [si+94], bx

mov di,offset palabra4
mov [di],'-'
jmp contar 

;jne _leer_pantalla 

_Comp5:                    ; Comparar la palabra ingresada por el usuario con la quinta que hemos cargado segun la opcion y si son iguales
              ; cambiar el valor de la matriz por su valor en Mayuscula. si son iguales aumentamos el contador de palabras encontradas
mov si,0000h
mov di,0000h
mov cx,0000h
mov cx, lenp5
sub cx, 1 
cmp ax, cx
jne _Continuar 

lea si,palabra5;[si]
lea di,user+2
repe cmpsb
jne _Continuar
mov si,offset sopa_letras
mov bx, [si+132]
sub bx, 20h
mov [si+132], bx
mov bx, [si+148]
sub bx, 20h
mov [si+148], bx
mov bx, [si+164]
sub bx, 20h
mov [si+164], bx

mov di,offset palabra5
mov [di],'-'
jmp contar

         
contar:     ; si la palabra ingresada por un usuario es una de las palabras secretas en la matriz entonces aumentamos
            ; el contador de palabras encontradas, si la cantidad de palabras encontradas no es igual a 5 volvemos a iniciar la impresion
            ; de la matriz y si la cantidad de palabras encontradas es igual a 5 entonces saltamos a la etiqueta _win
mov ax, 0000h
mov bx, 0000h 
mov cx, 0000h 
mov dx, 0000h
mov ah, 09h
lea dx,salto
int 21h 
lea dx, palabra_c
int 21h  
mov al, cnt
add al, 1
mov cnt, al
cmp al, 5
jne _inicializarImpresion
je _win

_win:         ; muestra por pantalla el mensaje de que ha ganado el usuario y vuelve a imprimir la matriz
mov ah, 09h 
lea dx, win
int 21h
jmp _inicializarImpresion

_Continuar:   ; si la palabra ingresada por el usuario es incorrecta entonces le reguntamos si desea rendirse o no
              ; si desea rendirse(Si el usuario ingresa una n o N entonces no se rinde pero si ingresa n entonces s[i se rinde
mov ax, 0000h
mov bx, 0000h
mov ah, 09h
lea dx, salto 
int 21h
lea dx, palabra_no
int 21h
lea dx, continuar 
int 21h
mov ah, 01h
int 21h 
mov bl, al 
mov ah, 09h
lea dx, salto 
int 21h    
mov al, bl
cmp al, 6Eh                       ;79h
je _inicializarImpresion
cmp al,4Eh
je _inicializarImpresion 
jne salir

salir:
mov ah,9
lea dx, salto
int 21h
lea dx,despedida
int 21h
.exit
end




