//
//  MoveListElement.m
//  MyChess
//
//  Created by gian on 15.08.17.
//
//

#import "MoveListElement.h"

@implementation MoveListElement : NSObject

- (id) init : (NSInteger) origin : (NSInteger) destination : (Field *) fieldOrigin : (Field *) fieldDestination {
    _origin = origin;
    _destination = destination;
    _fieldOrigin = fieldOrigin;
    _fieldDestination = fieldDestination;
    return self;
}

@end
