//
//  StandartRocketViewDataSource.m
//  Rocket
//
//  Created by Администратор on 8/7/14.
//  Copyright (c) 2014 Саша. All rights reserved.
//

#import "RocketViewDataSource.h"
#import "Constants.h"
#import "ScreenElementsDataSource.h"
#import "NSObject+UsefulMethods.h"
#import "CGPointExtension.h"

@implementation RocketViewDataSource {
    
    ScreenElementsDataSource *_screenElementsDataSource;
    NSString *_viewPrefix;
    NSDictionary *_player;
    NSArray *_details;
    
}

-(id)initWithPlayer: (NSDictionary*)aPlayer viewPrefix: (NSString*) aViewPrefix details: (NSArray*) aDetails {
    
    if (self = [super init]) {
        
        _details = aDetails;
        _viewPrefix = aViewPrefix;
        _player = aPlayer;
        _screenElementsDataSource = [ScreenElementsDataSource sharedScreenElementsDataSource];
    }
    
    return self;
    
}


-(int)detailsCount {
    
    return [_details count];
    
}

-(NSString*)detailImageNameOnIndex: (int)aDetailIndex {
    
    NSString *detail = _details[aDetailIndex];
    NSString *detailNameInPlayer = [NSObject loweraseOnlyFirstLaterOfString:detail];
    NSString *detailKey = [detail capitalizedString];
    int playerType = [_player[detailNameInPlayer]intValue];
    NSString *imageName = [NSString stringWithFormat:@"%@%i%@.png", detailKey, playerType, _viewPrefix];
    return imageName;
    
}

-(CGPoint)detailAnchorPointOnIndex: (int)aDetailIndex {
    
    NSString *detailKey = _details[aDetailIndex];
    NSDictionary *detailData = [_screenElementsDataSource getElementData:detailKey];
    CGPoint anchorPoint = [detailData[detailsAnchorPointKey]CGPointValue];
    return anchorPoint;
    
}

-(CGPoint)detailPositionOnIndex: (int)aDetailIndex {
    
    NSString *detailKey = _details[aDetailIndex];
    NSDictionary *detailData = [_screenElementsDataSource getElementData:detailKey];
    CGPoint position = [detailData[_viewPrefix]CGPointValue];
    return position;
    
}

-(int)detailZOrderOnIndex: (int)aDetailIndex {
    
    NSString *detailKey = _details[aDetailIndex];
    int detailZOrder = [_screenElementsDataSource getElementZOrder:detailKey];
    return detailZOrder;
    
}

@end
