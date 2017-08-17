//
//  ViewController.m
//  Chess
//
//  Created by gian on 30.05.17.
//  Copyright © 2017 RUAG. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ChessFigure.h"
#import "MoveListElement.h"

@interface ViewController ()
{
    NSArray *chessFigureImageArray;
}
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) NSMutableArray *imageViewArray;
@property (weak, nonatomic) IBOutlet UIStackView *stackView01;
@property (weak, nonatomic) IBOutlet UIStackView *stackView02;
@property (weak, nonatomic) IBOutlet UIStackView *stackView03;
@property (weak, nonatomic) IBOutlet UIStackView *stackView04;
@property (weak, nonatomic) IBOutlet UIStackView *stackView05;
@property (weak, nonatomic) IBOutlet UIStackView *stackView06;
@property (weak, nonatomic) IBOutlet UIStackView *stackView07;
@property (weak, nonatomic) IBOutlet UIStackView *stackView08;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end

@implementation ViewController

//Referencing and saving imageViews and stackViews----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- (void) setImageViewsToArray {
    
    self.imageViewArray = [[NSMutableArray alloc] initWithCapacity:64];
    
    for (int i = 0; i < 8 ; i++) {
        [_imageViewArray insertObject:[_stackView01.arrangedSubviews objectAtIndex:i] atIndex:i];
    }
    for (int i = 0; i < 8 ; i++) {
        [_imageViewArray insertObject:[_stackView02.arrangedSubviews objectAtIndex:i] atIndex:i+8];
    }
    for (int i = 0; i < 8 ; i++) {
        [_imageViewArray insertObject:[_stackView03.arrangedSubviews objectAtIndex:i] atIndex:i+16];
    }
    for (int i = 0; i < 8 ; i++) {
        [_imageViewArray insertObject:[_stackView04.arrangedSubviews objectAtIndex:i] atIndex:i+24];
    }
    for (int i = 0; i < 8 ; i++) {
        [_imageViewArray insertObject:[_stackView05.arrangedSubviews objectAtIndex:i] atIndex:i+32];
    }
    for (int i = 0; i < 8 ; i++) {
        [_imageViewArray insertObject:[_stackView06.arrangedSubviews objectAtIndex:i] atIndex:i+40];
    }
    for (int i = 0; i < 8 ; i++) {
        [_imageViewArray insertObject:[_stackView07.arrangedSubviews objectAtIndex:i] atIndex:i+48];
    }
    for (int i = 0; i < 8 ; i++) {
        [_imageViewArray insertObject:[_stackView08.arrangedSubviews objectAtIndex:i] atIndex:i+56];
    }
}


//Resizing Methods------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- (void) resizeAll {
    
    //StackViews
    
    [self resizeStackView:_stackView01];
    [self resizeStackView:_stackView02];
    [self resizeStackView:_stackView03];
    [self resizeStackView:_stackView04];
    [self resizeStackView:_stackView05];
    [self resizeStackView:_stackView06];
    [self resizeStackView:_stackView07];
    [self resizeStackView:_stackView08];
    
    //ChessFigures
    
    [self resizeChessFigures];
    
    //ChessBoard Image
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    _backgroundImage.frame = CGRectMake(0, 20, screenWidth, screenWidth);
}

- (void) resizeStackView : (UIStackView *) stackView {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat stackViewHeight = screenWidth / 8;
    stackView.frame = CGRectMake(0,0, screenWidth, stackViewHeight);
}

- (void) resizeChessFigures {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat imageViewSize = screenWidth / 8;
    UIImageView *imageView;
    for (int i = 0; i<64; i++) {
        imageView = [_imageViewArray objectAtIndex:i];
        imageView.frame = CGRectMake(0, 0, imageViewSize, imageViewSize);
    }
}

//Setting up ChessBoard-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- (void) setIdAndPosition {
    for (int i = 0; i < 64; i++) {
        if ([[chessBoard.chessBoardArray objectAtIndex:i] isEqual:[NSNull null]]) {
        }
        else {
            Field *field = [chessBoard.chessBoardArray objectAtIndex:i];
            ChessFigure *chessFigure = field.chessFigure;
            
            if ([chessFigure.team  isEqual: @"white"]) {
                
                if ([chessFigure isKindOfClass:[Pawn class]]) {
                    [self setImage: 0 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[Rook class]]) {
                    [self setImage: 1 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[Knight class]]) {
                    [self setImage: 2 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[Bishop class]]) {
                    [self setImage: 3 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[Queen class]]) {
                    [self setImage: 4 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[King class]]) {
                    [self setImage: 5 atPosition: i];
                }
            }
            if ([chessFigure.team  isEqual: @"black"]) {
                
                if ([chessFigure isKindOfClass:[Pawn class]]) {
                    [self setImage: 6 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[Rook class]]) {
                    [self setImage: 7 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[Knight class]]) {
                    [self setImage: 8 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[Bishop class]]) {
                    [self setImage: 9 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[Queen class]]) {
                    [self setImage: 10 atPosition: i];
                }
                if ([chessFigure isKindOfClass:[King class]]) {
                    [self setImage: 11 atPosition: i];
                }
            }
        }
    }
}


