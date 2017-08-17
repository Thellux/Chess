//
//  MoveListElement.h
//  MyChess
//
//  Created by gian on 15.08.17.
//
//

#import <Foundation/Foundation.h>
#import "Field.h"

@interface MoveListElement : NSObject

- (id) init : (NSInteger) origin : (NSInteger) destination : (Field *) fieldOrigin : (Field *) fieldDestination;

@property NSInteger origin;
@property NSInteger destination;
@property Field* fieldOrigin;
@property Field* fieldDestination;

@end
