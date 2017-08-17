//
//  Field.m
//  MyChess
//
//  Created by gian on 30.05.17.
//
//

#import "Field.h"

@implementation Field

- (id) copyWithZone : (NSZone *) zone {
    Field *field = [[Field alloc] init];
    field.chessFigure = [_chessFigure copyWithZone: zone];

    
    return field;
}

@end
