//
//  Checker.h
//  Chess
//
//  Created by gian on 03.07.17.
//  Copyright © 2017 RUAG. All rights reserved.
//

#import "ViewController.h"
#import "ChessFigure.h"


@interface Checker : NSObject

@property NSInteger origin;
@property NSInteger destination;
@property NSInteger destX;
@property NSInteger destY;

- (BOOL) check : (NSInteger) origin : (NSInteger) destination : (NSInteger) X : (NSInteger) Y : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoardArray;
- (BOOL) checkIfEnemyAtDestination : (NSInteger) origin : (NSInteger) destination : (NSMutableArray *) chessBoardArray;
- (BOOL) checkIfGapIsClear : (NSInteger) destination : (NSMutableArray *) chessBoardArray;
- (BOOL) checkIfMoveThreatensKing : (NSMutableArray *) chessBoard : (NSInteger) origin : (NSInteger) destination;

@end
