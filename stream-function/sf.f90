$debug
program stream

integer::i,j,k,n
real::z(17,15,4),d,g,b(15),e(17,15,4),s(17,15,502),r(17,15,500)

open(15,file='zdata.dat')
open(20,file='sout.dat')

do k=1,4
do i=15,1,-1
  read(15,*)(z(j,i,k),j=1,17)
end do
end do

d=277500.0				 !we assumed grid length is equal, dx=dy
g=9.8

!calculation of vorticity using geopotential height data and from that stream function

 do k=1,4
  do i=14,2,-1
    b(i)= 9.8/(2*7.2*0.0001*sin(2.5*i))
    do j=2,16 
	  e(j,i,k) = (z(j,i+1,k) + z(j,i-1,k) + z(j+1,i,k) + z(j-1,i,k) - 4.0*z(j,i,k))*(b(i)/(d**2))
      do n=1,500
      s(j,i,1)=0.0
      r(j,i,n) = s(j,i+1,n) + s(j,i-1,n) + s(j+1,i,n) + s(j-1,i,n) - 4.0*s(j,i,n) - e(j,i,k)*(d**2)
      s(j,i,n+1)=s(j,i,n)+(r(j,i,n)/4)
     end do
    end do
  end do

!value stream function is in m**2/sec.
  do i=14,2,-1
    write(20,*)(s(j,i,5),j=2,16)
  end do
end do

end program stream
