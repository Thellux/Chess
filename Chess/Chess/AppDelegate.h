//
//  AppDelegate.h
//  Chess
//
//  Created by gian on 30.05.17.
//  Copyright © 2017 RUAG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ChessBoard.h"
#import "Team.h"
#import "ChessFigure.h"
#import "Field.h"

extern ChessBoard * chessBoard;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

