//
//  JATCardController.h
//  DeckOfOneCard-C
//
//  Created by Anthony Torres on 12/3/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JATCard.h"
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface JATCardController : NSObject

+ (JATCardController *)shared;


-(void)drawNewCards:(NSInteger)numberOfCards completionHandler:(void(^) (NSArray<JATCard *> *_Nullable))completion;

-(void)fetchImageFromCard:(JATCard *)card completionHandler:(void (^) (UIImage * _Nullable))completion;



@end

NS_ASSUME_NONNULL_END
