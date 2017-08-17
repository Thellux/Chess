//
//  Checker.m
//  Chess
//
//  Created by gian on 03.07.17.
//  Copyright © 2017 RUAG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Checker.h"
#import "ChessFigure.h"
#import "Knight.h"
#import "AppDelegate.h"

@implementation Checker : NSObject

- (BOOL) check : (NSInteger) origin : (NSInteger) destination : (NSInteger) X : (NSInteger) Y : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoardArray{
    _origin = origin;
    _destination = destination;
    _destX = X;
    _destY = Y;
    BOOL destinationOK = NO;
    if ([self checkBoundaries] == YES) {
        if ([self checkDestination:chessBoardArray] == YES) {
            if (kingIsThreatenedCheck == YES) {
                //_kingThreatCheck = NO;
                if ([self checkIfMoveThreatensKing:chessBoardArray :_origin :_destination] == NO) {
                    destinationOK = YES;
                }
                else {
                    destinationOK = NO;
                }
            }
            else {
                destinationOK = YES;
            }
        }
        else {
            destinationOK = NO;
        }
    }
    return destinationOK;
}

- (BOOL) checkBoundaries {
    BOOL result = NO;
    if (_destX > 0 && _destX < 9 && _destY > 0 && _destY < 9) {
        result = YES;
    }
    return result;
}

- (BOOL) checkDestination : (NSMutableArray *) chessBoardArray {
    
    Field *fieldOrigin = [[Field alloc] init];
    fieldOrigin = [chessBoardArray objectAtIndex:_origin];
    ChessFigure *chessFigureOrigin = fieldOrigin.chessFigure;
    
    if ([[chessBoardArray objectAtIndex:_destination] isEqual:[NSNull null]]) {
        return YES;
    }
    
    Field *fieldDestination = [chessBoardArray objectAtIndex:_destination];
    ChessFigure *chessFigureDestination = fieldDestination.chessFigure;
    if (chessFigureOrigin.team == chessFigureDestination.team) {
        return NO;
    }
    
    return YES;
}

- (BOOL) checkIfGapIsClear : (NSInteger) destination : (NSMutableArray *) chessBoardArray {
    if ([[chessBoardArray objectAtIndex:destination] isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}

- (BOOL) checkIfEnemyAtDestination : (NSInteger) origin : (NSInteger) destination : (NSMutableArray *) chessBoardArray {
    _origin = origin;
    _destination = destination;
    if (![[chessBoardArray objectAtIndex:_destination] isEqual:[NSNull null]]) {
        Field *originField = [chessBoardArray objectAtIndex:_origin];
        ChessFigure *chessFigureOrigin = originField.chessFigure;
        Field *destinationField = [chessBoardArray objectAtIndex:_destination];
        ChessFigure *chessFigureDestination = destinationField.chessFigure;
        if (chessFigureOrigin.team == chessFigureDestination.team) {
            return NO;
        }
        else {
            return YES;
        }
    }
    return NO;
}

- (BOOL) checkIfMoveThreatensKing : (NSMutableArray *) chessBoard : (NSInteger) origin : (NSInteger) destination {
    BOOL moveThreatensKing = NO;
    NSMutableArray *chessBoardArray = [[NSMutableArray alloc] initWithArray:chessBoard copyItems:YES];
    
    [self moveFrom:origin to:destination on:chessBoardArray];
    Field *allyField = [chessBoardArray objectAtIndex:destination];
    ChessFigure *allyFigure = allyField.chessFigure;
    
    for (int i = 0 ; i < 64 ; i++) {
        if ([chessBoardArray objectAtIndex:i] != [NSNull null]) {
            Field * field = [chessBoardArray objectAtIndex:i];
            ChessFigure *enemyFigure = field.chessFigure;
            if (enemyFigure.team != allyFigure.team) {
                NSMutableArray * destinationArray = [enemyFigure getValidDestinations:i:NO:chessBoardArray];
                for (int j = 0 ; j < [destinationArray count] ; j++) {
                    NSInteger enemyDestination = [[destinationArray objectAtIndex:j] integerValue];
                    if ([chessBoardArray objectAtIndex:enemyDestination] != [NSNull null]) {
                        Field *destinationField= [chessBoardArray objectAtIndex:enemyDestination];
                        ChessFigure * possibleKing = destinationField.chessFigure;
                        if (enemyFigure.team != possibleKing.team) {
                            if ([possibleKing isKindOfClass:King.class]) {
                                moveThreatensKing = YES;
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    return moveThreatensKing;
}

- (void) moveFrom : (NSInteger) origin to : (NSInteger) destination on : (NSMutableArray *) chessBoardArray {
    Field *field = [chessBoardArray objectAtIndex:origin];
    [chessBoardArray replaceObjectAtIndex:destination withObject:field];
    [chessBoardArray replaceObjectAtIndex:origin withObject:[NSNull null]];
}

@end
