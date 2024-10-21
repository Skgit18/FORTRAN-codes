program divort
integer:: i,j,k
real::p(11), u(21,16,11),v(21,16,11),dudx(21,16,11),dvdy(21,16,11)
real::Div(21,16,11),vort(21,16,11)

open(10,file='pressure_levels.dat')
open(20,file='uin.dat')
open(30,file='vin.dat')
open(40,file='out.dat')

do k =1,11
  read(10,*)p(k)
  p(k)=p(k)*100
    do i=1,16
    read(20,*)(u(j,i,k),j=1,21)
      read(30,*)(v(j,i,k),j=1,21)
    end do
end do

do k=1,11
  do i=2,15
    do j=2,20
    dudx(j,i,k)=(u(j+1,i,k)-u(j-1,i,k))/(2*2*3.1416*6371*(1000/360))
    dvdy(j,i,k)=(v(j,i+1,k)-v(j,i-1,k))/(2*2*3.1416*6371*(1000/360))
    Div(j,i,k)= dudx(j,i,k) + dvdy(j,i,k)
    vort(j,i,k)= dvdy(j,i,k) - dudx(j,i,k)
    end do
    write(40,*)'Divergence (/s) ', (Div(j,i,k),j=2,20)
    write(40,*)'Vorticity (/s) ', (vort(j,i,k),j=2,20)
  end do
end do

end program divort
