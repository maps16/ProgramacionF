PROGRAM Lector

    IMPLICIT NONE
    REAL, Dimension (8000) :: a, b
    INTEGER :: i, sta_t
    WRITE (*,*) "======================"
    OPEN (2, FILE="AmareaT.csv", STATUS="old", IOSTAT=sta_t)
    WRITE (*,*) "======================"
    DO i=1, 8000, 1
    IF(sta_t < 0) EXIT
    READ(2,*) a(i), b(i)
    
    IF(sta_t < 0) EXIT
    END DO
    
    !WRITE (*,10) a
    WRITE (*,*) "======================"
    !WRITE (*,10) b
    !10 Format (F2.3)
    CLOSE(2)


END PROGRAM Lector
