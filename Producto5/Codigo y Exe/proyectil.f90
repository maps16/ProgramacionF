!=======================================================================================
!  Este programa te permitira graficar el movimeinto de un proyectil en un sistema ideal
!                        Calcula "x" y "y" en intervalos de tiempo de 0.01 segundos
!=======================================================================================

subroutine posicionx(v,radian,j,m,n,vx,vy,ti)
  
  implicit none
  Real, parameter:: g = 9.81
  Real:: m 
  Real:: n
  Real:: vx
  Real:: vy
  Real:: v, radian, ti
  integer:: j

  ti= (float(j)*0.01)
  vx= v*cos(radian)
  vy= v*sin(radian)
  m = vx*ti
  n = vy*ti-0.5*g*ti*ti

end subroutine posicionx


program proyectil
  implicit none
  !Declaración de constantes
  real , parameter :: pi=4.0*atan(1.0)
  integer, parameter :: ntps =300
  real :: iv , rad , t , a, x, y, vx, vy, xmax, ymax
  real , parameter:: g=9.81 !gravedad
  real :: S(ntps), R(ntps)
  integer :: i
  !pi es pi y g es la gravedad
  !iv  Velocidad inicial
  !rad Angulo en radianes y "a" es el Angulo en grados
  !t Tiempo
  !"x" y "y" Donde se organizara la informacion de salida
  
  !Ingreso de datos por usuario
  write(*,*) 'Ingrese el angulo de lanzamiento en grados (Valores Reales)'
  read *, a
  write(*,*) 'Ingrese la velocidad inicial (Valores Reales)'
  read *, iv
  !transformar angulo a radianes

  rad = (a*pi)/180.0

  !Abrir archivo de salida de datos
  open (1,file='proyectil.dat')
 
 do i=1,ntps
  
     call posicionx(iv, rad, i, x, y,vx,vy,t)
     
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
!  print *, rad , vx, vy ! DEBUG
end program proyectil
