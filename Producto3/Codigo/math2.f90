!==================================================
! Math2.f90 : Desmostracion de funciones matematicas
!==================================================

program Math_Test

  Real *8 :: x= -1 , y=2.0 , z=0
  Real *8 :: xx , yy , zz
  xx= sqrt (x)
  yy= acos (y)
  zz= log (z)
  print *, xx , yy , zz 
  
end program Math_Test
