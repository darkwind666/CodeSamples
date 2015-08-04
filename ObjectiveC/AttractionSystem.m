//
//  AttractionSystem.m
//  Rocket
//
//  Created by Администратор on 8/13/14.
//  Copyright (c) 2014 Саша. All rights reserved.
//

#import "AttractionSystem.h"
#import "AttractionComponent.h"
#import "RenderComponent.h"
#import "EntityManager.h"
#import "ObjectIdComponent.h"

#import "cocos2d.h"

@implementation AttractionSystem

-(void)update: (float) deltaTime {
    
    
    NSArray *entitiesWithAttraction = [self.entityManager getAllEntitiesForComponent:NSStringFromClass([AttractionComponent class])];
    
    for (NSNumber *entity in entitiesWithAttraction) {
        
        AttractionComponent *attractionComponent = [self.entityManager getComponent:NSStringFromClass([AttractionComponent class]) forEntity:entity];
        
        if (attractionComponent.attractivePower < 0.01f) {
            continue;
        }
        
        NSArray *entitiesWithObjectId = [self.entityManager getAllEntitiesForComponent:NSStringFromClass([ObjectIdComponent class])];
        
        NSArray *attractibleEntities = [self getAttractibleEntities: attractionComponent.attractivableTypes fromEntities: entitiesWithObjectId];
        
        
        [self attractEntities: attractibleEntities toEntity: entity];
        
    }
        
    
}

-(NSArray*)getAttractibleEntities: (NSArray*) attractivableTypes fromEntities: (NSArray*) aEntities {
    
    NSMutableArray *attractibleEntities = [NSMutableArray array];
    
    
    for (NSNumber *entity in aEntities) {
        
        ObjectIdComponent *objectIdComponent = [self.entityManager getComponent:NSStringFromClass([ObjectIdComponent class]) forEntity:entity];
        
        for (NSString *type in attractivableTypes) {
            
            NSString *objectType = objectIdComponent.objectType;
            
            if ([objectType isEqualToString:type]) {
                [attractibleEntities addObject:entity];
                break;
            }
            
        }
        
    }
    
    return attractibleEntities;
    
}

-(void)attractEntities: (NSArray*) attractibleEntities toEntity: (NSNumber*) entity {
    
    RenderComponent *renderComponent = [self.entityManager getComponent:NSStringFromClass([RenderComponent class]) forEntity:entity];
    
    AttractionComponent *attractionComponent = [self.entityManager getComponent:NSStringFromClass([AttractionComponent class]) forEntity:entity];
    
    CGPoint attractiveEntityPosition = renderComponent.render.position;
    
    for (NSNumber *attractibleEntity in attractibleEntities) {
        RenderComponent *renderComponent = [self.entityManager getComponent:NSStringFromClass([RenderComponent class]) forEntity:attractibleEntity];
        CGPoint oldEntityPosition = renderComponent.render.position;
        
        int distance = ccpDistance(attractiveEntityPosition, oldEntityPosition);
        
        if (distance <= attractionComponent.radius) {
            CGPoint difference = ccpSub(attractiveEntityPosition, oldEntityPosition);
            CGPoint direction = ccpNormalize(difference);
            CGPoint offset = ccpMult(direction, attractionComponent.attractivePower);
            CGPoint newEntityPosition = ccpAdd(oldEntityPosition,offset);
            renderComponent.render.position = newEntityPosition;
            
        }
        
    }
    
}

@end
