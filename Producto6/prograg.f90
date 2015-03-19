!===================================================================
!Este programa calcula el tiro parabolico con resistencia en el aire
!===================================================================
MODULE cons

  Real , parameter :: rad =(4*atan(1.0))/180
  Real , parameter :: pi=4*atan(1.0)
  Integer , parameter :: ntps = 3000
 
  Real , parameter :: DAire = 1.29 !Densidad del aire

END MODULE cons

subroutine SnFric (xi,yi,vi,ang,xf,yf,tf)
  
  implicit none
  use cons
  Integer :: i
  Real , DIMENSION (1,ntps) :: x, y, t
  Real:: xi, yi, vi, ang !Entrada
  Real:: xf, yf, tf      !Salida

  ang = ang*rad !conversion
  
  
end subroutine SnFric

program proyectil
  implicit none
  !Declaración
  use cons
  Real :: a, iv
  Real , Dimension(1,ntps):: x, y, z,
    
  !Ingreso de datos
  write(*,*) 'Ingrese el angulo de lanzamiento en grados (Valores Reales)'
  read *, a
  write(*,*) 'Ingrese la velocidad inicial (Valores Reales)'
  read *, iv
  write (*,*) 'Posicion en "x" y "y"'
  
  !transformar angulo a radianes y transformacion de velocidad
  rad = (a*pi)/180.0
  
  !Abrir archivo de salida de datos
  open (1,file='proyectil.dat')
  
  do i=1,ntps
     
     call posicion()
     
     if (a==90) then
	S(i)=0 !Un tiro en 90 grados no posee movimiento en x ya que vx tiene que ser 0 (vx=v*cos(90°)=0)
     else if(a==0) then
        S(i)=0 !No existe movimento en este caso titro de 0°
        t=0
     else
	S(i)= x
     end if
     R(i)= y
     
     !escribir en proyectil.dat
     write(1,*) S(i), R(i)
     !Forzar salida para casos especiales cuando y es menor que 0
     if (R(i)<0) exit
     
  end do
  close(1)
  !Se cerro el archivo
  
  ymax= (vy*vy)/(2*g)
  xmax= S(i)
    
  print *, '==========================================='
  print *, 'Velocidad inicial:', iv, 'm/s'
  print *, 'Angulo de tiro:', a, 'grados'
  print *, 'Tiempo total de vuelo', t , 's'
  print *, 'La altura maxima:', ymax, 'm'
  print *, 'Alcance del tiro:' , xmax, 'm'
  print *, '==========================================='
end program proyectil
