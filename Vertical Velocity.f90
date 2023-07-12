program vertivel

integer:: i,j,k
real::p(11), u(21,16,11),v(21,16,11),dudx(21,16,11),dvdy(21,16,11)
real::Div(21,16,11),vort(21,16,11),omega(21,16,11),DivC(21,16,11),omegaC(21,16,11)

open(10,file='pressure_levels.dat',status='old')
open(20,file='uin.dat',status='old')
open(30,file='vin.dat',status='old')
open(40,file='out.dat',status='new')

do k =1,11
   read(10,*)p(k)
   p(k)=p(k)*100
   do i=1,16
   read(20,*)(u(j,i,k),j=1,21)     
     read(30,*)(v(j,i,k),j=1,21)
  end do
end do

do k=1,11
   do  i=2,15
     do  j=2,20
      dudx(j,i,k)=(u(j+1,i,k)-u(j-1,i,k))/(2*2*3.1416*6371*(1000/360)) 	
      end do	     
end do
   
do i=2,15
   do  j=2,20
      dvdy(j,i,k)=(v(j,i+1,k)-v(j,i-1,k))/(2*2*3.1416*6371*(1000/360))
      end do  
  end do  
end do

do k=1,11
   do  i=2,15
     do j=2,20
      Div(j,i,k)= dudx(j,i,k) + dvdy(j,i,k)
      vort(j,i,k)= dvdy(j,i,k) - dudx(j,i,k)
      end do
      print*,'Vorticity (/s)  ', (vort(j,i,k),j=2,20)																   	                                                        	   
  end do
end do

do k=2,11
  do  i=2,15
    do  j=2,20     
	 omega(j,i,1)=0
     omega(j,i,k)= omega(j,i,k-1) - ((Div(j,i,k))*(p(k)-p(k-1))/2)    
	 end do  
  end do
end do

do k=1,10
  do i=2,15
    do j=2,20
     DivC(j,i,k) = Div(j,i,k)-(omega(j,i,11)/(p(k)-p(11)))   
     end do
    print*,'Corrected Divergence (/s) ', (DivC(j,i,k),j=2,20)	    
  end do
end do

do k=2,11
  do i=2,15
    do j=2,20 
    omegaC(j,i,1)=0
    omegaC(j,i,k) = omegaC(j,i,k-1) - ((DivC(j,i,k)*(p(k)-p(k-1)))/2)  
    end do
  print*,'Corrected vertical velocity (m/s) ',(omegaC(j,i,k),j=2,20) 
 end do
end do

close(50)
close(40)
close(30)
close(20)
close(10)
end program vertivel
















