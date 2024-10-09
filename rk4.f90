function f(y)
f=0.00134*y+0.005
end function f

program rk
 integer::i,j,k
 real::y(32,35,14),s1(32,35,14),s2(32,35,14),s3(32,35,14),s4(32,35,14),f,h

 open(1,file='Mintemp.TXT')
 open(2,file='rk4finalout.TXT')

 do i=1,32
  read(1,*)(y(i,j,1),j=1,35)
 end do

 h=30 
do k=1,13
 do i=1,32
  do j=1,35 
     if(y(i,j,k).LT.0)then
	  y(i,j,k)=y(i,j,k)*y(i,j,k)*0
      y(i,j,k+1)=y(i,j,k+1)*y(i,j,k+1)*0
      else 
      s1(i,j,k)=f(y(i,j,k))
      s2(i,j,k)=f(y(i,j,k)+(s1(i,j,k)*0.5*h))
      s3(i,j,k)=f(y(i,j,k)+(s2(i,j,k)*0.5*h))
      s4(i,j,k)=f(y(i,j,k)+(s3(i,j,k)*h))
      y(i,j,k+1)=y(i,j,k)+(s1(i,j,k)+2*s2(i,j,k)+2*s3(i,j,k)+s4(i,j,k))*h/6
      y(i,j,k)=y(i,j,k+1)
      endif
   end do
 end do
end do

do i=1,32
write(2,*)(y(i,j,14),j=1,35)
end do
end program rk
