//
//  JATCardController.m
//  DeckOfOneCard-C
//
//  Created by Anthony Torres on 12/3/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

#import "JATCardController.h"
#import "JATCard.h"

@implementation JATCardController

+ (JATCardController *) shared {
    static JATCardController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [JATCardController new];
    });
    return shared;
}

static NSString *const baseURLString = @"https://deckofcardsapi.com/api/deck/new";

- (void)drawNewCards:(NSInteger)numberOfCards completionHandler:(void (^)(NSArray<JATCard *> * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:baseURLString];
    NSString *cardCount = [@(numberOfCards) stringValue];
    NSURL *drawURL = [url URLByAppendingPathComponent:@"draw/"];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    NSURL *finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error:: %@, %@", error, [error localizedDescription]);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            if (!result)
            {
                NSLog(@"Error parsing the JSON %@", error);
                completion(nil);
                return;
            }
            
            NSArray *resultArray = result[@"cards"];
            NSMutableArray *cardsArray = [NSMutableArray<JATCard *> new];
            
            for (NSDictionary *dictionary in resultArray) {
                JATCard *card = [[JATCard alloc] initWithDictionary:dictionary];
                [cardsArray addObject:card];
            }
            completion(cardsArray);
        }
    }]resume];
}

- (void)fetchImageFromCard:(JATCard *)card completionHandler:(void (^)(UIImage *))completion {
    NSURL *imageURL = [NSURL URLWithString:card.image];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response) {
            NSLog(@"%@", response);
        }
        
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        }
    }] resume];
}

@end
