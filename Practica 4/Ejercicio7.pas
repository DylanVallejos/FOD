{
    Dado el siguiente árbol B de orden 5, mostrar cómo quedaría el mismo luego de realizar
las siguientes operaciones:  Justificar detalladamente cada
operación indicando lecturas y escrituras en orden de ocurrencia. Para la resolución de
underflow debe utilizar política a izquierda. Graficar cada operación por separado
}

                        2: 0 (220) 1 (390) 4 (455) 5 (541) 3

        0: (10)(150) 1: (225)(241)(331)(360) 4: (400)(407) 5: (508)(533) 3: (690)(823)

225,241,320,331,360
Redistribuir en el nodo 1 me va a quedar 225,241 subo el 320 pero no se puede porque la raiz esta llena
asi que redistribuyo al raiz 220,320,390,455,541 en la raiz queda el 390

                         2:  1 (390)  

            2: 0(220) 1:(320)6            4 (455) 5 (541) 3

0: (10)(150) 1: (225)(241)  6:(331)(360)        4: (400)(407) 5: (508)(533) 3: (690)(823)
        
 +320, -390, -400, -533.        