!===================================================================
!Este programa calcula el tiro parabolico con resistencia en el aire
!===================================================================
!===================================================================
MODULE cons

  Real , parameter :: rad =(4*atan(1.0))/180
  Real , parameter :: pi=4*atan(1.0)
  Integer , parameter :: ntps = 6000
  Real , parameter :: g = 9.81

  Real , parameter :: DAire = 1.29 !Densidad del aire
  Real , parameter :: Csphere = 0.47
END MODULE cons
!===================================================================
subroutine nFric (xi,yi,vi,ang,xf,yf,tf)
 
  USE cons
  IMPLICIT NONE
  Integer :: i 
  Real, Dimension (1: ntps) :: x,y,t
  Real :: xi, yi, vi, ang    !Variables externas
  Real :: xf, yf, tf    !Variables internas

  ang = ang*rad !conversion Grad-Rad

  tf = (2*vi*SIN(ang))/(g)
  xf = xi+((vi*vi+SIN(2*ang))/(g))
  yf = yi+(((vi*vi)*(SIN(ang)*SIN(ang)))/(2*g))

  OPEN (1, FILE = "nfric.dat")

  DO i=1,ntps,1
  
     t(i)= float(i)*0.01
     x(i)= xi + (vi * cos(ang) *t(i))
     y(i)= yi + (vi * sin(ang) *t(i)) - (0.5*g*t(i)*t(i))
     write (1,1001) x(i), y(i)
     1001 format (f11.5,f11.5)
     IF (y(i)<0)  EXIT
  END DO

  CLOSE (1)
  
end subroutine nFric
!===================================================================

!===================================================================
program proyectil
  use cons
  implicit none
  !Declaración
  Real:: xi, yi, vi, ang !Entrada
  Real:: xf, yf, tf      !Salida
    
  !Ingreso de datos
!  write(*,*) 'Ingrese el angulo de lanzamiento en grados (Valores Reales)'
! read *, ang
!  write(*,*) 'Ingrese la velocidad inicial (Valores Reales)'
!  read *, vi
  write (*,*) 'Ingrese posicion en "x" , "y", "Vo" y Angulo'
  read *, xi, yi ,vi, ang
       
  call nFric (xi,yi,vi,ang,xf,yf,tf)
  
  PRINT *, "----------------------------------------------"
  PRINT *, "Con una velocidad inicial de", vi, "m/s"
  PRINT *, "Y un angulo de", ang, "radianes respecto al piso"
  PRINT *, "----------------------------------------------"
  PRINT *, "              Sin Friccion"
  PRINT *, "El tiempo total de vuelo es:", tf, "s"
  PRINT *, "La altura maxima alcanzada es:", yf, "m"
  PRINT *, "Tiene un alcance de:", xf, "m"
  PRINT *, "----------------------------------------------"
end program proyectil
