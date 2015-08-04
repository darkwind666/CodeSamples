//
//  StandartRocketViewDataSource.h
//  Rocket
//
//  Created by Администратор on 8/7/14.
//  Copyright (c) 2014 Саша. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RocketViewDataSource : NSObject 

-(id)initWithPlayer: (NSDictionary*)aPlayer viewPrefix: (NSString*) aViewPrefix details: (NSArray*) aDetails;

-(int)detailsCount;
-(NSString*)detailImageNameOnIndex: (int)aDetailIndex;
-(CGPoint)detailPositionOnIndex: (int)aDetailIndex;
-(CGPoint)detailAnchorPointOnIndex: (int)aDetailIndex;
-(int)detailZOrderOnIndex: (int)aDetailIndex;

@end
