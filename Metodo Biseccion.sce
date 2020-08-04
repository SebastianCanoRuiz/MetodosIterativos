//Jhon Sebastian Cano Ruiz - 1556156

//Función 
function y = funcion(x)
        y = x^4-2*x^3-12*x^2+16*x-40
endfunction

//Datos para realizar la gráfica
x = -10:1:10;
plot2d(x,funcion(x));
xgrid(5);

//Iterador
i = 1;

clc()

//Variables para necesarias para la tabla del método 
an = input("Ingrese un valor para la variable del intervalo inferior -a-: ");
bn = input("Ingrese un valor par la variable del intervalo superior -b-: " );
errordeseado = input("Ingrese el error permitido para solucionar la ecuacion: ");

//Evaluación de cada variable en la función
fan = feval(an, funcion);
fbn = feval(bn, funcion);
pn = (an+bn)/2;
Error = 100

//Iteraciones
while(Error >= errordeseado)
    fpn = feval(pn, funcion);
    caso1 = fan*fpn;
    caso2 = fbn*fpn;
    
    if(caso1 < 0)
        bn = pn;
        fbn = fpn;
        valoranterior = pn;
        pn = (an+bn)/2;
        valoractual = pn;
    end
        if(caso2 < 0)
        an = pn;
        fan = fpn;
        valoranterior = pn;
        pn = (an+bn)/2;
        valoractual = pn;
    end
    i = i+1;
    Error = abs((valoractual-valoranterior)/valoractual);
    printf("%1.0f%1.5f%1.5f\n", i, pn, Error);
end

//Resultados
printf("Raiz = %12.6f\n", valoractual);
printf("Con un error de %f", Error);
printf("Tras %d iteraciones", i);
