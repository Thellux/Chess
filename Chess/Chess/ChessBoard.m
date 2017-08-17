//
//  ChessBoard.m
//  MyChess
//
//  Created by gian on 29.05.17.
//
//

#import "ChessBoard.h"

@implementation ChessBoard

-(id)init{
    self = [super init];
    if (self!=nil){
        self.chessBoardArray = [[NSMutableArray alloc]initWithCapacity:64];
    }
    return self;
}

@end
