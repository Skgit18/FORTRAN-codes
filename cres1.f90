$debug
program cresmann

integer::i,k,x,y
real::lat(221),long(221), h(221),xa(40,100),xb(40,100)
real::dx,dy,gh(221),d(40,100,221),w,num,temp

open(10,file = 'Gheight.dat')
r =300000.0
k=1

do i=1,221
  read(10,*)lat(i),long(i),h(i)
end do

do x  = 40,5,-1
  do y  = 100,60,-1
   k=0.0 
    do i=1,221
     	dx = abs(lat(i)-x)
        dy = abs(long(i)-y)
100  if(k .GE. 0.0)then
         d(x,y,i)= 111000.0*sqrt(dx**2+dy**2)
         w= max(0.0,(r**2-d(x,y,i)**2)/(r**2+d(x,y,i)**2))

     	 gh(i)=0.0
         xb(x,y)=0.0
	  
	     num = num + w*(h(i)-gh(i))
         temp = temp + w
   	
       xa(x,y) = xb(x,y) + (num/temp)
       xb(x,y) = xa(x,y)
	   gh(i) = xa(x,y)
      endif 
	end do
	
	k=k+1
	
	if(k .LT. 5)then
	goto 100
	else
	print*,xa(x,y)
	endif
  end do
end do

stop
end program cresmann
