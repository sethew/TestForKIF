//
//  KIFTestScenario+KIFAdditions.m
//  TestForKIF
//
//  Created by Seth Sweep on 6/10/12.
//  Copyright (c) 2012 SethLab. All rights reserved.
//

#import "KIFTestScenario+TFKAdditions.h"
#import "KIFTestStep.h"

@implementation KIFTestScenario (TFKAdditions)

+ (id)scenarioToTapTableCells
{
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that two tablecells can be tapped in the same tableview."];
    [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Row 0"]];
    [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Row 1"]];
    
    return scenario;
}

@end
