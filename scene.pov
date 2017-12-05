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

#declare P13 = <-4, 0, -4>;
#declare P14 = < -3.5, 0, -3.5>;
#declare P15 = < -3, 0, -3>;
#declare P16 = < -2.5, 0, -2.5>;
#declare P17 = < -2, 0, -2>;
#declare P18 = < -1.5, 0, -1.5>;
#declare P19 = < -1, 0, -1>;
#declare P20 = < -0.5, 0, -0.5>;
#declare P21 = < 1, 0, 1>;
#declare P22 = < 2.5, 0, 2.5>;
#declare P23 = < 4.5, 0, 4.5>;
#declare P24 = <7, 0, 7>;
#declare P25 = <10, 0, 10>;

#declare Spline_1 =
  spline {
    natural_spline
   -0.100, P0, // control point
    0.000, P1, // starting point
    0.100, P2,
    0.200, P3,
    0.300, P4,
    0.400, P5,
    0.500, P6,
    0.600, P7,
    0.700, P8,
    0.800, P9,
    0.900, P10,
    1.000, P11, // end point
    1.100, P12  // control point
  }

#declare Spline_2 =
  spline {
    natural_spline
   -0.100, P13, // control point
    0.000, P14, // starting point
    0.100, P15,
    0.200, P16,
    0.300, P17,
    0.400, P18,
    0.500, P19,
    0.600, P20,
    0.700, P21,
    0.800, P22,
    0.900, P23,
    1.000, P24, // end point
    1.100, P25  // control point
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

       // end of sphere 
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
        translate Spline_2(clock+0/30)

       // end of sphere
}

  light_source {
    <2, 4, -1>
    color White
  }

  light_source {
    <2, 4, 1>
    color White
  }

  light_source { <0,10,30> color White }