//
//  ViewController.h
//  Chess
//
//  Created by gian on 30.05.17.
//  Copyright © 2017 RUAG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void)move : (NSInteger) origin : (NSInteger) destination;

@property NSInteger origin;
@property NSInteger destination;
@property NSMutableArray* possibleDestinations;
@property NSString *lastRoundActor;

@property NSMutableArray * moveArray;
@property NSInteger move;
@property BOOL previousMoveIsEnabled;
@property BOOL nextMoveIsEnabled;

@end
