//
//  Bishop.m
//  MyChess
//
//  Created by gian on 30.05.17.
//
//

#import <Foundation/Foundation.h>
#import "Bishop.h"
#import "Checker.h"

@implementation Bishop

- (NSMutableArray *) getValidDestinations : (NSInteger) position : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoard {
    
    _chessBoardArray = chessBoard;
    
    NSMutableArray *arr1 = [self move1:position:kingIsThreatenedCheck];
    NSMutableArray *arr2 = [self move2:position:kingIsThreatenedCheck];
    NSMutableArray *arr3 = [self move3:position:kingIsThreatenedCheck];
    NSMutableArray *arr4 = [self move4:position:kingIsThreatenedCheck];
    
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i < [arr1 count] ; i++) {
        [finalArray addObject:[arr1 objectAtIndex:i]];
    }
    for (int i = 0 ; i < [arr2 count] ; i++) {
        [finalArray addObject:[arr2 objectAtIndex:i]];
    }
    for (int i = 0 ; i < [arr3 count] ; i++) {
        [finalArray addObject:[arr3 objectAtIndex:i]];
    }
    for (int i = 0 ; i < [arr4 count] ; i++) {
        [finalArray addObject:[arr4 objectAtIndex:i]];
    }
    return finalArray;
}

- (NSMutableArray *) move1 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSMutableArray *possibleDestinations = [[NSMutableArray alloc] init];
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    BOOL doBreak = NO;
    for (int i = 0 ; !doBreak && i < 8 ; i++) {
        X = X - 1;
        Y = Y - 1;
        NSInteger newPosition = [super getID:X :Y];
        Checker *checker = [[Checker alloc] init];
        
        if ([checker check:position :newPosition :X :Y:NO :_chessBoardArray] == YES) {
            if (kingIsThreatenedCheck == YES) {
                if ([checker checkIfMoveThreatensKing:_chessBoardArray :position :newPosition] == NO) {
                    if ([checker checkIfEnemyAtDestination:position :newPosition:_chessBoardArray] == YES) {
                        NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                        [possibleDestinations addObject:nmb];
                        doBreak = YES;
                        break;
                    }
                    else {
                        NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                        [possibleDestinations addObject:nmb];
                    }
                }
            }
            else {
                if ([checker checkIfEnemyAtDestination:position :newPosition:_chessBoardArray] == YES) {
                    NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                    [possibleDestinations addObject:nmb];
                    doBreak = YES;
                    break;
                }
                else {
                    NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                    [possibleDestinations addObject:nmb];
                }
            }
        }
        else {
            doBreak = YES;
            break;
        }
    }
    return possibleDestinations;
}


- (NSMutableArray *) move2 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSMutableArray *possibleDestinations = [[NSMutableArray alloc] init];
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    BOOL doBreak = NO;
    for (int i = 0 ; !doBreak && i < 8 ; i++) {
        X = X + 1;
        Y = Y - 1;
        NSInteger newPosition = [super getID:X :Y];
        Checker *checker = [[Checker alloc] init];
        
        if ([checker check:position :newPosition :X :Y:NO :_chessBoardArray] == YES) {
            if (kingIsThreatenedCheck == YES) {
                if ([checker checkIfMoveThreatensKing:_chessBoardArray :position :newPosition] == NO) {
                    if ([checker checkIfEnemyAtDestination:position :newPosition:_chessBoardArray] == YES) {
                        NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                        [possibleDestinations addObject:nmb];
                        doBreak = YES;
                        break;
                    }
                    else {
                        NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                        [possibleDestinations addObject:nmb];
                    }
                }
            }
            else {
                if ([checker checkIfEnemyAtDestination:position :newPosition:_chessBoardArray] == YES) {
                    NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                    [possibleDestinations addObject:nmb];
                    doBreak = YES;
                    break;
                }
                else {
                    NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                    [possibleDestinations addObject:nmb];
                }
            }
        }
        else {
            doBreak = YES;
            break;
        }
    }
    return possibleDestinations;
}


- (NSMutableArray *) move3 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSMutableArray *possibleDestinations = [[NSMutableArray alloc] init];
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    BOOL doBreak = NO;
    for (int i = 0 ; !doBreak && i < 8 ; i++) {
        X = X + 1;
        Y = Y + 1;
        NSInteger newPosition = [super getID:X :Y];
        Checker *checker = [[Checker alloc] init];
        
        if ([checker check:position :newPosition :X :Y:NO :_chessBoardArray] == YES) {
            if (kingIsThreatenedCheck == YES) {
                if ([checker checkIfMoveThreatensKing:_chessBoardArray :position :newPosition] == NO) {
                    if ([checker checkIfEnemyAtDestination:position :newPosition:_chessBoardArray] == YES) {
                        NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                        [possibleDestinations addObject:nmb];
                        doBreak = YES;
                        break;
                    }
                    else {
                        NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                        [possibleDestinations addObject:nmb];
                    }
                }
            }
            else {
                if ([checker checkIfEnemyAtDestination:position :newPosition:_chessBoardArray] == YES) {
                    NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                    [possibleDestinations addObject:nmb];
                    doBreak = YES;
                    break;
                }
                else {
                    NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                    [possibleDestinations addObject:nmb];
                }
            }
        }
        else {
            doBreak = YES;
            break;
        }
    }
    return possibleDestinations;
}


- (NSMutableArray *) move4 : (NSInteger) position : (BOOL) kingIsThreatenedCheck {
    NSMutableArray *possibleDestinations = [[NSMutableArray alloc] init];
    NSInteger X = [super getX:position];
    NSInteger Y = [super getY:position:X];
    BOOL doBreak = NO;
    for (int i = 0 ; !doBreak && i < 8 ; i++) {
        X = X - 1;
        Y = Y + 1;
        NSInteger newPosition = [super getID:X :Y];
        Checker *checker = [[Checker alloc] init];
        
        if ([checker check:position :newPosition :X :Y:NO :_chessBoardArray] == YES) {
            if (kingIsThreatenedCheck == YES) {
                if ([checker checkIfMoveThreatensKing:_chessBoardArray :position :newPosition] == NO) {
                    if ([checker checkIfEnemyAtDestination:position :newPosition:_chessBoardArray] == YES) {
                        NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                        [possibleDestinations addObject:nmb];
                        doBreak = YES;
                        break;
                    }
                    else {
                        NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                        [possibleDestinations addObject:nmb];
                    }
                }
            }
            else {
                if ([checker checkIfEnemyAtDestination:position :newPosition:_chessBoardArray] == YES) {
                    NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                    [possibleDestinations addObject:nmb];
                    doBreak = YES;
                    break;
                }
                else {
                    NSNumber *nmb = [NSNumber numberWithInt:newPosition];
                    [possibleDestinations addObject:nmb];
                }
            }
        }
        else {
            doBreak = YES;
            break;
        }
    }
    return possibleDestinations;
}

- (id) copyWithZone : (NSZone *) zone {
    Bishop *bishop = [[Bishop alloc] init:self.type color:self.team];
    bishop.isAlive = YES;
    return bishop;
}

@end
