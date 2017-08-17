//
//  Team.m
//  MyChess
//
//  Created by gian on 29.05.17.
//
//

#import "Team.h"

@implementation Team

-(NSMutableArray *)createBlackChessFigures
{
    Pawn *pawn01 = [[Pawn alloc] init:@"Pawn" color:@"black"];
    Pawn *pawn02 = [[Pawn alloc] init:@"Pawn" color:@"black"];
    Pawn *pawn03 = [[Pawn alloc] init:@"Pawn" color:@"black"];
    Pawn *pawn04 = [[Pawn alloc] init:@"Pawn" color:@"black"];
    Pawn *pawn05 = [[Pawn alloc] init:@"Pawn" color:@"black"];
    Pawn *pawn06 = [[Pawn alloc] init:@"Pawn" color:@"black"];
    Pawn *pawn07 = [[Pawn alloc] init:@"Pawn" color:@"black"];
    Pawn *pawn08 = [[Pawn alloc] init:@"Pawn" color:@"black"];
    
    Rook *rook01 = [[Rook alloc] init:@"Rook" color:@"black"];
    Rook *rook02 = [[Rook alloc] init:@"Rook" color:@"black"];
    
    Knight *knight01 = [[Knight alloc] init:@"Knight" color:@"black"];
    Knight *knight02 = [[Knight alloc] init:@"Knight" color:@"black"];
    
    Bishop *bishop01 = [[Bishop alloc] init:@"Bishop" color:@"black"];
    Bishop *bishop02 = [[Bishop alloc] init:@"Bishop" color:@"black"];
    
    Queen *queen01 = [[Queen alloc] init:@"Queen" color:@"black"];
    
    King *king01 = [[King alloc] init:@"King" color:@"black"];
    
    NSMutableArray *chessFigureArray = [[NSMutableArray alloc] init];
    
    [chessFigureArray insertObject:rook01 atIndex:0];
    [chessFigureArray insertObject:knight01 atIndex:1];
    [chessFigureArray insertObject:bishop01 atIndex:2];
    [chessFigureArray insertObject:queen01 atIndex:3];
    [chessFigureArray insertObject:king01 atIndex:4];
    [chessFigureArray insertObject:bishop02 atIndex:5];
    [chessFigureArray insertObject:knight02 atIndex:6];
    [chessFigureArray insertObject:rook02 atIndex:7];
    [chessFigureArray insertObject:pawn01 atIndex:8];
    [chessFigureArray insertObject:pawn02 atIndex:9];
    [chessFigureArray insertObject:pawn03 atIndex:10];
    [chessFigureArray insertObject:pawn04 atIndex:11];
    [chessFigureArray insertObject:pawn05 atIndex:12];
    [chessFigureArray insertObject:pawn06 atIndex:13];
    [chessFigureArray insertObject:pawn07 atIndex:14];
    [chessFigureArray insertObject:pawn08 atIndex:15];
    
    
    return chessFigureArray;
}

-(NSMutableArray *)createWhiteChessFigures
{
    Pawn *pawn01 = [[Pawn alloc] init:@"Pawn" color:@"white"];
    Pawn *pawn02 = [[Pawn alloc] init:@"Pawn" color:@"white"];
    Pawn *pawn03 = [[Pawn alloc] init:@"Pawn" color:@"white"];
    Pawn *pawn04 = [[Pawn alloc] init:@"Pawn" color:@"white"];
    Pawn *pawn05 = [[Pawn alloc] init:@"Pawn" color:@"white"];
    Pawn *pawn06 = [[Pawn alloc] init:@"Pawn" color:@"white"];
    Pawn *pawn07 = [[Pawn alloc] init:@"Pawn" color:@"white"];
    Pawn *pawn08 = [[Pawn alloc] init:@"Pawn" color:@"white"];
    
    Rook *rook01 = [[Rook alloc] init:@"Rook" color:@"white"];
    Rook *rook02 = [[Rook alloc] init:@"Rook" color:@"white"];
    
    Knight *knight01 = [[Knight alloc] init:@"Knight" color:@"white"];
    Knight *knight02 = [[Knight alloc] init:@"Knight" color:@"white"];
    
    Bishop *bishop01 = [[Bishop alloc] init:@"Bishop" color:@"white"];
    Bishop *bishop02 = [[Bishop alloc] init:@"Bishop" color:@"white"];
    
    Queen *queen01 = [[Queen alloc] init:@"Queen" color:@"white"];
    
    King *king01 = [[King alloc] init:@"King" color:@"white"];
    
    NSMutableArray *chessFigureArray = [[NSMutableArray alloc] init];
    
    [chessFigureArray insertObject:pawn01 atIndex:0];
    [chessFigureArray insertObject:pawn02 atIndex:1];
    [chessFigureArray insertObject:pawn03 atIndex:2];
    [chessFigureArray insertObject:pawn04 atIndex:3];
    [chessFigureArray insertObject:pawn05 atIndex:4];
    [chessFigureArray insertObject:pawn06 atIndex:5];
    [chessFigureArray insertObject:pawn07 atIndex:6];
    [chessFigureArray insertObject:pawn08 atIndex:7];
    [chessFigureArray insertObject:rook01 atIndex:8];
    [chessFigureArray insertObject:knight01 atIndex:9];
    [chessFigureArray insertObject:bishop01 atIndex:10];
    [chessFigureArray insertObject:queen01 atIndex:11];
    [chessFigureArray insertObject:king01 atIndex:12];
    [chessFigureArray insertObject:bishop02 atIndex:13];
    [chessFigureArray insertObject:knight02 atIndex:14];
    [chessFigureArray insertObject:rook02 atIndex:15];
    
    
    return chessFigureArray;
}


@end
