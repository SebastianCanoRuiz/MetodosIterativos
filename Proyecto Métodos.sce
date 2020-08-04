clc
printf('Bienvenidos al Proyecto de Métodos Númericos\n')
printf('Realizado por Jhon Sebastian Cano Ruiz - 1556156\n')
printf('y créditos a Burden a los diferentes videos de Youtube sobre Scilab\n\n')

('Seleccione el Método que desea ejecutar\n\n')
printf('\t1-\t Método de Bisección.\n')
printf('\t2-\t Método de Gauss-Seidel.\n')
printf('\t3-\t Método de Mínimos Cuadrados-Lineal.\n')
printf('\t4-\t Método de Diferencias Divididas.\n')
printf('\t5-\t Salir\n\n')

seleccion = input("->","s");

select seleccion
    
  case "1" then
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
        printf("\nRaiz = %12.6f\n", valoractual);
        printf("Con un error de %f\n", Error);
        printf("Tras %d iteraciones", i);

  case "2" then
        //Jhon Sebastian Cano Ruiz - 1556156      
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
            printf("La matriz no es estrictamente diagonal")
        end
        
  case "3" then
        //Jhon Sebastian Cano Ruiz - 1556156
        printf('Ingrese los valores de X en el formato [#;#;#;. . .]]: ');
        x = input(' ');
        
        printf('Ingrese los valores de Y en el formato [#;#;#;. . .]]: : ');
        y = input(' ');
        
        ci = 0; //contador de las variables de i
        i = length(x);
        xx= 0;
        xy = 0;
        
        //Sumatoria de x
        sumx=sum(x);
        //Sumatoria de y
        sumy=sum(y);
        //Sumatoria de x^2
        sumx2=sum(x**2);
        //Sumatoria de x*y
        sumxy=sum(x .*y);
        
        //Resultados de a0 y a1
        Ao = ((sumx2*sumy)-(sumx*sumxy))/((i*sumx2)-(sumx)**2);
        A1 = ((i*sumxy)-(sumx*sumy))/((i*sumx2)-(sumx)**2);
        
        //Tabla
        printf(' n \t         X               Y              x*x             x*y \n');
        while ci<i
            ci = ci+1;
            printf('%2d \t %11.3f \t %11.3f \t %11.3f \t %11.3f\n',ci,x(ci),y(ci),x(ci)^2,x(ci)*y(ci))
        end 
        printf(' Σ    \t%1.5f \t %1.5f \t %1.5f \t %1.5f', sumx, sumy, sumx2, sumxy)
        
        //Polinomio
        printf('\nP1(x) = %1.5f*a0 + %1.5f*a1\n', Ao, A1)

  case "4" then
    //Jhon Sebastian Cano Ruiz - 1556156
    
    //se piden los valores de entrada.
    k=input('Ingrese el numero de pares:   ');
    
    //se crean los vectores llenos de ceros.
    x=zeros(k,1);
    y=zeros(k,1);
    
    //se piden los pares para Y=f(x)
       for i=1:1:k
            printf('valor de x%1.0f=', i-1)
            x(i)=input(' ');
            printf('valor de y%1.0f=', i-1)
            y(i)=input(' ');
        clc
       end
     
    //se muestra la tabla de valores
      disp('Tabla de Valores')
      disp(['i' 'x' 'y'])
      disp([(0:k-1)' x y])
      disp('*******************************')
     
    //calculo de las diferencias divididas
    
      l = k-1;
      T = zeros(k,k);
      T(:,1) = y;
     
      for j=1:l
        for i=1:k-j
          T(i,j+1)=(T(i+1,j)-T(i,j))/(x(i+j)-x(i));
        end
      end
    
      T2=[(0:k-1)',x,T];
     
      disp('Resultado Diferencia dividida')
      for i=1:k
        disp(T2(i,1:k-i+3))
      end
      
      disp('*************************************')
    
    //Comienza el calculo para generar el polinomio
      ordenPolinomio = input("Seleccione el orden del polinomio: ")
      while(ordenPolinomio >= k)
          printf('Recuerde que el orden del polinomio debe ser menor al número de pares de datos\n')
          ordenPolinomio = input("Ingrese el orden del Polinomio: ")
      end    
      
      Pn = 'Pn = '
      //Se Inicia a construir el polinomio tomando el primer termino del calculo anterior
      for i = 1 : ordenPolinomio+1
          termino = ""
          if i <> 1 then
            //En esta iteracion se anexan los terminos que multiplican tipo (x-#)
            for j=1:i-1
                termino = termino + "(x-" + mtlb_num2str(x(j)) + ")"
            end
            Pn = Pn + " + " + mtlb_num2str(T2(1,2+i)) + "*" + termino
          else
            Pn = Pn + mtlb_num2str(T2(1,3))
          end
      end
      printf('%s', Pn)
  else
    printf('Dato-->%1.0f', seleccion)
    disp('Hasta Pronto!')
end 

