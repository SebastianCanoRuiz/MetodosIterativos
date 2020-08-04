//Jhon Sebastian Cano Ruiz - 1556156
clc()

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
