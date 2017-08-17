//
//  Team.h
//  MyChess
//
//  Created by gian on 29.05.17.
//
//

#import <Foundation/Foundation.h>
#import "ChessFigure.h"
#import "Pawn.h"
#import "Rook.h"
#import "Knight.h"
#import "Bishop.h"
#import "Queen.h"
#import "King.h"

@interface Team : NSObject

@property NSString *color;

-(NSMutableArray *)createWhiteChessFigures;
-(NSMutableArray *)createBlackChessFigures;

@end
