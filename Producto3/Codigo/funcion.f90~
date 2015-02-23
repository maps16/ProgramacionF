!===================================
! Funcion.f90 : Llamar a una funcion
!===================================

Real *8 Function f (x,y)
  Implicit None
  Real *8 :: x , y
  f= 1.0 + sin (x*y)
end Function f
!
Program Main
  
  Implicit None
  Real *8 :: Xin =0.25 , Yin= 2 , c , f 
  c = f ( Xin, Yin )
  write ( * , * ) 'f(Xin, Yin) =' , c

end Program Main
