!==================================================
! Math.f90 : Desmostracion de funciones matematicas
!==================================================

program Math_Test
  
  Real *8 :: x= 1.0 , y , z
  y= sin (x)
  z= exp (x) + 1.0
  print *, x , y , z
  
end program Math_Test
