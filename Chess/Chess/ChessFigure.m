//
//  ChessFigure.m
//  MyChess
//
//  Created by gian on 29.05.17.
//
//

#import <Foundation/Foundation.h>
#import "ChessFigure.h"

@implementation ChessFigure : NSObject

-(id) init : (NSString *) name color : (NSString *) color {
    self.type = name;
    self.team = color;
    return self;
}

- (NSMutableArray *) getValidDestinations : (NSInteger) position : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoard {
    NSLog(@"error, this should not happen. ChessFigure is abstract. Please implement the method in your class.");
    return [NSMutableArray new];
}

- (NSInteger) getID : (NSInteger) X : (NSInteger) Y {
    NSInteger ID = ((Y-1)*8)+(X-1);
    return ID;
}

- (NSInteger) getX : (NSInteger) ID {
    NSInteger X;
    if (ID == 0) {
        return 1;
    }
    X = (ID+1)%8;
    if (X == 0) {
        return 8;
    }
    return X;
}

- (NSInteger) getY : (NSInteger) ID : (NSInteger) X {
    NSInteger Y = (0.125 * ID) - (0.125 * X) + 1.125;
    return Y;
}

- (id) copyWithZone : (NSZone *) zone {
    ChessFigure *chessFigure = [[ChessFigure alloc] init];
    chessFigure.team = [_team copyWithZone:zone];
    chessFigure.type = [_type copyWithZone:zone];
    chessFigure.isAlive = YES;
    return chessFigure;
}

@end
