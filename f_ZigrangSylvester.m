function f = f_ZigrangSylvester(D,Re,aRou)
%% Calculates the Darcy-Weisbach friction factor for pressure loss calculations
%   via explicit equation by Zigrang,D.J & Sylvester, N.D.
%   by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%   PhD Topic: District Heating in Areas with Low-Energy Houses

%% INPUTS (Scalar or Vector)
%    aRou     : Absolute roughness of pipe          [mm]
%    D        : Inner diameter of the pipe          [mm]
%    Re       : Reynolds Number                     [-]

%% Checking algorithm limitations
if Re<4000 | Re>1e8 
    error('Error: Zigrang&Sylvester algorithm is valid for a Reynold range as in 4000<Re<1e8')
end
if aRou/D<4e-5 | aRou/D>0.05  
    error('Error: Zigrang&Sylvester algorithm is valid for a relative roughness range as in 4e-5<eps/D<0.05')
end

f=(-2.*log10((aRou./D)./3.7-(5.02./Re).*log10((aRou./D)-5.02./Re.*log10(((aRou/D)./3.7)+13./Re)))).^-2;

end