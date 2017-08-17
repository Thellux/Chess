//
//  AppDelegate.m
//  Chess
//
//  Created by gian on 30.05.17.
//  Copyright © 2017 RUAG. All rights reserved.
//

#import "AppDelegate.h"

ChessBoard * chessBoard;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    Team *white = [[Team alloc] init];
    Team *black = [[Team alloc] init];
    white.color = @"white";
    black.color = @"black";
    NSMutableArray *chessFigureArrayWhite = white.createWhiteChessFigures;
    NSMutableArray *chessFigureArrayBlack = black.createBlackChessFigures;
    chessBoard = [[ChessBoard alloc] init];
    for (int i = 0; i < 16; i++) {
        Field *field = [[Field alloc] init];
        field.chessFigure = [chessFigureArrayBlack objectAtIndex:i];
        [chessBoard.chessBoardArray insertObject:field atIndex:i];
    }
    for (int i = 0; i < 32; i++) {
        [chessBoard.chessBoardArray insertObject:[NSNull null] atIndex:i + 16];
    }
    for (int i = 0; i < 16; i++) {
        Field *field = [[Field alloc] init];
        field.chessFigure = [chessFigureArrayWhite objectAtIndex:i];
        [chessBoard.chessBoardArray insertObject:field atIndex:i + 48];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
