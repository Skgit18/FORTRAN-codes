program cress
integer::i,itr
real::lat(221),long(221),h(221),d(100,100,2210),w,r,sumwt,hb(22100),gh(100,100)
real::num,xa(100,100),xb(100,100),lat1(221),lat2(221),long1(221),long2(221)
open(10,file = 'Gheight.dat')
do i=1,221
read(10,*)lat(i),long(i),h(i)
end do
do x =5,40
do y = 60,100
gh(x,y)=0.0
xb(x,y)=0.0
end do
end do
do x =5,39
do y = 60,99
do i=1,221
d(x,y,i)=111000.0*sqrt((x-lat(i))**2 + (y-long(i))**2)
if(lat(i) .GE. x .and. lat(i) .LE. x+1) then
lat1(i) = x
lat2(i) = x+1
elseif (d(x,y,i) .LE. 200000.0) then
lat1(i) = lat(i)
lat2(i) = lat(i)
endif
if(long(i) .GE. y .and. long(i) .LE. y+1) then
long1(i) = y
long2(i) = y+1
elseif (d(x,y,i) .LE. 200000.0) then
long1(i) = long(i)
long2(i) = long(i)
endif
itr=0
200 if(itr .GE. 0)then
sumwt=0.0
sumnum=0.0
r=300000.0
w=max(0.0,(r**2-d(x,y,i)**2)/(r**2-d(x,y,i)**2))
sumwt = sumwt +w
hb(i) = (gh(lat1(i),long1(i)) + gh(lat2(i),long1(i)) + &
&gh(lat1(i),long2(i)) + gh(lat2(i),long2(i)))/4.0
num = num + w*(h(i)-hb(i))18 | P a g e
if(w .EQ. 0.0)then
xa(x,y) =0.0
else
xa(x,y) = xb(x,y) + (sumnum/sumwt)
endif
xb(x,y) = xa(x,y)
gh(x,y) = xa(x,y)
endif
end do
itr =itr + 1
r = r - 50000.0
if(itr .LT. 3)then
goto 200
else
print*,xa(x,y)
endif
end do
end do
end program cress
