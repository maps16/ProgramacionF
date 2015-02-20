!=======================================
! Area.f90 : Calcula el area del circulo
!=======================================

program Area_Circulo !Inicio de programa

  Implicit None
  Real *8 :: radius , circum , area !Declaracion de variables
  Real *8 :: PI = 4.0*atan(1.0)
  Integer :: model_n =1
  print *, 'Ingrese radio' !Hablar con el usuario
  read *, radius !Leer respuesta de usuario
  circum = 2.0*PI*radius !Calculo de la circunferencia
  area = radius*radius*PI !Calcula el area
  print *, 'Programa Número =', model_n
  print *, 'Radio =', radius
  print *, 'Circunferencia =' , circum
  print *, 'Area =', area

end program Area_Circulo
  
