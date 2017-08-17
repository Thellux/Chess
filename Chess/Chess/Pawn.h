//
//  Pawn.h
//  MyChess
//
//  Created by gian on 29.05.17.
//
//

#import "ChessFigure.h"

@interface Pawn : ChessFigure

- (NSMutableArray *) getValidDestinations : (NSInteger) position : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoard;

- (id) copyWithZone : (NSZone *) zone;

@property NSMutableArray* chessBoardArray;

@end
