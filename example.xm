#import "Macros.h"
#import "KittyMemory/writeData.hpp"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>





float(*old_Movement)(void *this_);
float Movement(void *this_) {

  float userAmount = [[switches getValueFromSwitch:@"Custom Speed"] floatValue];

  if([switches isSwitchOn:@"Custom Speed"]) {
    return userAmount;
  }

  return old_Movement(this_);
}



void setup() {

 

HOOK(0x1014198CC,Movement,old_Movement);



[switches addSliderSwitch:@"Custom Speed"
              description:@"Set your custom move speed"
                minimumValue:1
                  maximumValue:5
                    sliderColor:UIColorFromHex(0xBD0000)];

}