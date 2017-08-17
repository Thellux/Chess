//
//  Knight.m
//  MyChess
//
//  Created by gian on 30.05.17.
//
//

#import <Foundation/Foundation.h>
#import "Knight.h"
#import "Checker.h"

@implementation Knight

- (NSMutableArray *) getValidDestinations : (NSInteger) position : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoard {
    
    _chessBoardArray = chessBoard;
    
    NSNumber *nmb1 = [NSNumber numberWithInteger:[self move1:position:kingIsThreatenedCheck]];
    NSNumber *nmb2 = [NSNumber numberWithInteger:[self move2:position:kingIsThreatenedCheck]];
    NSNumber *nmb3 = [NSNumber numberWithInteger:[self move3:position:kingIsThreatenedCheck]];
    NSNumber *nmb4 = [NSNumber numberWithInteger:[self move4:position:kingIsThreatenedCheck]];
    NSNumber *nmb5 = [NSNumber numberWithInteger:[self move5:position:kingIsThreatenedCheck]];
    NSNumber *nmb6 = [NSNumber numberWithInteger:[self move6:position:kingIsThreatenedCheck]];
    NSNumber *nmb7 = [NSNumber numberWithInteger:[self move7:position:kingIsThreatenedCheck]];
    NSNumber *nmb8 = [NSNumber numberWithInteger:[self move8:position:kingIsThreatenedCheck]];
    NSMutableArray *preArray = [[NSMutableArray alloc] init];
    [preArray addObject:nmb1];
    [preArray addObject:nmb2];
    [preArray addObject:nmb3];
    [preArray addObject:nmb4];
    [preArray addObject:nmb5];
    [preArray addObject:nmb6];
    [preArray addObject:nmb7];
    [preArray addObject:nmb8];
    NSMutableArray *postArray = [[NSMutableArray alloc]init];
    for (int i = 0 ; i < 8 ; i++) {
        NSNumber *nmb = [preArray objectAtIndex:i];
        if ([nmb intValue] != 404) {
            [postArray addObject:nmb];
        }
    }
    return postArray;
}

- (NSInteger) move1 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X - 1;
    Y = Y - 2;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        return newPosition;
    }
    return 404;
}

- (NSInteger) move2 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X + 1;
    Y = Y - 2;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        return newPosition;
    }
    return 404;
}

- (NSInteger) move3 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X + 2;
    Y = Y - 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        return newPosition;
    }
    return 404;
}

- (NSInteger) move4 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X + 2;
    Y = Y + 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        return newPosition;
    }
    return 404;
}

- (NSInteger) move5 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X + 1;
    Y = Y + 2;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        return newPosition;
    }
    return 404;
}

- (NSInteger) move6 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X - 1;
    Y = Y + 2;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        return newPosition;
    }
    return 404;
}

- (NSInteger) move7 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X - 2;
    Y = Y + 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        return newPosition;
    }
    return 404;
}

- (NSInteger) move8 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X - 2;
    Y = Y - 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        return newPosition;
    }
    return 404;
}

- (id) copyWithZone : (NSZone *) zone {
    Knight *knight = [[Knight alloc] init:self.type color:self.team];
    knight.isAlive = YES;
    return knight;
}

@end
