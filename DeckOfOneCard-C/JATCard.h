//
//  JATCard.h
//  DeckOfOneCard-C
//
//  Created by Anthony Torres on 12/3/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JATCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic, copy, readonly) NSString *image;

-(instancetype)initWithSuit: (NSString *)suit
                      value: (NSString *)value
                      image: (NSString *)image;


@end

@interface JATCard (JSONConvertable)

-(instancetype)initWithDictionary: (NSDictionary<NSString *, id>*)dictionary;

@end


NS_ASSUME_NONNULL_END
