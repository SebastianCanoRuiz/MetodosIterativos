//Jhon Sebastian Cano Ruiz - 1556156
clc()
A = input("Ingrese la matriz en el formato [# # # ; # # # ; # # #]: ")
b = input("Ingrese el vector columna b en el formato [# ; # ; #]: ")
errorLimite= input("Digite el límite de error deseado: ");
limiteIteracion= input("Ingrese un maximo de iteraciones: ");
iteracion=0
errorActual=100
x=[0;0;0]
x1=0
x2=0
x3=0
x1Anterior=0
x2Anterior=0
x3Anterior=0

//Comprobación de que sea diagonal dominante
if(A(1,1) > (A(1,2) + A(1,3)) & A(2,2) > (A(2,1) + A(2,3)) & A(3,3) > (A(3,1) + A(3,2)))
    printf("N=%1.0f \t x1=%1.5f \t x2=%1.5f \t x3=%1.5f \t Error=_____  \n",iteracion,x1,x2,x3);

    while(errorActual > errorLimite & iteracion < limiteIteracion )
        x1Anterior=x(1)
        x2Anterior=x(2)
        x3Anterior=x(3)
        // se aplican las formulas vista en clase para el metodo gauss seidel
        x1= (b(1)-(A(1,2)*x(2)) - (A(1,3)*x(3)))/A(1,1)
        x(1)=x1
        x2= (b(2)-(A(2,1)*x(1)) - (A(2,3)*x(3)))/A(2,2)
        x(2)=x2
        x3= (b(3)-(A(3,1)*x(1)) - (A(3,2)*x(2)))/A(3,3)
        x(3)=x3
        
        //Error con la norma infinita 
        numerador= max(abs(x(1)-x1Anterior),abs(x(2)-x2Anterior),abs(x(3)-x3Anterior));
        denominador= max(abs(x(1)),abs(x(2)),abs(x(3)))
        errorActual= abs(numerador)/abs(denominador)
        iteracion=iteracion+1
        printf("N = %1.0f \t x1 = %1.5f \t x2 = %1.5f \t x3 = %1.5f \t Error = %1.9f\n",iteracion,x1,x2,x3,errorActual);
    end
    
    printf("\nLa solución al sistema es x1=%1.5f \t x2=%1.5f \t x3=%1.5f \n",x1,x2,x3);
else
    print("La matriz no es estrictamente diagonal")
end
