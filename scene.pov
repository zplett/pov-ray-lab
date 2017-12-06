#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "metals.inc"
#include "golds.inc"

background
{

  color Black

}

camera
{

  location <0, 5, -15>
  look_at <0, 1, 0>
  angle 30

}

plane { y, 0
    pigment {
      checker pigment { HuntersGreen }   ,

     pigment { P_WoodGrain8A }
  }
   finish {
      ambient 0.1
      diffuse 0.6
      phong .7
      reflection .5
   }
}

plane { z, 50
   pigment {
      color SteelBlue
   }
   finish {
      ambient 0.2
      diffuse 0.2
   }
}

#declare P0 = <-8, 0, -8>;
#declare P1 = < -5.5, 0, -5.5>;
#declare P2 = < -3, 0, -3>;
#declare P3 = < -1.00, 0, -1>;
#declare P4 = < 0, 0, 0>;
#declare P5 = < 1, 0, 1>;
#declare P6 = < 2, 0, 2>;
#declare P7 = < 3, 0, 3>;
#declare P8 = < 4, 0, 4>;
#declare P9 = < 4.75, 0, 4.75>;
#declare P10= < 5.25, 0, 5.25>;
#declare P11= <5.5, 0, 5.5>;
#declare P12= <5.125, 0, 5.125>;

#declare P13 = <-1, 0, -4>;
#declare P14 = < -0.8, 0, -3.5>;
#declare P15 = < -0.6, 0, -3>;
#declare P16 = < -0.4, 0, -2.5>;
#declare P17 = < -0.2, 0, -2>;
#declare P18 = < 0, 0, -1.5>;
#declare P19 = < 0.2, 0, -1>;
#declare P20 = < 0.4, 0, -0.5>;
#declare P21 = < 0.6, 0, 1>;
#declare P22 = < 0.8, 0, 2.5>;
#declare P23 = < 1, 0, 4.5>;
#declare P24 = <1.2, 0, 7>;
#declare P25 = <1.4, 0, 10>;

#declare P26 = <-30, 0, 20>;
#declare P27 = < -20, 0, 14>;
#declare P28 = < -15, 0, 12>;
#declare P29 = < -7.5, 0, 10>;
#declare P30 = < -5, 0, 8.5>;
#declare P31 = < -4, 0, 6>;
#declare P32 = < -3.5, 0, 3.5>;
#declare P33 = < -3, 0, 1.5>;
#declare P34 = < -2.5, 0, -1>;
#declare P35 = < -2, 0, -3>;
#declare P36 = < -1.5, 0, -4>;
#declare P37 = < -1, 0, -4.5>;
#declare P38 = < -0.5, 0, -4.75>;

#declare Spline_1 =
  spline {
    natural_spline
   -0.100, P0, 
    0.000, P1, 
    0.100, P2,
    0.200, P3,
    0.300, P4,
    0.400, P5,
    0.500, P6,
    0.600, P7,
    0.700, P8,
    0.800, P9,
    0.900, P10,
    1.000, P11, 
    1.100, P12  
  }

#declare Spline_2 =
  spline {
    natural_spline
   -0.100, P13,
    0.000, P14,
    0.100, P15,
    0.200, P16,
    0.300, P17,
    0.400, P18,
    0.500, P19,
    0.600, P20,
    0.700, P21,
    0.800, P22,
    0.900, P23,
    1.000, P24,
    1.100, P25  
  }

#declare Spline_3 =
  spline {
    natural_spline
   -0.100, P26,
    0.000, P27,
    0.100, P28,
    0.200, P29,
    0.300, P30,
    0.400, P31,
    0.500, P32,
    0.600, P33,
    0.700, P34,
    0.800, P35,
    0.900, P36,
    1.000, P37,
    1.100, P38
  }

intersection {
sphere{ <0,0,0>,0.66 
        texture{ pigment{ rgb<1.0,1.0,1>*0.05 } 
                 finish { phong 1 reflection{ 0.1 metallic 0.25} } 
               }
      }         box {<-0.5,-0.5,-0.5>,< 0.5,0.5,0.5>
     texture{
       pigment{rgb<0.8,0.8,0.8>*0.05}
       finish {phong 1 reflection{ 0.1 metallic 0.25}}
    } }
    rotate <0, 0, -clock*360> 
        translate<0,0.5,0> 
        translate Spline_1(clock+0/30)

}

intersection {
sphere{ <0,0,0>,0.66
        texture{ pigment{ rgb<1.0,1.0,1>*0.05 }
                 finish { phong 1 reflection{ 0.1 metallic 0.25} }
               }
      }         box {<-0.5,-0.5,-0.5>,< 0.5,0.5,0.5>
     texture{
       pigment{rgb<0.8,0.8,0.8>*0.05}
       finish {phong 1 reflection{ 0.1 metallic 0.25}}
    } }
    rotate <clock*360, 0, 0>
        translate<0,0.5,0>
        translate Spline_2(clock+0/30)

}

#if ( clock >= 0.25 )
  sphere {
    <0,0,0>,0.75
    pigment { Clear }
    interior { ior 1.6
               }
    finish  {
    ambient 0.1
    diffuse 0.1
    reflection 0.1
    specular 0.8
    roughness 0.003
    phong 1
    phong_size 400
    

}
  translate <0,0.75,0>
  translate Spline_3(clock+0/15)
    }
#end

  light_source {
    <2, 4, -1>
    color White
  }

  light_source {
    <2, 4, 1>
    color White
  }

  light_source { <0,10,30> color White }