- (void) setImage : (NSInteger) imageID  atPosition : (NSInteger) positionID {
    
    UIImageView *myImageView;
    UIImage *myImage;
    NSString *imageName;
    
    myImageView = [_imageViewArray objectAtIndex:positionID];
    imageName = [chessFigureImageArray objectAtIndex:imageID];
    myImage = [UIImage imageNamed:imageName];
    [myImageView setImage:myImage];
    
}

- (void) removeImageAtPosition : (NSInteger) positionID {
    
    UIImageView *myImageView;
    UIImage *myImage;
    
    myImageView = [_imageViewArray objectAtIndex:positionID];
    [myImageView setImage:myImage];
    
}

- (void) highlightImageAtPosition : (NSInteger) positionID {
    
    UIImageView *myImageView = [_imageViewArray objectAtIndex:positionID];
    
    if (myImageView.backgroundColor == [UIColor clearColor]) {
        myImageView.backgroundColor = [UIColor colorWithRed:157/255.0 green:128/255.0 blue:213/255.0 alpha:1]; //157 128 213
    }
    
    else {
        myImageView.backgroundColor = [UIColor clearColor];
    }
}

- (void) move : (NSInteger) origin : (NSInteger) destination {
    
    Field *field = [chessBoard.chessBoardArray objectAtIndex:origin];
    [chessBoard.chessBoardArray replaceObjectAtIndex:destination withObject:field];
    [chessBoard.chessBoardArray replaceObjectAtIndex:origin withObject:[NSNull null]];
    ChessFigure *chessFigure = field.chessFigure;
    
    if ([chessFigure.team  isEqual: @"white"]) {
        if ([chessFigure isKindOfClass:[Pawn class]]) {
            [self setImage: 0 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[Rook class]]) {
            [self setImage: 1 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[Knight class]]) {
            [self setImage: 2 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[Bishop class]]) {
            [self setImage: 3 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[Queen class]]) {
            [self setImage: 4 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[King class]]) {
            [self setImage: 5 atPosition: destination];
        }
    }
    
    if ([chessFigure.team  isEqual: @"black"]) {
        
        if ([chessFigure isKindOfClass:[Pawn class]]) {
            [self setImage: 6 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[Rook class]]) {
            [self setImage: 7 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[Knight class]]) {
            [self setImage: 8 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[Bishop class]]) {
            [self setImage: 9 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[Queen class]]) {
            [self setImage: 10 atPosition: destination];
        }
        if ([chessFigure isKindOfClass:[King class]]) {
            [self setImage: 11 atPosition: destination];
        }
    }
    [self removeImageAtPosition:origin];
}

//Action Events---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- (void) selectOrigin : (UIGestureRecognizer *) recognizer {
    //check if king is threatened
    
    _origin = recognizer.view.tag - 1;
    
    [self removeAllOnClickEventsExcept:&(_origin)];
    
    Field *field = [chessBoard.chessBoardArray objectAtIndex:_origin];
    ChessFigure *chessFigure = field.chessFigure;
    _possibleDestinations = [chessFigure getValidDestinations : _origin : YES : chessBoard.chessBoardArray];
    
    if ([_possibleDestinations count] == 0) {
        [self removeAllOnClickEventsExcept:&(_origin)];
        [self resetOnClickEvents];
    }
    else {
        //display possible destinations
        for (int i = 0 ; i < [_possibleDestinations count] ; i++) {
            NSNumber *nmb = [_possibleDestinations objectAtIndex:i];
            NSInteger positionID = [nmb integerValue];
            NSLog(@"Possible destination: %li", (long)positionID);
            //highlight every possible destination
            [self highlightImageAtPosition:positionID];
            //Get ImageView to set selectDestinationListener
            UIImageView *myImageView = [_imageViewArray objectAtIndex:positionID];
            //setting destination listener
            UITapGestureRecognizer *endMove =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectDestination:)];
            [endMove setNumberOfTapsRequired:1];
            [myImageView addGestureRecognizer:endMove];
        }
        UIImageView *myImageView = [_imageViewArray objectAtIndex:_origin];
        [self removeOnClick : myImageView : recognizer];
        UITapGestureRecognizer *abortMove =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetOnClickEvents:)];
        [abortMove setNumberOfTapsRequired:1];
        [myImageView addGestureRecognizer:abortMove];
    }
}

