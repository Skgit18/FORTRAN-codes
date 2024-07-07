# FORTRAN-codes
This repository has FORTRAN programs written during my Master's coursework.
Each program focuses on basic concepts from Dynamic Meteorology.

1. divort.f90 => Computation of divergence and vorticity using finite difference technique

2. vertivel.f90 => Computation of vertical velocity using the equation of continuity

3. cressman.f90 => Objective analysis of geopotential height by Cressman method

4. rk4.f90 => Solution of the ordinary differential equation using Fourth order Runge – Kutta method

5. sf.f90 => Computation of stream function from geopotential field using Relaxation method Stream Function

6. velout.f90 => Computation of Velocity potential using observed or reanalysis wind data
   
7. geos.f90 => Computation of geostrophic wind and geostrophic vorticity using geopotential height



Description of each program.
1. divort.f90

   Compute divergence and vorticity using finite difference scheme from u and v grid point data given. Print estimated values of divergence and vorticity at the 5th level.

   Horizontal divergence is given by
   ```math
   D=\ \frac{\partial u}{\partial x}+\ \frac{\partial v}{\partial y}$
   ```
   Vorticity is given by
   ```math  
   \zeta=\ \frac{\partial v}{\partial x}-\ \frac{\partial u}{\partial y}
   ```
   With u, v at grid points, divergence, and vorticity can be estimated.
   The estimation is carried out by finite difference approximations.
   The divergence at point (x, y) can be estimated as follows,
   ```math
      \frac{\partial u}{\partial x}+\frac{\partial v}{\partial y}=\frac{u\left(x+d\right)-u(x-d)}{2d}+\ \frac{v\left(y+d\right)-v(y-d)}{2d}
   ```

2. vertivel.f90

   Compute divergence and vorticity using finite difference scheme from u and v grid point data given and then compute vertical velocity from divergence using the continuity equation. 
   Vertical velocity is computed using both uncorrected and bias-corrected divergence. Print estimated values of vertical velocity at the 5th level.

   Vertical wind fields can be derived from horizontal wind fields based on the continuity equation.
   The continuity equation is given as
   ```math
      \frac{\partial w}{\partial p}=-(\ \frac{\partial u}{\partial x}+\frac{\partial v}{\partial x})
   ```
   This can also be written as
   ```math
      w\left(p\right)=w\left(p_s\right)+(p_s-p)(∂u∂x+∂v∂x)
   ```
   Where
   ```math
      〈 〉=(p-p_s)∫_(p_s)^p▒〖()〗
   ```
   is pressure weighted vertical average.
   
4. cressman.f90

   Starting with a reasonable first guess and available data at observation points, the method proceeds by scanning and correcting the field several times and applying some smoothing between correction steps.
   If we denote a previous estimate of the model state provided by climatology or a previous forecast by xb, and a set of i = 1,2, 3…, n observations of the same parameter by y(i),
   a simple Cressman analysis is provided by the model state xa defined at each grid point j, according to the following update equation:
   ```math
      x_{a\ \ }\left(j\right)=\ x_{b\ \ }\left(j\right)+\ \frac{\sum_{i=1}^{n}{w\left(i,j\right)\ast(y\left(i\right)-x_b\left(i\right))}}{\sum_{i=1}^{n}{w(i,j)}}
   ```
   Where ‘w’ is a weighting factor that depends on the distance from the station to the grid point where we are correcting our analysis.
   ```math
   w\left(i,j\right)=\frac{R^2-{d(i,j)}^2\ }{R^2+{d(i,j)}^2}
   ```
   Where di,j is the distance between observation points (i) and grid points (j). xb(i) is the background state. Interpolated to the observation point i. 
   The weight function w(i,j) is a decreasing function of distance, which is zero if di,j > R, where R is the user-defined influence radius. 
   The weight function will be 1 if the grid point ‘j’ is collocated with observation ‘i’. 
   In the successive corrections method, a pass is made through every grid point, updating the variable at each grid point based on the first guess field and the observations surrounding that grid point. 
   After one pass is made through the domain, another pass is made, again modifying the field at each grid point based on the observations surrounding the grid point.

5. rk4.f90

   Assuming that warming of air temperature at all grid points can be represented using the equation
   ```math
   dT/dt -0.00134*T-0.006 = 0
   ```
   where time ‘t’ is in minutes,
   Calculate the temperature at 13:00 hrs using a time step of 30 min at all grid points and plot the result.
   Assume that the minimum air temperature occurred at 6.30 am, and the values given can be taken as the initial value at the respective grid points.

   Runge-Kutta 4th Order
   A differential equation is an equation involving a function and its derivatives, either ordinary derivatives or partial derivatives. 
   The fourth-order Runge-Kutta method is one of the most popular methods used for integrating over time, which is stable at large time steps,
   accurate and relatively fast, which can be used to find the solution of the first-order ordinary differential equation.
   The Runge-Kutta 4th order scheme, a weighted average that privileges the values at the inner two points in finding the slope is derived from the Taylor series expansion and given by
   ```math
   yi+1 = yi + (k1 + k2 + k3 + k4) *h/6
   ```
      where h is given by
   ```math
   h = xi+1 -xi
   ```
      and the coefficients k1, k2, k3 and k4 are given by
   ```math
      k1 = f(x1,y1)
      k2= f(x1 + h/2 , y1 + k1h/2 )
      k3= f(x1 + h/2 , y1 + k2h/2)
      k4= f(x1 + h, y1 + k3h)
   ```
   Knowing the value of y = yi at xi, we can find the value of y = yi+1 at x = xi+1 using the above two equations.

