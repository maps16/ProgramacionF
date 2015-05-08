Module Conteo

  Implicit None
  Integer, Parameter :: Dat=7632 !Numeros de datos Totales
  Integer, Parameter :: Mes=1440 !Datos en un Mes
  Integer, Parameter :: Dias=159 !Numero de dias
  Integer, Parameter :: Day= 48  !Datos en un Dia
  Integer, Parameter :: Mdia=24  !Datos en medio dia
  Integer, Parameter :: MCo=7200 !Datos de los meses Completos

End Module Conteo

Program Periodos
  
  Use Conteo
  Implicit None
  Real,Dimension(Dat) :: T, Alt, Doy, Dyt
  Real:: Max, Tmax
  Integer:: i, j

!Lectura de Archivo y Creacion De Marea.dat Graficar la Marea
  Open(2, File="Mareas.csv")
  Open(3, File="Marea.dat", Status="Replace")
  Do i=1, Dat, 1
     Read(2,*) T(i), Alt(i), Doy(i), Dyt(i)
     Write(3,2) Dyt(i), Alt(i)
  End Do
  Close(2)
  Close(3)
  
!Claculo de Maximos por mes  
  Open(4, File="MaxMes.dat", Status="Replace")
  Do j=0, MCom, Mes
     Max=-1
     Do i=1, Mes, 1
        If(Alt(i+j)>Max) Then
           Max=Alt(i+j)
           Tmax=Dyt(i+j)
        End If
     End Do
     Write(4,2) Tmax, Max
  End Do
  Close(4)
  
  Open (5, File="MaxDias.dat")
  


  Close(5)



  2 Format(2F10.2)
End Program Periodos