- (void) selectDestination : (UIGestureRecognizer *) recognizer {
    _destination = recognizer.view.tag - 1;
    
    for (int i = 0 ; i < [_possibleDestinations count] ; i++) {
        NSNumber *nmb = [_possibleDestinations objectAtIndex:i];
        NSInteger positionID = [nmb integerValue];
        //unhighlight possible destinations again
        [self highlightImageAtPosition:positionID];
    }
    
    if (_move < _moveArray.count) {
        for (int i = 0; i < (_moveArray.count) - _move; i++) {
            MoveListElement * toBeRemoved = _moveArray.lastObject;
            [_moveArray removeObject:toBeRemoved];
        }
    }
    
    Field *fieldOrigin = [chessBoard.chessBoardArray objectAtIndex:_origin];
    Field *fieldDestination = [chessBoard.chessBoardArray objectAtIndex:_destination];
    ChessFigure *usedChessFigure = fieldOrigin.chessFigure;
    NSString *team = usedChessFigure.team;
    _lastRoundActor = team;
    MoveListElement * moveListElement = [[MoveListElement alloc] init:_origin:_destination:fieldOrigin:fieldDestination];
    [_moveArray insertObject:moveListElement atIndex:_move];
    _move = _move + 1;
    [self move : _origin : _destination];
    NSString *enemyTeam;
    if ([team isEqual:@"white"]) {
        enemyTeam = @"black";
    }
    else {
        enemyTeam = @"white";
    }
    BOOL movesPossible = [self movesPossible:enemyTeam];
    if (movesPossible == NO) {
        NSLog(@"Game over, winner is %@", _lastRoundActor);
    }
    [self resetOnClickEvents];
}

- (void) resetOnClickEvents : (UIGestureRecognizer *) recognizer {
    
    if ([_lastRoundActor isEqual:[NSNull null]]) {
        Field *field = [chessBoard.chessBoardArray objectAtIndex:_origin];
        NSString *team = field.chessFigure.team;
        if ([team  isEqual: @"white"]) {
            _lastRoundActor = @"black";
        }
        else if ([team isEqual: @"black"]) {
            _lastRoundActor = @"white";
        }
        else {
            NSLog(@"Error, could not reset OnClickEvents, team of chessfigure is neither white nor black.");
        }
    }

    [self resetOnClickEvents];

}

- (void) resetOnClickEvents{

    for (int i = 0; i < 64; i++) {
        UIImageView *myImageView = [_imageViewArray objectAtIndex:i];
        myImageView.backgroundColor = [UIColor clearColor];
        myImageView.userInteractionEnabled = YES;
        for (UIGestureRecognizer *gr in myImageView.gestureRecognizers) {
            [myImageView removeGestureRecognizer:gr];
        }
        if (![[chessBoard.chessBoardArray objectAtIndex:i] isEqual:[NSNull null]]) {
            Field *field = [chessBoard.chessBoardArray objectAtIndex:i];
            NSString *team = field.chessFigure.team;
            
            if ([_lastRoundActor isEqual:team]) {
                //do not set actions
            }
            else {
                UITapGestureRecognizer *startMove =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectOrigin:)];
                [startMove setNumberOfTapsRequired:1];
                [myImageView addGestureRecognizer:startMove];
            }
        }
        else {
            NSLog(@"NULL at %i",i);
        }
    }
}

- (void) removeAllOnClickEventsExcept : (NSInteger *) sparedField {
    
    for (int i = 0 ; i < 64 ; i++) {
        NSInteger *myInt = &i;
        UIImageView *myImageView = [_imageViewArray objectAtIndex:i];
        myImageView.backgroundColor = [UIColor clearColor];
        myImageView.userInteractionEnabled = YES;
        if (sparedField != myInt) {
            for (UIGestureRecognizer *gr in myImageView.gestureRecognizers) {
                [myImageView removeGestureRecognizer:gr];
            }
        }
    }
}

- (void) removeOnClick : (UIImageView*) imageView : (UIGestureRecognizer*) recognizer {

    [imageView removeGestureRecognizer:recognizer];

}

