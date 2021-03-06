!===================================================================
!Este programa calcula el tiro parabolico con resistencia en el aire
!===================================================================
!===================================================================
MODULE cons

  Real , parameter :: grad =(4*atan(1.0))/180
  Real , parameter :: pi=4*atan(1.0)
  Integer , parameter :: ntps = 6000
  Real , parameter :: g = 9.806

  Real , parameter :: DAire = 1.29 !Densidad del aire
  Real , parameter :: Csphere = 0.47
END MODULE cons
!===================================================================
subroutine nFric (xi,yi,vi,ang,xnf,ynf,tnf)
 
  USE cons
  IMPLICIT NONE
  Integer :: i 
  Real, Dimension (1:ntps) :: x,y,t
  Real :: xi, yi, vi, ang,rad    !Variables externas
  Real :: xnf, ynf, tnf    !Variables internas

  rad = ang*grad !conversion Grad-Rad
  t=0
  x=0
  y=0

  OPEN (1, FILE = "nfric.dat")

  DO i=1,ntps,1

    IF (ang==0) THEN
	y(i)= yi 
	t(i)= 0	
	x(i) =0
        EXIT
    ELSE IF (ang==90) THEN
	t(i)= float(i)*0.01
	x(i)= 0
	y(i)= yi + (vi * sin(rad) *t(i)) - (0.5*g*t(i)*t(i))
    ELSE 
	t(i)= float(i)*0.01
	x(i)= xi + (vi * cos(rad) *t(i))
	y(i)= yi + (vi * sin(rad) *t(i)) - (0.5*g*t(i)*t(i))
    END IF     
     
     write (1,1001) x(i), y(i)
     1001 format (f11.5,f11.5)
 

  IF (y(i)<0) EXIT
     
  END DO

  CLOSE (1)
  tnf = MAXVAL(t)
  xnf = MAXVAL(x)
  ynf = MAXVAL(y)

end subroutine nFric
!===================================================================
subroutine Fric (xi,yi,vi,ang,xf, yf, tf)
	
	USE cons
	IMPLICIT NONE
	integer :: i
	REAL, DIMENSION (0:ntps) :: ax, dy, ct, velax, velby, aax, aby
	Real :: xi, yi , vi, ang, rad !Entrada
	Real :: xf, yf, tf  !Salida
	Real :: area , radio, masa , ad
	
	Print *, 'Ingrese la masa del objeto (kg)'
	Read *, masa
	Print *, 'Ingrese el radio del proyectil'
	Read *, radio
	area= pi*radio*radio
	rad = ang*grad
	!do i=0 , ntps ,1	! Ignorar
		!by(i)=0        ! Debug Problema  con los valores dentro del array
	!end do			! No hacer caso a esto
	
	ax(0) = xi
	dy(0) = 0
	velax(0) = vi*cos(rad)
	velby(0) = vi*sin(rad)
	ad = (0.5*DAire*Csphere*area)/masa
	aax(0) = -ad*velax(0)*velax(0)
	aby(0) = -g-(ad*velby(0)*velby(0))
	ct(0) = 0

	OPEN(2, FILE="Fric.dat")
	write (2,1001) ax(0), dy(0)
	1001 format (f11.5,f11.5)

	DO i=0, ntps, 1
          IF (ang==0) THEN
	    ct(i+1) = 0
	    ax(i+1) = 0 
            dy(i+1) = 0
            EXIT
          ELSE IF (ang==90) THEN
	    ct(i+1) = ct(i)+0.01
	    velby(i+1) = velby(i)+ aby(i)*ct(i+1)
	    aby(i+1) = -g-(ad*velby(i)*velby(i))
	    ax(i+1) = 0 
	    dy(i+1) = dy(i)+ velby(i)*ct(i+1)+ (0.5*aby(i)*ct(i+1)*ct(i+1))
          ELSE 
	    ct(i+1) = ct(i)+0.01
	    velax(i+1) = velax(i)+ aax(i)*ct(i+1)
	    velby(i+1) = velby(i)+ aby(i)*ct(i+1)
	    aax(i+1) = -ad*velax(i)*velax(i)
	    aby(i+1) = -g-(ad*velby(i)*velby(i))
	    ax(i+1) = ax(i)+ velax(i)*ct(i+1)+ (0.5*aax(i)*ct(i+1)*ct(i+1))
	    dy(i+1) = dy(i)+ velby(i)*ct(i+1)+ (0.5*aby(i)*ct(i+1)*ct(i+1))
          END IF     
	    	
	  write (2,1001) ax(i+1), dy(i+1)
	  IF (dy(i+1)<0) EXIT
	END DO
	
	CLOSE(2)
	xf = ax(i+1)
	yf = MAXVAL(dy)
	tf = ct(i+1) * 10.0
        
	!do i=0 , ntps ,1		Ignorar
		!print *, dy(i+1)	Debug Problemas con el array
	!end do				No hecer caso a esto 
	
end subroutine Fric
!===================================================================
program proyectil
  use cons
  implicit none
  !Declaración
  Real:: xi, yi, vi, ang !Entrada
  Real:: xnf, ynf, tnf, xf, yf, tf      !Salida
  Real:: error, ag
  PRINT *, "=========================================================="
  PRINT *, "Este programa calcula el tiro parabolico con resistencia "
  PRINT *, "Eliminar los Archivos nfric.dat y Fric.dat cada vez que"
  PRINT *, "que utilice el codigo "
  PRINT *, "=========================================================="
  PRINT *, "y sin resistencia de un objeto esferico"  

  write (*,*) 'Ingrese posicion en "x","y","Vo" y Angulo'
  read *, xi, yi ,vi, ang
  ag=ang     
  call nFric (xi, yi, vi, ang, xnf, ynf, tnf)
  call Fric (xi, yi, vi, ang, xf, yf, tf)
 
  error= ((xnf-xf)/xnf) * 100.0

  PRINT *, "=========================================================="
  PRINT *, "Eliminar los Archivos nfric.dat y Fric.dat cada vez que"
  PRINT *, "que utilice el codigo "
  PRINT *, "=========================================================="
  PRINT *, "Posicion inicial del tiro: x=", xi,", y=",yi
  PRINT *, "Con una velocidad inicial de", vi, "m/s"
  PRINT *, "Angulo de", ang, "radianes o ", ag ,"grados respecto al piso"
  PRINT *, "=========================================================="
  PRINT *, "              Sin Friccion"
  PRINT *, "El tiempo total de vuelo es:", tnf, "s"
  PRINT *, "La altura maxima alcanzada es:", ynf, "m"
  PRINT *, "Tiene un alcance de:", xnf, "m"
  PRINT *, "=========================================================="
  PRINT *, "              Con Friccion"
  PRINT *, "El tiempo total de vuelo es:", tf, "s"
  PRINT *, "La altura maxima alcanzada es:", yf, "m"
  PRINT *, "Tiene un alcance de:", xf, "m"
  PRINT *, "=========================================================="
  PRINT *, "La diferencia porcentual entre ambos tiros es", error, "%"
end program proyectil
