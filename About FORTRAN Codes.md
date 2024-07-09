# FORTRAN-codes
This repository has FORTRAN programs written during my Master's coursework.
Each program focuses on basic concepts from Dynamic Meteorology.

1. Computation of divergence and vorticity using finite difference technique (divort.f90)

2. Computation of vertical velocity using the equation of continuity (vertivel.f90)

3. Objective analysis of geopotential height by Cressman method (cressman.f90)

4. Solution of the ordinary differential equation using Fourth order Runge – Kutta method (rk4.f90)

5. Computation of stream function from geopotential field using Relaxation method Stream Function (sf.f90)

6. Computation of Velocity potential using observed or reanalysis wind data (velout.f90)
   
7. Computation of geostrophic wind and geostrophic vorticity using geopotential height (geos.f90)


Description of each program.


**1. Computation of divergence and vorticity using finite difference technique (divort.f90)**

Compute divergence and vorticity using finite difference scheme from u and v grid point data given. Print estimated values of divergence and vorticity at the 5th level.

Horizontal divergence is given by
  
$D = \frac{\partial u}{\partial x} + \frac{\partial v}{\partial y}$

Vorticity is given by

$\zeta = \frac{\partial v}{\partial x} - \frac{\partial u}{\partial y}$

With u, v at grid points, divergence, and vorticity can be estimated.
The estimation is carried out by finite difference approximations.
The divergence at point (x, y) can be estimated as follows,
	
$\frac{\partial u}{\partial x} + \frac{\partial v}{\partial y} = \frac{u(x+d) - u(x-d)}{2d} + \frac{v(y+d) - v(y-d)}{2d}$



**2. Computation of vertical velocity using the equation of continuity (vertivel.f90)**

Compute divergence and vorticity using finite difference scheme from u and v grid point data given and then compute vertical velocity from divergence using the continuity equation. Vertical velocity is computed using both uncorrected and bias-corrected divergence. Print estimated values of vertical velocity at the 5th level.

Vertical wind fields can be derived from horizontal wind fields based on the continuity equation.
The continuity equation is given as
	
$\frac{\partial w}{\partial p}=-(\ \frac{\partial u}{\partial x}+\frac{\partial v}{\partial x})$

This can also be written as

$w(p) = w(p_s) + (p_s - p) \left( \frac{\partial \langle u \rangle}{\partial x} + \frac{\partial \langle v \rangle}{\partial x} \right)$

Where, $\langle \rangle = (p - p_s) \int_{a}^{b} (\ )$ is pressure-weighted vertical average.



**3. Objective analysis of geopotential height by Cressman method (cressman.f90)**

Starting with a reasonable first guess and available data at observation points, the method proceeds by scanning and correcting the field several times and applying some smoothing between correction steps. If we denote a previous estimate of the model state provided by climatology or a previous forecast by xb, and a set of i = 1,2, 3…, n observations of the same parameter by y(I), a simple Cressman analysis is provided by the model state xa defined at each grid point j, according to the following update equation:

$x_{a}(j) = x_{b}(j) + \frac{\sum_{i=1}^{n} w(i,j) \left( y(i) - x_{b}(i) \right)}{\sum_{i=1}^{n} w(i,j)}$
	
Where ‘w’ is a weighting factor that depends on the distance from the station to the grid point where we are correcting our analysis.

$w(i,j) = \frac{R^2 - d(i,j)^2}{R^2 + d(i,j)^2}$
	
Where di,j is the distance between observation points (i) and grid points (j). xb(i) is the background state. Interpolated to the observation point i. The weight function w(i,j) is a decreasing function of distance, which is zero if di,j > R, where R is the user-defined influence radius. The weight function will be 1 if the grid point ‘j’ is collocated with observation ‘i’. 
   
In the successive corrections method, a pass is made through every grid point, updating the variable at each grid point based on the first guess field and the observations surrounding that grid point. After one pass is made through the domain, another pass is made, again modifying the field at each grid point based on the observations surrounding the grid point.



**4. Solution of the ordinary differential equation using Fourth order Runge – Kutta method (rk4.f90)**

Assuming that warming of air temperature at all grid points can be represented using the equation

$\frac{dT}{dt} - 0.00134 T - 0.006 = 0$
	
where time ‘t’ is in minutes,
Calculate the temperature at 13:00 hrs using a time step of 30 min at all grid points and plot the result.
Assume that the minimum air temperature occurred at 6.30 am, and the values given can be taken as the initial value at the respective grid points.

**Runge-Kutta 4th Order**
A differential equation is an equation involving a function and its derivatives, either ordinary derivatives or partial derivatives. The fourth-order Runge-Kutta method is one of the most popular methods for integrating over time. It is stable at large time steps, accurate, and relatively fast, and it can be used to find the solution of the first-order ordinary differential equation. The Runge-Kutta 4th order scheme, a weighted average that privileges the values at the inner two points in finding the slope, is derived from the Taylor series expansion and given by


$y_{i+1} = y_i + \frac{(k_1 + k_2 + k_3 + k_4) \cdot h}{6}$

where h is given by

$h = x_{i+1} - x_i$
	
and the coefficients k1, k2, k3 and k4 are given by

$k_1 = f(x_i, y_i)$

$k_2 = f\left(x_i + \frac{h}{2}, y_i + \frac{k_1 h}{2}\right)$

$k_3 = f\left(x_i + \frac{h}{2}, y_i + \frac{k_2 h}{2}\right)$

$k_4 = f(x_i + h, y_i + k_3 h)$
		
