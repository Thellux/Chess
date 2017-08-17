//
//  Pawn.m
//  MyChess
//
//  Created by gian on 29.05.17.
//
//

#import <Foundation/Foundation.h>
#import "Pawn.h"
#import "Checker.h"

@implementation Pawn

- (NSMutableArray *) getValidDestinations : (NSInteger) position : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoard {
    _chessBoardArray = chessBoard;
    NSMutableArray *preArray = [[NSMutableArray alloc] init];
    NSNumber *nmb1;
    NSNumber *nmb2;
    NSNumber *nmb3;
    NSNumber *nmb4;
    if ([self.team  isEqual: @"white"]) {
        nmb1 = [NSNumber numberWithInteger:[self move1:position:kingIsThreatenedCheck]];
        nmb2 = [NSNumber numberWithInteger:[self move2:position:kingIsThreatenedCheck]];
        nmb3 = [NSNumber numberWithInteger:[self move3:position:kingIsThreatenedCheck]];
        nmb4 = [NSNumber numberWithInteger:[self move4:position:kingIsThreatenedCheck]];
    }
    else if ([self.team  isEqual: @"black"]) {
        nmb1 = [NSNumber numberWithInteger:[self move5:position:kingIsThreatenedCheck]];
        nmb2 = [NSNumber numberWithInteger:[self move6:position:kingIsThreatenedCheck]];
        nmb3 = [NSNumber numberWithInteger:[self move7:position:kingIsThreatenedCheck]];
        nmb4 = [NSNumber numberWithInteger:[self move8:position:kingIsThreatenedCheck]];
    }
    else {
        NSLog(@"No team set.");
    }
    [preArray addObject:nmb1];
    [preArray addObject:nmb2];
    [preArray addObject:nmb3];
    [preArray addObject:nmb4];
    NSMutableArray *postArray = [[NSMutableArray alloc]init];
    for (int i = 0 ; i < [preArray count] ; i++) {
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
    Y = Y - 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        if ([checker checkIfEnemyAtDestination:position:newPosition:_chessBoardArray]==NO) {
            return newPosition;
        }
        return 404;
    }
    return 404;
}

- (NSInteger) move2 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    if (Y == 7){
        Y = Y - 2;
        NSInteger newPosition = [super getID:X:Y];
        NSInteger positionBetween = [super getID:X:Y+1];
        Checker *checker = [[Checker alloc] init];
        if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
            if ([checker checkIfEnemyAtDestination:position:newPosition:_chessBoardArray]==NO && [checker checkIfGapIsClear:positionBetween:_chessBoardArray] == YES) {
                return newPosition;
            }
            return 404;
        }
        return 404;
    }
    return 404;
}

- (NSInteger) move3 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X - 1;
    Y = Y - 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        if ([checker checkIfEnemyAtDestination:position:newPosition:_chessBoardArray] == YES) {
            return newPosition;
        }
        return 404;
    }
    return 404;
}

- (NSInteger) move4 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X + 1;
    Y = Y - 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        if ([checker checkIfEnemyAtDestination:position:newPosition:_chessBoardArray] == YES) {
            return newPosition;
        }
        return 404;
    }
    return 404;
}

- (NSInteger) move5 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    Y = Y + 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        if ([checker checkIfEnemyAtDestination:position:newPosition:_chessBoardArray]==NO) {
            return newPosition;
        }
        return 404;
    }
    return 404;
}

- (NSInteger) move6 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    if (Y == 2){
        Y = Y + 2;
        NSInteger newPosition = [super getID:X:Y];
        NSInteger positionBetween = [super getID:X:Y-1];
        Checker *checker = [[Checker alloc] init];
        if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
            if ([checker checkIfEnemyAtDestination:position:newPosition:_chessBoardArray]==NO && [checker checkIfGapIsClear:positionBetween:_chessBoardArray]==YES) {
                return newPosition;
            }
            return 404;
        }
        return 404;
    }
    return 404;
}

- (NSInteger) move7 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X - 1;
    Y = Y + 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        if ([checker checkIfEnemyAtDestination:position:newPosition:_chessBoardArray] == YES) {
            return newPosition;
        }
        return 404;
    }
    return 404;
}

- (NSInteger) move8 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    X = X + 1;
    Y = Y + 1;
    NSInteger newPosition = [super getID:X:Y];
    Checker *checker = [[Checker alloc] init];
    if ([checker check:position:newPosition:X:Y:kingIsThreatenedCheck:_chessBoardArray] == YES) {
        if ([checker checkIfEnemyAtDestination:position:newPosition:_chessBoardArray] == YES) {
            return newPosition;
        }
        return 404;
    }
    return 404;
}

- (id) copyWithZone : (NSZone *) zone {
    Pawn *pawn = [[Pawn alloc] init:self.type color:self.team];
    pawn.isAlive = YES;
    return pawn;
}

@end
