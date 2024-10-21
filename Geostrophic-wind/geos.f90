program geos
integer::i,j,k
real::z(17,15,4),d,g,b(15),e(17,15,4),ug(15,17,4),vg(15,17,4),dudy(15,17,4),dvdx(15,17,4)
open(15,file='zdata.dat')
open(16,file='gvout.dat')
open(17,file='ugout.dat')
open(18,file='vgout.dat')
do k=1,4
do i=1,15
read(15,*)(z(j,i,k),j=1,17)
end do
end do
d=277500.0 ! we have assumed equal grid length, dx=dy=d
g=9.8
do k =1,4
do i =2,14
b(i)= 9.8/(0.0014584*sin(2.5*i)) !Calculation of zonal and meridional
!geostrophic wind.
do j=2,16
ug(j,i,k)= -b(i)*(z(j,i+1,k)-z(j,i-1,k))/(2.0*d)
vg(j,i,k)= b(i)*(z(j+1,i,k)-z(j-1,i,k))/(2.0*d)
dvdx(j,i,k)=(vg(j+1,i,k)-vg(j-1,i,k))
dudy(j,i,k)=(ug(j,i+1,k)-ug(j,i-1,k))
e(j,i,k)=dvdx(j,i,k)-dudy(j,i,k) !Calculation of geostrophic vorticity
end do
end do
end do
do i=2,14
write(16,*)(e(j,i,3),j=2,16)
write(17,*)(ug(j,i,3),j=2,16)
write(18,*)(vg(j,i,3),j=2,16)
end do
end program geos