Knowing the value of y = yi at xi, we can find the value of y = yi+1 at x = xi+1 using the above two equations.



**5. Computation of stream function from geopotential field using Relaxation method Stream Function (sf.f90)**

Calculate stream function using relaxation method.
$\delta y = 277.5 \, \text{km}; \quad \delta x = \delta y \cos \phi; \quad \Omega = 7.292 \times 10^{-4} \, \text{s}^{-1}; \quad g = 9.81 \, \text{m/s}^2.$

Stream Function
When horizontal divergence is zero,

$\frac{du}{dx} + \frac{dv}{dy} = 0$
 
Function chi (x, y) can be expressed as

$u = - \frac{\partial \psi}{\partial y}$

$v = \frac{\partial \psi}{\partial x}$

This function psi is called the Stream function.
Now the vorticity,

$\zeta = \frac{\partial v}{\partial x} - \frac{\partial u}{\partial y} = \frac{\partial^2 \psi}{\partial x^2} + \frac{\partial^2 \psi}{\partial y^2}$
	
Therefore,

$\zeta =  \nabla^2 \psi$

Thus, vorticity for non-divergent flow is the two-dimensional Laplacian of the Stream function.
Where vorticity can be expressed as

$\zeta  = \frac{g}{f} \nabla_p^2 z$

Stream function can be estimated using finite differences and relaxation methods. In the Relaxation method, differential equations are solved by successive approximation and then iteration until a solution is found. An initial guess is made, and the error is reduced by an improved guess. The cycle is repeated until the error at every grid point is reduced below some pre-assigned value.
Steps followed in the relaxation method
1) An initial guess of psi at all the grid points is taken as zero.
2) Compute the residual

$R_{i,j} = \psi_{i+1,j} + \psi_{i-1,j} + \psi_{i,j+1} + \psi_{i,j-1} - 4\psi_{i,j} - \psi_{i,j} (\delta x^2 \delta y^2)$

The same equation can be written as

$R_{i,j} = \psi_{i+1,j} + \psi_{i-1,j} + \psi_{i,j+1} + \psi_{i,j-1} - 4\left( \psi_{i,j} + \frac{R_{i,j}}{4} \right) - \psi_{i,j} (\delta x^2 \delta y^2) = 0$

3) In the next iteration, the initial guess $\psi(i,j)$ should be changed to $\psi(i,j) + \frac{1}{4} R_{i,j}$.
4) This process is repeated at each grid point till we get the desired accuracy.



**6. Computation of Velocity potential using observed or reanalysis wind data (velout.f90)**

Calculate velocity potential using the relaxation method.
$\delta y = 222 \ \text{km}, \quad \delta x = \delta y \cos \phi, \quad \Omega = 7.292 \times 10^{-4} \ \text{s}^{-1}, \quad g = 9.81 \ \text{m/s}^2$

If a particular fluid motion is irrotational, it is possible to represent the velocity field of flow in terms of a scalar function called velocity potential (normally denoted by χ).

$V = \nabla (\chi) \quad \text{i.e.,} \quad u = \frac{\partial \chi}{\partial x}, \quad v = \frac{\partial \chi}{\partial y}$

The Divergence, in this case, is 

$D = \frac{\partial u}{\partial x} + \frac{\partial v}{\partial y} = \frac{\partial^2 \chi}{\partial x^2} + \frac{\partial^2 \chi}{\partial y^2} = \nabla^2 \chi$

That is, the divergence for irrotational flow is the two-dimensional Laplacian of the Velocity Potential. Thus, if divergence is known at each grid point, then the velocity potential can be calculated using the relaxation method.
Steps followed in the relaxation method
1) An initial guess of chi at all the grid points is taken as zero.
2) Compute the residual

$R_{i,j} = \chi_{i+1,j} + \chi_{i-1,j} + \chi_{i,j+1} + \chi_{i,j-1} - 4\chi_{i,j} - D_{i,j} \delta x^2 \delta y^2$

The same equation can be written as

$R_{i,j} = \chi_{i+1,j} + \chi_{i-1,j} + \chi_{i,j+1} + \chi_{i,j-1} - 4\left( \chi_{i,j} + \frac{R_{i,j}}{4} \right) - D_{i,j} \delta x^2 \delta y^2 = 0$

4) In the next iteration, the initial guess $\chi(i,j)$ is changed to $\chi(i,j) + \frac{1}{4} R_{i,j}$
5) This process is repeated at each grid point till we get the desired accuracy.



**7. Computation of geostrophic wind and geostrophic vorticity using geopotential height (geos.f90)**

The grid resolution is 2.5o x2.5o. 
Calculate geostrophic wind components and vorticity.
$Use \( \delta y = 111 \) km; \( \delta x = \delta y \cos \phi \), \( \Omega = 7.292 \times 10^{-4} \) s\(^{-1}\), \( g = 9.81 \) m/s\(^2\).$
	
Geostrophic winds result from a balance between pressure gradient force and Coriolis force.
The zonal and meridional components of geostrophic wind can be calculated from geopotential height as follows,
		
$u_g = -\frac{g}{f} \left( \frac{\partial z}{\partial y} \right)$

$v_g = \frac{g}{f} \left( \frac{\partial z}{\partial x} \right)$

Geostrophic vorticity can be written as, $\zeta_g = \frac{\partial v_g}{\partial x} - \frac{\partial u_g}{\partial y}$

ug, vg, and ζg can be calculated following a finite differencing scheme.
