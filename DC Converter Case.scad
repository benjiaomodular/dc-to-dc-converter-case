include <YAPP_Box/library/YAPPgenerator_v18.scad>

cutoutsGrill = [[5, 0, 33, 70, 1, 2, 90, "lid"]
               ];

printBaseShell      = true;
printLidShell       = true;

// Edit these parameters for your own board dimensions
wallThickness       = 2.0;
basePlaneThickness  = 1.5;
lidPlaneThickness   = 1.5;

baseWallHeight      = 11;
lidWallHeight       = 14;

// ridge where base and lid off box can overlap
// Make sure this isn't less than lidWallHeight
ridgeHeight         = 4;
ridgeSlack          = 0.2;
roundRadius         = 2.0;

// How much the PCB needs to be raised from the base
// to leave room for solderings and whatnot
standoffHeight      = 7.0;  //-- only used for showPCB
standoffPinDiameter = 2.5;
standoffHoleSlack   = 0.3;
standoffDiameter    = 5;

// Total height of box = basePlaneThickness + lidPlaneThickness 
//                     + baseWallHeight + lidWallHeight
pcbLength           = 76;
pcbWidth            = 33;
pcbThickness        = 2;
                            
// padding between pcb and inside wall
paddingFront        = 0;
paddingBack         = 35;
paddingRight        = 0;
paddingLeft         = 0;


//-- D E B U G -----------------//-> Default ---------
showSideBySide      = true;     //-> true
onLidGap            = 0;
shiftLid            = 1;
hideLidWalls        = false;    //-> false
colorLid            = "yellow";   
hideBaseWalls       = false;    //-> false
colorBase           = "white";
showOrientation     = true;
showPCB             = true;
showPCBmarkers      = false;
showShellZero       = false;
showCenterMarkers   = false;
inspectX            = 0;        //-> 0=none (>0 from front, <0 from back)
inspectY            = 0;        //-> 0=none (>0 from left, <0 from right)

cutoutsFront = [[6, -6, 21, 10, 0, yappRectangle]];
cutoutsBack = [[17,0, 13, 10, 0, yappCircle]];
snapJoins = [[2, 10, yappLeft, yappRight, yappSymmetric]];


module baseHookInside()
{
  translate([35, wallThickness, (basePlaneThickness/2)])
  {
    color("blue")
    {
      cube([2,(shellWidth-(wallThickness*2)),((basePlaneThickness/2)+baseWallHeight)]);
    }
  }
} 
baseHookInside();

//---- This is where the magic happens ----
YAPPgenerate();
