//
//  Field.h
//  MyChess
//
//  Created by gian on 30.05.17.
//
//

#import <Foundation/Foundation.h>
#import "ChessFigure.h"

@interface Field : NSObject

@property ChessFigure* chessFigure;

- (id) copyWithZone : (NSZone *) zone;

@end
