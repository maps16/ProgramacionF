Module Datos

  Integer, Parameter:: Dat=7632

End Module Datos


Program Mareas
  Use Datos
  Implicit none
  Real, dimension (Dat):: Altura, Tiempo, Doy, DoyT
  Integer :: i
  Real :: Cond, Max1, Min1, Tiempo1M
  Real :: Max2, Min2, Tiempo2M 
  Real :: Max3, Min3, Tiempo3M 
  Real :: Max4, Min4, Tiempo4M 
  Real :: Max5, Min5, Tiempo5M 
  Real :: PMensM, P1MensM, P2MensM, P3MensM, P4MensM, P5MensM

!Lectura de Archivo
  Open (1,file="Mareas.csv")

  Do i=1,7632
     Read (1,*) Tiempo(i), Altura(i), Doy(i), DoyT(i)
  End Do
  close (1)

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


!------------------------------------------------------------------------------------------------------------------------------------------------------
  
  !Calculo de Periodo de marea alta y Baja por mes  
  
  P1MensM=Tiempo1M
  P2MensM=Tiempo2M-Tiempo1M
  P3MensM=Tiempo3M-Tiempo2M
  P4MensM=Tiempo4M-Tiempo3M
  P5MensM=Tiempo5M-Tiempo4M
  PMensM=(P1MensM+P2MensM+P3MensM+P4MensM+P5MensM)/5
  
  Write(*,*)"==============================================================================================================="
  Write(*,*)"Periodo Mes1      Periodo Mes2      Periodo Mes3     Periodo Mes4     Periodo Mes5     Periodo Total  "
  Write(*,*) P1MensM, P2MensM , P3MensM , P4MensM , P5MensM, PMensM, "Maximo"
  Write(*,*)"==============================================================================================================="
  
end program Mareas
