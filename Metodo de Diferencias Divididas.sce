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
  while(ordenPolinomio <= k)
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
