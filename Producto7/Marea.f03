Module Datos

  Integer, Parameter:: Dat=7632

End Module Datos


Program Mareas
  Use Datos
  Implicit none
  Real, dimension (Dat):: Altura, Tiempo, Doy, DoyT
  Real, Dimension (5):: MAXI, Tiem
  Integer :: i
  Real :: Cond, Max1, Min1, Tiempo1M
  Real :: Max2, Min2, Tiempo2M 
  Real :: Max3, Min3, Tiempo3M 
  Real :: Max4, Min4, Tiempo4M 
  Real :: Max5, Min5, Tiempo5M 
  Real :: PMensM, P1MensM, P2MensM, P3MensM, P4MensM, P5MensM

!Lectura de Archivo
  Open (Unit=100,file="Mareas.csv")

  Do i=1,7632
     Read (100,*) Tiempo(i), Altura(i), Doy(i), DoyT(i)
  End Do
  close (100)

!Calculo Max y Min Por Mes
  Max1 = 0
  Do i=1,1440
     Cond = Max1-Altura(i)
     If (Cond<0) Then 
        Max1 = Altura(i)
        Tiempo1M= i/48
     End If
  End Do

  Max2=0
  Do i=1441,2881
     Cond=Max2-Altura(i)
     If(Cond<0) Then
        Max2 = Altura(i)
        Tiempo2M = i/48
     End If
  End Do

  Max3=0
  Do i=2882,4322
     Cond=Max3-Altura(i)
     If(Cond<0) Then
        Max3 = Altura(i)
        Tiempo3M = i/48
     End If
  End Do
  
  Max4=0
  Do i=4333,5773
     Cond=Max4-Altura(i)
     If(Cond<0) Then
        Max4 = Altura(i)
        Tiempo4M = i/48
     End If
  End Do
  
 
  Max5=0
  Do i=5774,7214
     Cond=Max5-Altura(i)
     If(Cond<0) Then
        Max5 = Altura(i)
        Tiempo5M = i/48
     End If
  End Do
Open(Unit=11, File="Maximo.dat")
MAXI(1)=Max1
MAXI(2)=Max2
MAXI(3)=Max3
MAXI(4)=Max4
MAXI(5)=Max5
Tiem(1)=Tiempo1M
Tiem(2)=Tiempo2M
Tiem(3)=Tiempo3M
Tiem(4)=Tiempo4M
Tiem(5)=Tiempo5M

Do i=1, 5,1
Write(11,1) Tiem(i), MAXI(i)
End Do
Close(11)
  
  !Calculo de Periodo de marea alta y Baja por mes  
  
  P1MensM=Tiempo1M
  P2MensM=Tiempo2M-Tiempo1M
  P3MensM=Tiempo3M-Tiempo2M
  P4MensM=Tiempo4M-Tiempo3M
  P5MensM=Tiempo5M-Tiempo4M
  PMensM=(P1MensM+P2MensM+P3MensM+P4MensM+P5MensM)/5
  Open(Unit=10, File="Periodos.dat")
  Write(*,*)"==============================================================================================================="
  Write(*,*)"Periodo Mes1      Periodo Mes2      Periodo Mes3     Periodo Mes4     Periodo Mes5     Periodo Total  "
  Write(*,*) P1MensM, P2MensM , P3MensM , P4MensM , P5MensM, PMensM
  Write(*,*)"==============================================================================================================="
  Write(10,*)"Periodo Mes1      Periodo Mes2      Periodo Mes3     Periodo Mes4     Periodo Mes5     Periodo Total  "
  Write(10,*) P1MensM, P2MensM , P3MensM , P4MensM , P5MensM, PMensM

1 Format (2F10.2)
end program Mareas
