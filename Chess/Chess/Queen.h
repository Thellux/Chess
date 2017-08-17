//
//  Queen.h
//  MyChess
//
//  Created by gian on 30.05.17.
//
//

#import "ChessFigure.h"

@interface Queen : ChessFigure

- (NSMutableArray *) getValidDestinations : (NSInteger) position : (BOOL) kingIsThreatenedCheck : (NSMutableArray *) chessBoard;

- (id) copyWithZone : (NSZone *) zone;

@property NSMutableArray* chessBoardArray;

@end
