!=======================================
! Volumen.f90 : Calcula el volumen de una esfera
!=======================================

program Area_Circulo !Inicio de programa

  Implicit None
  Real *8 :: radius , altura , vol , P3 !Declaracion de variables
  Real *8 :: PI = 4.0*atan(1.0)
  Integer :: model_n =1
  print *, 'Ingrese radio' !Hablar con el usuario
  read *, radius !Leer respuesta de usuario
  print *, 'Ingrese altura' !Hablar con el usuario
  read *, altura !Leer respuesta de usuario
  P3= 3.00 * radius - altura
  vol= 1.00 / 3.00 * PI * altura * altura * P3   !Calculo del volumen
  print *, 'Programa Número =', model_n  !Muestra los resultados obtenidos
  print *, 'Radio =', radius
  print *, 'Altura =' , altura
  print *, 'Volumen =', vol

end program Area_Circulo
  
