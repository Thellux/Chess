//
//  ChessFigure.m
//  MyChess
//
//  Created by gian on 29.05.17.
//
//

#import "ViewController.h"

@interface ChessFigure : NSObject

@property NSString* team;
@property NSString* type;
@property bool isAlive;

- (id) init : (NSString *) name color : (NSString *) color;

- (NSMutableArray *) getValidDestinations : (NSInteger) position : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoard;

- (NSInteger) getX : (NSInteger) ID;

- (NSInteger) getY : (NSInteger) ID : (NSInteger) X;

- (NSInteger) getID : (NSInteger) X : (NSInteger) Y;

- (id) copyWithZone : (NSZone *) zone;

@end
