Module periodos
implicit none
integer, parameter :: dia=144, mes=30
end module periodos

Program Mareas
use periodos
Implicit None
real, dimension(144) :: a, b , c, d
integer :: i



open(2,file="mareas.csv",status="old")
do i=1, dia, 1
   read (2,*) a(i), b(i), c(i), d(i)  
   write (*,*) a(i), b(i), c(i), d(i)

end do
close(2)

end Program Mareas
