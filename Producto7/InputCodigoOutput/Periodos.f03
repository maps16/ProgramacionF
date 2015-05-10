Module Conteo

  Implicit None
  Integer, Parameter :: Dat=7632 !Numeros de datos Totales
  Integer, Parameter :: Mes=1440 !Datos en un Mes
  Integer, Parameter :: Dias=159 !Numero de dias
  Integer, Parameter :: Day= 48  !Datos en un Dia
  Integer, Parameter :: Mdia=24  !Datos en medio dia
  Integer, Parameter :: MCo=5760 !Datos de los meses Completos

End Module Conteo

Program Periodos
  
  Use Conteo
  Implicit None
  Real,Dimension(Dat) :: T, Alt, Doy, Dyt, PeM, PeD, PeMD
  Real:: Maxm, Tmaxm, Minm, Tminm  
  Real:: Maxd, Tmaxd, Mind, Tmind
  Real:: Maxmd, Tmaxmd
  Real,Dimension(1:5):: Ti, Al
  Real, Dimension(1:Dias):: Tie, A
  Real, Dimension(1:2*Dias):: Tim, Hei
  Integer:: i, j


  Open(2, File="Mareas.csv")
  Open(3, File="Marea.dat", Status="Replace")
  Do i=1, Dat, 1
     Read(2,*) T(i), Alt(i), Doy(i), Dyt(i)
     Write(3,2) Dyt(i), Alt(i)
  End Do
  Close(2)
  Close(3)
  
  !Claculo de Maximos y Minimos por mes  
  Open(4, File="MaxMes.dat")
  Open(8, File="MinMes.dat")
  Do j=0, MCo, Mes
     Maxm=-1
     Do i=1, Mes, 1
        If(Alt(i+j)>Maxm) Then
           Maxm=Alt(i+j)
           Tmaxm=Dyt(i+j)
        End If
     End Do
     Write(4,2) Tmaxm, Maxm
  End Do

  Do j=0, MCo, Mes
     Minm=0
     Do i=1, Mes, 1
        If(Alt(i+j)<Minm) Then
           Minm=Alt(i+j)
           Tminm=Dyt(i+j)
        End If
     End Do
     Write(8,2) Tminm, Minm
  End Do
  Close(4)
  Close(8)
!Calculo de Maximos y Minimos por dia
  Open (5, File="MaxDias.dat")
  Open (9, File="MinDias.dat")
  Do j=0,Dat-1 , Day
     Maxd=-1
     Do i=1, Day, 1
        If(Alt(i+j)>Maxd) Then
           Maxd=Alt(i+j)
           Tmaxd=Dyt(i+j)
        End If
     End Do
     Write(5,2) Tmaxd, Maxd
  End Do

  Do j=0, Dat-1, Day
     Mind=0
     Do i=1, Day, 1
        If(Alt(i+j)<Mind) Then
           Mind=Alt(i+j)
           Tmind=Dyt(i+j)
        End If
     End Do
     Write(9,2) Tmind, Mind
  End Do

  Close(5)
  Close(9)
!Calculo de periodos

  Open(6, File="MaxMes.dat")
  Open(7, File="MaxDias.dat")
  Open(10, File= "Salida Principal.dat")
  

  Do i=1,5, 1 
     Read(6,*) Ti(i), Al(i)
     If(i>1) Then
        PeM(i)= Ti(i)-Ti(i-1)	
     End If
  End Do
  Write(10,*) "Ciclo Lunar:",Sum(PeM)/4 , "Dias"


  Do i=1 , Dias, 1
     Read(7,*) Tie(i), A(i)
     If(i>1) Then
       PeD(i)=Tie(i)-Tie(i-1)
     End If
  End Do

  Write(10,*) "Marea Diurna:", (Sum(PeD))/(Dias-1), "Dias"

 Close (6)
 Close (7)


!Calculo para mareas Semidiurna
 Open(11, File="SDiurna.dat")
  
 Do j=0, Dat-1, MDia
  Maxmd=-1
  Do i=1, Mdia, 1
    If(Alt(i+j)>Maxmd) Then
      Maxmd=Alt(i+j)
      Tmaxmd= Dyt(i+j)
    End If
  End Do
  Write(11,2) Tmaxmd, Maxmd
 End Do

 Close (11)
 Open(12, File="SDiurna.dat")
 !Calculo Periodo SDiurna
 Do i=1, 2*Dias, 1
   Read(12,*) Tim(i), Hei(i)
   If(i>1) Then
     PeMD(i)=Tim(i)-Tim(i-1)
   End If
 End Do
 Write(10,*) "Marea Semidiurna:", Sum(PeMD)/((2*Dias)-1), "Dias"
 
 Close (10)
  2 Format(2F10.2)
End Program Periodos