- (IBAction) previousMove {
    [self checkIfMoveIndexIsCorrect];
    if (_previousMoveIsEnabled == YES) {
        [self switchLastRoundActor];
        _move = _move -1;
        MoveListElement * mle = [_moveArray objectAtIndex:_move];
        
        Field * originField = mle.fieldOrigin;
        Field * destinationField = mle.fieldDestination;
        NSInteger origin = mle.origin;
        NSInteger destination = mle.destination;
        
        ChessFigure * movedChessFigure = originField.chessFigure;
        ChessFigure * removedChessFigure;
        
        if (![destinationField isEqual : [NSNull null]]) {
            removedChessFigure = destinationField.chessFigure;
            [chessBoard.chessBoardArray replaceObjectAtIndex:destination withObject:destinationField];
            [self setChessFigureImageByChessFigure:removedChessFigure andPosition:destination];
        }
        else {
            [chessBoard.chessBoardArray replaceObjectAtIndex:destination withObject:[NSNull null]];
            [self removeImageAtPosition:destination];
        }
        [chessBoard.chessBoardArray replaceObjectAtIndex:origin withObject:originField];
        [self setChessFigureImageByChessFigure:movedChessFigure andPosition:origin];
        [self resetOnClickEvents];
    }
}


- (IBAction) nextMove {
    [self checkIfMoveIndexIsCorrect];
    if (_nextMoveIsEnabled == YES) {
        [self switchLastRoundActor];
        MoveListElement * mle = [_moveArray objectAtIndex:_move];
        Field * newDestinationField = mle.fieldOrigin;
        NSInteger origin = mle.origin;
        NSInteger destination = mle.destination;
        ChessFigure * chessFigure = newDestinationField.chessFigure;
        [chessBoard.chessBoardArray replaceObjectAtIndex:destination withObject:newDestinationField];
        [chessBoard.chessBoardArray replaceObjectAtIndex:origin withObject:[NSNull null]];
        [self setChessFigureImageByChessFigure:chessFigure andPosition:destination];
        [self removeImageAtPosition:origin];
        _move = _move + 1;
        [self resetOnClickEvents];
    }
}

- (void) checkIfMoveIndexIsCorrect {
    if (_move <= 0) {
        _previousMoveIsEnabled = NO;
    }
    else {
        _previousMoveIsEnabled = YES;
    }
    if (_move == _moveArray.count) {
        _nextMoveIsEnabled = NO;
    }
    else {
        _nextMoveIsEnabled = YES;
    }
}

- (void) switchLastRoundActor {
    if ([_lastRoundActor  isEqual: @"white"]) {
        _lastRoundActor = @"black";
    }
    else {
        _lastRoundActor = @"white";
    }
}

- (BOOL) movesPossible : (NSString *) team {
    BOOL movesArePossible = NO;
    for (int i = 0; i < 64; i++) {
        Field * field = [chessBoard.chessBoardArray objectAtIndex:i];
        if (![field isEqual:[NSNull null]]){
            ChessFigure * chessFigure = field.chessFigure;
            if ([chessFigure.team isEqual:team]) {
                NSMutableArray * validDestination = [chessFigure getValidDestinations:i :YES :chessBoard.chessBoardArray];
                if (validDestination.count > 0) {
                    movesArePossible = YES;
                    break;
                }
            }
        }
    }
    return movesArePossible;
}

- (void) setChessFigureImageByChessFigure : (ChessFigure *) chessFigure andPosition: (NSInteger) position {
    if ([chessFigure.team  isEqual: @"white"]) {
        if ([chessFigure isKindOfClass:[Pawn class]]) {
            [self setImage: 0 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[Rook class]]) {
            [self setImage: 1 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[Knight class]]) {
            [self setImage: 2 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[Bishop class]]) {
            [self setImage: 3 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[Queen class]]) {
            [self setImage: 4 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[King class]]) {
            [self setImage: 5 atPosition: position];
        }
    }
    
    if ([chessFigure.team  isEqual: @"black"]) {
        
        if ([chessFigure isKindOfClass:[Pawn class]]) {
            [self setImage: 6 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[Rook class]]) {
            [self setImage: 7 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[Knight class]]) {
            [self setImage: 8 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[Bishop class]]) {
            [self setImage: 9 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[Queen class]]) {
            [self setImage: 10 atPosition: position];
        }
        if ([chessFigure isKindOfClass:[King class]]) {
            [self setImage: 11 atPosition: position];
        }
    }
}


//Basic apple methods---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- (void) viewDidLoad {
    [super viewDidLoad];
    [self setImageViewsToArray]; 
    chessFigureImageArray = [NSArray arrayWithObjects:  @"white_pawn",
                                                        @"white_rook",
                                                        @"white_knight",
                                                        @"white_bishop",
                                                        @"white_queen",
                                                        @"white_king",
                                                        @"black_pawn",
                                                        @"black_rook",
                                                        @"black_knight",
                                                        @"black_bishop",
                                                        @"black_queen",
                                                        @"black_king",
                                                        nil];

    [self resizeAll];
    [self setIdAndPosition];
    [self resetOnClickEvents];
    _move = 0;
    _moveArray = [[NSMutableArray alloc] init];
    }

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