6. sf.f90

   Calculate stream function using relaxation method.
   Use δy = 277.5 km; δx = δy cos φ, Ω = 7.292*10-4 s-1, g = 9.81 m/s
   Stream Function
   When horizontal divergence is zero,
   ```math
   du/dx + dv/dy = 0
   ``` 
    Function chi (x, y) can be expressed as
   ```math
   u = - dpsi/dy
   v = dpsi/dx
   ```   
   This function psi is called the Stream function.
   Now the vorticity,
   ```math
   eta = (dv/dx - du/dy) = d2psi / dx2 + d2psi / dy2
   ```
   Therefore,
   ```math
   eta =  delta 2 psi                                                
   ```
   Thus, vorticity for non-divergent flow is the two-dimensional Laplacian of the Stream function.
   Where vorticity can be expressed as
   ```math
   eta  = (g / f) delta p 2 z
   ```
   Stream function can be estimated using finite differences and relaxation methods.
   In the Relaxation method, differential equations are solved by successive approximation and then iteration until a solution is found.
   An initial guess is made, and the error is reduced by an improved guess.
   The cycle is repeated until the error at every grid point is reduced below some pre-assigned value.
   Steps followed in the relaxation method
      1) An initial guess of psi at all the grid points is taken as zero.
      2) Compute the residual
         ```math
            Ri,j = psi(i+1,j) + psi(i-1,j) + psi(i, j+1) + psi(i, j-1) - 4psi(i, j) - psi(i,j)δx2δy2
         ```  
         The same equation can be written as
         ```math
            Ri,j = psi(i+1,j) + psi(i-1,j) + psi(i, j+1) + psi(i, j-1) – 4(psi(i, j) + Ri,j /4) − psi(i,j)δx2δy2 = 0
         ```
      3) In the next iteration, the initial guess chi (i, j) is changed to chi (i, j) + 1/4Ri, j
      4) This process is repeated at each grid point till we get the desired accuracy.

7. velout.f90

   Calculate velocity potential using the relaxation method.
   Use δy = 222 km; δx = δy cos φ, Ω = 7.292*10-4 s-1, g = 9.81 m/s

   If a particular fluid motion is irrotational, it is possible to represent the velocity field of flow in terms of a scalar function called velocity potential (normally denoted by χ).
   ```math
      V =  delta(chi) i.e., u =  d(chi)/dx, v =  d(chi)/dy
   ```
   Therefore,  
   ```math
     eta = (dv/dx - du/dy) = d 2 chi/dxdy - d 2 chi /dxdy = 0
   ```
   The Divergence, in this case, is 
   ```math
     D =  du/dx + dv/dy =  d 2 chi / dx2 + d 2chi /dy2 =  delta2(chi)
   ```
   That is, the divergence for irrotational flow is the two-dimensional Laplacian of the Velocity Potential.
   Thus, if divergence is known at each grid point, then the velocity potential can be calculated using the relaxation method.
   Steps followed in the relaxation method

      1) An initial guess of chi at all the grid points is taken as zero.
      2) Compute the residual
      ```math
         Ri,j = chi(i+1,j) + chi (i-1,j) + chi (i, j+1) + chi (i, j-1) - 4chi (i, j) - D (i,j)δx2δy2
      ```
      The same equation can be written as
      ```math
         Ri,j = chi(i+1,j) + chi (i-1,j) + chi (i, j+1) + chi (i, j-1) – 4(chi (i, j) + Ri,j /4) − D (i,j)δx2δy2 = 0
      ```
      3) In the next iteration, the initial guess chi (i, j) is changed to chi (i, j) + ¼Ri, j
      4) This process is repeated at each grid point till we get the desired accuracy.


8. geos.f90

   The grid resolution is 2.5o x2.5o. 
   Calculate geostrophic wind components and vorticity.
   Use dy = 111 km; dx = dy cos φ, Ω = 7.292*10-4 s-1, g = 9.81 m/s
	
   Geostrophic winds result from a balance between pressure gradient force and Coriolis force.
   The zonal and meridional components of geostrophic wind can be calculated from geopotential height as follows,
   ```math
      u_g=\ -\frac{g}{f}(\frac{\partial z}{\partial y})
   ```
   ```math
      v_g=\ \frac{g}{f}(\frac{\partial z}{\partial x})
   ```
   Geostrophic vorticity can be written as,
   ```math
      \zeta_g=\ \frac{\partial v_g}{\partial x}-\ \frac{\partial u_g}{\partial y}
   ```
      ug, vg, and ζg can be calculated following a finite differencing scheme.
