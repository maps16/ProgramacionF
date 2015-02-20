!===================================================
! Subrutinas.f90 : Demustra el llamado de subrutinas
!===================================================

Subroutine g(x, y, ans1 , ans2 )

  Implicit None
  Real (8) :: x , y , ans1 , ans2
  ans1= sin (x*y) + 1
  ans2= ans1**2

end Subroutine g

!

program main_program
  
  Implicit None
  Real *8 :: Xin=0.25 , Yin=2.0 , Gout1 , Gout2
  call g(Xin, Yin, Gout1, Gout2 ) 
  write ( * , *) 'The answere are: ' , Gout1 , Gout2

end program main_program
