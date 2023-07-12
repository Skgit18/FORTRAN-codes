program velpo
integer::i,j,k,n
real::u(100,100,4),v(100,100,4),d, g
real::dudx(100,100,4),dvdy(100,100,4),div(100,100,4),chi(100,100,5),r(100,100,5)
open(15,file='u.dat')
open(16,file='v.dat')
open(17,file='vout.dat')
do k=1,4
do i=35,5,-2 !Problem consists of 2 degree x 2 degree grid,
read(15,*)(u(j,i,k),j=60,100,2) !hence increment/decrement of 2 is given in the loop.
read(16,*)(v(j,i,k),j=60,100,2)
end do
end do
d=222000.0 ! we have assumed equal grid length, dx=dy=d
g=9.81
do k=1,4 !Calculation of divergence from
do i=33,7,-2 !zonal and meridional wind
do j=62,98,2
dudx(j,i,k)=(u(j+2,i,k)-u(j-2,i,k))/(2.0*d)
dvdy(j,i,k)=(v(j,i+2,k)-v(j,i-2,k))/(2.0*d)
div(j,i,k)=dudx(j,i,k) + dvdy(j,i,k)
end do
end do
end do
do i=35,5,-2 !Calculation of velocity potential(chi)
do j=60,100,2 !by relaxation method
chi(j,i,1)=0.0
end do
end do
do k=1,4
do i=33,7,-2
do j=62,98,2
do n=1,4
r(j,i,n) = chi(j,i+2,n) + chi(j,i-2,n) + chi(j+2,i,n) + chi(j+2,i,n) + 4.0*chi(j,i,n) + div(j,i,k)*(d**2.0)
chi(j,i,n+1)=chi(j,i,n)+(r(j,i,n)/4.0)
end do
end do
end do
do i=33,7,-2
write(17,*)(chi(j,i,5),j=62,98,2)
end do
end do
end program velpo