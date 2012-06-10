//
//  TFKIntegTestController.m
//  TestForKIF
//
//  Created by Seth Sweep on 6/10/12.
//  Copyright (c) 2012 SethLab. All rights reserved.
//

#import "TFKIntegTestController.h"
#import "KIFTestScenario+TFKAdditions.h"

@implementation TFKIntegTestController

- (void)initializeScenarios;
{
    [self addScenario:[KIFTestScenario scenarioToTapTableCells]];
}

@end
